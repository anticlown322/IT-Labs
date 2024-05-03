Unit uTCipherEng;

Interface

Uses
    System.Generics.Collections; // for TList

Type
    TCipherEng = Class
    Private Const
        MAX_PROD = 65536; // %1111_1111_1111_1111; // max p*q production  = 2^16
        MIN_PROD = 256;

    Var
        Function IsPrime(Num: Integer): Boolean;
        Function FindGCD(Const A, B: Integer): Integer;

    Public
        FInpData: TArray<Byte>; // input file content
        FPValue: Integer; // p value
        FQValue: Integer; // q value
        FModuleValue: Integer; // module = p*q
        FPhiValue: Integer; // phi(n) = (p-1)*(q-1)
        FExponentValue: Integer; // remember, that gcd(e, phi(n)) = 1
        FPrivateKey: Integer; // d = e^-1 mod phi(n)
        FByteText: TList<Integer>; // list of (2 byte max value) numbers
        FAnswer: TArray<Byte>; // algorithm answer content
        //
        Function PowMod(Const Num, Power, Module: Integer): Integer; // Fast power -> result = Num^Power mod Module
        Function FindGCDExtended(Const A, B: Integer): TArray<Integer>; // uses Extended Euclide Algorithm
        Function EncryptRSA(Const P, Q, Exponenta: Integer; InpData: TArray<Byte>): Boolean;
        Function DecryptRSA(Const Module, Key: Integer; InpData: TArray<Byte>): Boolean;
        //
        Constructor Create;
        Destructor Destroy; Override;
    End;

Implementation

{ private methods }

Function TCipherEng.IsPrime(Num: Integer): Boolean;
Var
    I: Integer;
Begin
    Result := True;
    If Num < 2 Then
        Result := False
    Else
    Begin
        I := 2;

        While (I < Num Div 2) And Result Do // or (i < num shr 1) and !result
        Begin
            Result := Not(Num Mod I = 0);
            Inc(I);
        End;
    End;
End;

Function TCipherEng.FindGCD(Const A, B: Integer): Integer;
Begin
    If (B Mod A) = 0 Then
        Result := A
    Else
        Result := FindGCD(B, A Mod B);
End;

Function TCipherEng.FindGCDExtended(Const A, B: Integer): TArray<Integer>;
Var
    TempA, TempB: Integer;
    S1, S2, T1, T2, R: Integer;
    TempS, TempR, Quotient: Integer;
Begin
    TempA := A;
    TempB := B;
    S1 := 1;
    S2 := 0;
    T1 := 0;
    T2 := 1;

    While TempB <> 0 Do
    Begin
        Quotient := TempA Div TempB;
        R := TempA Mod TempB;
        TempA := TempB;
        TempB := R;

        TempS := S1 - S2 * Quotient;
        S1 := S2;
        S2 := TempS;

        TempR := T1 - T2 * Quotient;
        T1 := T2;
        T2 := TempR;
    End;

    SetLength(Result, 3);

    Result[0] := S2;
    If S1 < 0 Then
        Result[1] := S1 + A
    Else
        Result[1] := S1;

    If Result[1] < 0 Then
        Result[1] := S1 + S2;

    Result[2] := TempA;
End;

Function TCipherEng.PowMod(Const Num, Power, Module: Integer): Integer;
Var
    TempNum, TempPower: Integer;
Begin
    TempNum := Num;
    TempPower := Power;
    Result := 1;

    While TempPower <> 0 Do
    Begin
        While (TempPower Mod 2) = 0 Do
        Begin
            TempPower := TempPower Div 2;
            TempNum := (TempNum * TempNum) Mod Module;
        End;
        Dec(TempPower);
        Result := (Result * TempNum) Mod Module;
    End
End;

{ public methods }

Function TCipherEng.EncryptRSA(Const P, Q, Exponenta: Integer; InpData: TArray<Byte>): Boolean;
Var
    EncryptedByte, J: Integer; // actual size is 2 bytes
    TempArr: TArray<Integer>;
Begin
    Result := IsPrime(P) And IsPrime(Q) And (Length(InpData) > 0);

    If Result Then
    Begin
        FPValue := P;
        FQValue := Q;
        FExponentValue := Exponenta;
        FModuleValue := FPValue * FQValue;
        FPhiValue := (FPValue - 1) * (FQValue - 1);
        TempArr := FindGCDExtended(Exponenta, FPhiValue);
        // TempArr[0] - x1
        // TempArr[1] - y1
        // TempArr[2] - d1
        Result := (Exponenta < FPhiValue) And (TempArr[2] = 1) And (FModuleValue < MAX_PROD) And
            (FModuleValue > MIN_PROD);

        If Result Then
        Begin
            // y1 = d = privateKey
            FPrivateKey := TempArr[1];

            // encryption
            FInpData := InpData;
            SetLength(FAnswer, 2 * Length(FInpData));
            FByteText.Clear;

            J := 0;
            For Var I := Low(FInpData) To High(FInpData) Do
            Begin
                EncryptedByte := PowMod(FinpData[I], FPrivateKey, FModuleValue);
                FAnswer[J] := EncryptedByte And 255; // %0000_0000_0000_0000_0000_0000_1111_11111;
                Inc(J);
                FAnswer[J] := (EncryptedByte Shr 8) And 255; // %0000_0000_0000_0000_1111_1111_0000_0000;

                FByteText.Add(Word(EncryptedByte));
                Inc(J);
            End;
        End;
    End;
End;

Function TCipherEng.DecryptRSA(Const Module, Key: Integer; InpData: TArray<Byte>): Boolean;
Var
    EncryptedByte, DecryptedByte, I, J: Integer;
Begin
    Result := (Module < MAX_PROD) And (Module > MIN_PROD);

    If Result Then
    Begin
        FInpData := InpData;
        SetLength(FAnswer, Length(FInpData) Div 2);
        FByteText.Clear;

        J := 0;
        I := 0;

        While (I < High(FInpData)) Do
        Begin
            EncryptedByte := InpData[I] Or (InpData[I + 1] Shl 8);
            DecryptedByte := PowMod(EncryptedByte, Key, Module);
            If DecryptedByte > 255 Then
            Begin
                Result := False;
                Exit;
            End;
            FAnswer[J] := DecryptedByte;
            FByteText.Add(FAnswer[J]);
            Inc(J);
            Inc(I, 2);
        End;
    End;
End;

{ public methods }

Constructor TCipherEng.Create;
Begin
    FByteText := TList<Integer>.Create;
End;

Destructor TCipherEng.Destroy;
Begin
    FByteText.Free;
    Inherited;
End;

End.
