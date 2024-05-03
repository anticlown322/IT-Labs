Unit uTCipherEng;

Interface

Type
    Bit8 = Array [0 .. 7] Of Boolean; // Maybe TBits is better
    BINData = Array Of Bit8;

    TCipherEng = Class
    Private Const
        // degrees of polynomial. Each is (value - 1). Original pol. is x^34 + x^15 + x^14 + x + 1
        DEGREE_1 = 33;
        DEGREE_2 = 14;
        DEGREE_3 = 13;
        DEGREE_4 = 0;

    Var
        FStartRegister: Int64;
        FRawData: BINData;
        FGeneratedKey: BINData;
        FBinaryResult: BINData;
        //
        Procedure TranslateBytesToBINData(InputData: TArray<Byte>);
        Function ShiftLeft(Var RegValue: Int64): Boolean;
        Procedure GenerateKey;
        Procedure UseAlg;
        Function TranslateBinToStr: String;
    Public
        Property Reg: Int64 Read FStartRegister;
        Property RawBinData: BINData Read FGeneratedKey;
        Property BinKey: BINData Read FGeneratedKey;
        Property BinResult: BINData Read FBinaryResult;
        //
        Function TranslateStrToReg(Const Str: String): Boolean;
        Procedure CalcAns(InputData: TArray<Byte>);
        Function TranslateBINDataToBytes(Const Bin: BINData): TArray<Byte>;
        //
        Constructor Create;
        Destructor Destroy; Override;
    End;

Implementation

{ private methods }

Procedure TCipherEng.TranslateBytesToBINData(InputData: TArray<Byte>);
Begin
    SetLength(FRawData, Length(InputData));
    For Var I := Low(InputData) To High(InputData) Do
        For Var Offset := 0 To 7 Do
            FRawData[I, Offset] := ((InputData[I] Shr Offset) And 1) <> 0;
End;

Function TCipherEng.ShiftLeft(Var RegValue: Int64): Boolean;
Var
    Counter, I, Exp: Integer;
Begin
    Counter := 0;
    { 1 is integer by default, with degree 32+ will get integer overflow. So typecast is necessary }
    Result := (RegValue And (Int64(1) Shl DEGREE_1)) <> 0;

    If (RegValue And (Int64(1) Shl DEGREE_1)) <> 0 Then
        Inc(Counter);
    If (RegValue And (Int64(1) Shl DEGREE_2)) <> 0 Then
        Inc(Counter);
    If (RegValue And (Int64(1) Shl DEGREE_3)) <> 0 Then
        Inc(Counter);
    If (RegValue And (Int64(1) Shl DEGREE_4)) <> 0 Then
        Inc(Counter);

    RegValue := RegValue Shl Int64(1);
    RegValue := (RegValue And (Int64(1) Shl (DEGREE_1 + 1) - 1));

    If (Counter And 1) <> 0 Then
        RegValue := RegValue Or Int64(1)
    Else
        RegValue := RegValue And Not(Int64(1));
End;

Procedure TCipherEng.GenerateKey;
Var
    RegValue: Int64;
Begin
    RegValue := FStartRegister;
    Setlength(FGeneratedKey, Length(FRawData));

    For Var I := Low(FGeneratedKey) To High(FGeneratedKey) Do
        For Var J := 0 To 7 Do
            FGeneratedKey[I, J] := ShiftLeft(RegValue);
End;

Procedure TCipherEng.UseAlg;
Begin
    SetLength(FBinaryResult, Length(FRawData));

    For Var I := Low(FBinaryResult) To High(FBinaryResult) Do
        For Var J := 0 To 7 Do
            FBinaryResult[I, J] := FRawData[I, J] Xor FGeneratedKey[I, J];
End;

Function TCipherEng.TranslateBinToStr: String;
Begin
    For Var I := Low(FBinaryResult) To High(FBinaryResult) Do
        For Var J := 0 To 7 Do
            If FBinaryResult[I, J] Then // or Result := IntToStr(Integer(Bin[I][J])); instead of if statement
                Result := Result + '1'
            Else
                Result := Result + '0';
End;

{ public methods }

Function TCipherEng.TranslateStrToReg(Const Str: String): Boolean;
Var
    Counter, I: Integer;
    RegValue: Int64;
    RefactoredStr: String;
Begin
    Counter := 0;
    RegValue := 0; // fill all bits with zeros
    RefactoredStr := '';

    For I := 1 To Length(Str) Do
        If (Str[I] = '0') Or (Str[I] = '1') Then
            RefactoredStr := RefactoredStr + Str[I];

    I := 1;
    While (Counter <= DEGREE_1) And (I <= Length(RefactoredStr)) Do
    Begin
        Inc(Counter);

        If RefactoredStr[I] = '1' Then
            RegValue := RegValue Or (Int64(1) Shl Counter - 1);
        { 1 is integer by default, with degree 32+ will get integer overflow. So typecast is necessary }
        Inc(I);
    End;

    Result := Counter = DEGREE_1 + 1;

    If Result Then
        FStartRegister := RegValue;
End;

Procedure TCipherEng.CalcAns(InputData: TArray<Byte>);
Var
    RegValue: Int64;
Begin
    TranslateBytesToBINData(InputData);
    RegValue := FStartRegister;
    GenerateKey;
    UseAlg;
End;

Function TCipherEng.TranslateBINDataToBytes(Const Bin: BINData): TArray<Byte>;
Begin
    SetLength(Result, Length(Bin));
    For Var I := Low(Result) To High(Result) Do
        For Var Offset := 0 To 7 Do
            If Bin[I, Offset] Then
                Result[I] := Result[I] Or (1 Shl Offset);
End;

Constructor TCipherEng.Create;
Begin
    FStartRegister := 0;
    SetLength(FRawData, 0);
    SetLength(FGeneratedKey, 0);
    SetLength(FBinaryResult, 0);
End;

Destructor TCipherEng.Destroy;
Begin
    Inherited;
End;

End.
