Unit uTCipherEng;

Interface

Uses
    Classes;

Type
    TCipherType = (None = 0, CtGrille, CtVigenere);

    TCipherEng = Class
    Private
        FCipherType: TCipherType;
        FText: String;
        FKey: String;
        FAnswer: String;
    Public
        Property CipherType: TCipherType Read FCipherType Write FCipherType;
        Property Text: String Read FText Write FText;
        Property Key: String Read FKey Write FKey;
        Property Answer: String Read FAnswer Write FAnswer;
        Procedure CalcAnswer(Const InputText: String; Const InputKey: String; Const IsEncode: Boolean); Overload;
        Procedure CalcAnswer(Const InputText: String; Const IsEncode: Boolean); Overload;
        Constructor Create;
        Destructor Destroy; Override;
    End;

Implementation

Uses
    System.SysUtils; // for ansilowercase

{ utility }

Const
    ALPHABET_RUS = '��������������������������������';
    ALPHABET_ENG = 'abcdefghijklmnopqrstuvwxyz';
    GRILLE_MASK: TArray<String> = //
        [// 4x4
        'x---', //
        '---x', //
        '--x-', //
        '-x--'//
        ]; //

Function FindSymbCode(Const Alphabet: String; Const Symb: Char): Integer;
Var
    I: Integer;
Begin
    For I := 1 To Length(Alphabet) Do
        If Symb = Alphabet[I] Then
        Begin
            Result := I;
            Exit
        End;
    Result := -1;
End;

Procedure RotateGrille(Var Res: TArray<String>);
Var
    TempMatrix: TArray<String>;
Begin
    TempMatrix := Copy(Res);
    For Var I := Low(Res) To High(Res) Do
        For Var J := Low(Res) To High(Res) Do // offset for j because j is used for strings
            Res[J, High(Res) - I + 1] := TempMatrix[I, J + 1];
End;

{ cipher funcs }

Function RunGrilleEncode(Const Text: String; Const Mask: TArray<String>): String;
Var
    I, J, StartInd, EndInd, Count, TempInd, Cycles: Integer;
    Masked, Res, TempArr: TArray<String>;
    TempStr: String;
Begin
    // temptext refactor
    For I := 1 To Length(Trim(Text)) Do
        If (FindSymbCode(ALPHABET_ENG, Text[I]) <> -1) Or (Text[I] = ' ') Then
            TempStr := TempStr + Text[I];
    TempStr := Trim(TempStr);
    TempInd := 1;
    While (Length(TempStr) Mod (Length(Mask) * Length(Mask))) <> 0 Do
    Begin
        TempStr := TempStr + ALPHABET_ENG[TempInd];
        Inc(TempInd);
    End;

    // res matrix init
    SetLength(Res, ((Length(TempStr) - 1) Div (Length(Mask) * Length(Mask)) + 1) * Length(Mask));
    StartInd := Low(Res);
    EndInd := High(Res);
    For I := StartInd To EndInd Do
        Res[I] := '';
    For I := StartInd To EndInd Do
        For J := StartInd To EndInd Do
            Res[I] := Res[I] + '-';

    // cipher alg start
    Cycles := Length(TempStr) Div (Length(Mask) * Length(Mask)) - 1;
    SetLength(TempArr, Length(Mask));
    For Var K := 0 To Cycles Do
    Begin
        // TempArr init
        For I := Low(TempArr) To High(TempArr) Do
            TempArr[I] := '';
        For I := Low(TempArr) To High(TempArr) Do
            For J := Low(TempArr) To High(TempArr) Do
                TempArr[I] := TempArr[I] + '-';

        // algo
        Masked := Copy(Mask);
        Count := 1;
        While Count <= Length(Mask) * Length(Mask) Do
        Begin
            For I := Low(Masked) To High(Masked) Do
                For J := Low(Masked) To High(Masked) Do // offset for j because j is used for strings
                    If Masked[I][J + 1] = 'x' Then
                    Begin
                        TempArr[I][J + 1] := TempStr[Count + Length(Mask) * Length(Mask) * K];
                        Inc(Count);
                    End;
            RotateGrille(Masked);
        End;

        // res add
        For I := Low(TempArr) To High(TempArr) Do
            Res[I + Length(Mask) * K] := TempArr[I];
    End;

    TempStr := '';
    For I := StartInd To EndInd Do
        TempStr := TempStr + Res[I];
    Result := TempStr;
End;

Function RunGrilleDecode(Const CipherText: String; Const Mask: TArray<String>): String;
Var
    Answer, TempStr: String;
    Cycles: Integer;
    Masked, CipherArr: TArray<String>;
Begin
    SetLength(CipherArr, ((Length(CipherText) - 1) Div (Length(Mask) * Length(Mask)) + 1) * Length(Mask));
    TempStr := CipherText;

    For Var I := Low(CipherArr) To High(CipherArr) Do
        CipherArr[I] := Copy(TempStr, I * Length(Mask) + 1, Length(Mask));

    Masked := Copy(Mask);
    Answer := '';

    Cycles := Length(CipherText) Div (Length(Mask) * Length(Mask)) - 1;
    For Var K := 0 To Cycles Do
    Begin
        TempStr := '';
        While Length(TempStr) < Length(Mask) * Length(Mask) Do
        Begin
            For Var I := Low(Masked) To High(Masked) Do
                For Var J := 1 To Length(Mask) Do // j := 1 cause it is used for strings
                    If Masked[I, J] = 'x' Then
                        TempStr := TempStr + CipherArr[I + Length(Mask) * K, J];
            RotateGrille(Masked);
        End;
        Answer := Answer + TempStr;
    End;

    Result := Answer;
End;

Function RunVigenereEncode(Const Text: String; Const Key: String): String;
Var
    Res: String;
    ProgressiveKey: String;
    KeyAddition: String;
    Offset: Integer;
Begin
    Res := '';
    ProgressiveKey := '';
    KeyAddition := '';

    For Var I := 1 To Length(Key) Do
        If FindSymbCode(ALPHABET_RUS, Key[I]) <> -1 Then
            KeyAddition := KeyAddition + Key[I];

    While Length(ProgressiveKey) <= Length(Text) Do
    Begin
        ProgressiveKey := ProgressiveKey + KeyAddition;
        For Var I := 1 To Length(KeyAddition) Do
        Begin
            Offset := (FindSymbCode(ALPHABET_RUS, KeyAddition[I])) Mod Length(ALPHABET_RUS);
            KeyAddition[I] := ALPHABET_RUS[Offset + 1];
        End;
    End;

    For Var I := 1 To Length(Text) Do
        If FindSymbCode(ALPHABET_RUS, Text[I]) <> -1 Then
        Begin
            Offset := (FindSymbCode(ALPHABET_RUS, Text[I]) + FindSymbCode(ALPHABET_RUS, ProgressiveKey[I]))
                Mod Length(ALPHABET_RUS);
            If Offset = 0 Then //cause in delphi strings start with index 1
                Offset := Length(ALPHABET_RUS);
            Res := Res + ALPHABET_RUS[Offset];
        End
        Else
            Res := Res + Text[I];

    Result := Res;
End;

Function RunVigenereDecode(Const Text: String; Const Key: String): String;
Var
    Res: String;
    ProgressiveKey: String;
    KeyAddition: String;
    Offset: Integer;
Begin
    Res := '';
    ProgressiveKey := '';
    KeyAddition := '';

    For Var I := 1 To Length(Key) Do
        If FindSymbCode(ALPHABET_RUS, Key[I]) <> -1 Then
            KeyAddition := KeyAddition + Key[I];

    While Length(ProgressiveKey) <= Length(Text) Do
    Begin
        ProgressiveKey := ProgressiveKey + KeyAddition;
        For Var I := 1 To Length(KeyAddition) Do
        Begin
            Offset := (FindSymbCode(ALPHABET_RUS, KeyAddition[I])) Mod Length(ALPHABET_RUS);
            KeyAddition[I] := ALPHABET_RUS[Offset + 1];
        End;
    End;

    For Var I := 1 To Length(Text) Do
        If FindSymbCode(ALPHABET_RUS, Text[I]) <> -1 Then
        Begin
            Offset := (FindSymbCode(ALPHABET_RUS, Text[I]) - FindSymbCode(ALPHABET_RUS, ProgressiveKey[I]) +
                Length(ALPHABET_RUS)) Mod Length(ALPHABET_RUS);
            If Offset = 0 Then
                Offset := Length(ALPHABET_RUS);
            Res := Res + ALPHABET_RUS[Offset];
        End
        Else
            Res := Res + Text[I];

    Result := Res;
End;

{ CipherEng methods }

Constructor TCipherEng.Create;
Begin
    CipherType := None;
    Text := '';
    Key := '';
    Answer := '';
End;

Procedure TCipherEng.CalcAnswer(Const InputText: String; Const InputKey: String; Const IsEncode: Boolean);
Begin
    Text := AnsiLowerCase(InputText);
    Key := AnsiLowerCase(InputKey);
    If IsEncode Then
        Answer := RunVigenereEncode(Text, Key)
    Else
        Answer := RunVigenereDecode(Text, Key);

End;

Procedure TCipherEng.CalcAnswer(Const InputText: String; Const IsEncode: Boolean);
Begin
    Text := AnsiLowerCase(InputText);
    If IsEncode Then
        Answer := RunGrilleEncode(Text, GRILLE_MASK)
    Else
        Answer := RunGrilleDecode(Text, GRILLE_MASK);
End;

Destructor TCipherEng.Destroy;
Begin
    //
End;

End.
