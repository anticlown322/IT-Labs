Unit uMain;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.ExtCtrls,
    System.Actions,
    Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls,
    Vcl.ActnMan,
    Vcl.Buttons,
    System.ImageList,
    Vcl.ImgList,
    Vcl.VirtualImageList,
    Vcl.ComCtrls,
    Vcl.StdCtrls,
    Vcl.Mask,
    Vcl.ExtDlgs,
    ES.BaseControls,
    ES.NinePatch,
    ES.Images,
    UTCipherEng;

Type
    TfrmMain = Class(TForm)
        PNav: TPanel;
        ActmngActions: TActionManager;
        ActClose: TAction;
        VilButtons_48: TVirtualImageList;
        SpdbtnTurningGrille: TSpeedButton;
        SpdbtnVigenere: TSpeedButton;
        SpdbtnExit: TSpeedButton;
        SpdbtnHelp: TSpeedButton;
        PgcSections: TPageControl;
        TsTurningGrille: TTabSheet;
        TsVigenere: TTabSheet;
        ActChooseOption: TAction;
        LbGrilleTitle: TLabel;
        ActEncode: TAction;
        ActLoadFile: TAction;
        TsHelp: TTabSheet;
        TsWelcome: TTabSheet;
        LbVigenereTitle: TLabel;
        LbVigenereKey: TLabel;
        EVigenereKey: TEdit;
        OpntxtLoadFile: TOpenTextFileDialog;
        SvtxtSaveFile: TSaveTextFileDialog;
        ActSaveFile: TAction;
        PVigenereOptions: TPanel;
        SpdbtnVigenereSaveFile: TSpeedButton;
        SpdbtnVigenereEncode: TSpeedButton;
        SpdbtnVigenereLoadFile: TSpeedButton;
        PGrilleOptions: TPanel;
        SpdbtnGrilleLoadFile: TSpeedButton;
        SpdbtnGrilleSaveFile: TSpeedButton;
        SpdbtnGrilleDecode: TSpeedButton;
        EsvimgBackground: TEsVirtualImage;
        LbWelcome: TLabel;
        LbHelp: TLabel;
        PGrilleResults: TPanel;
        MmGrilleEncode: TMemo;
        MmGrilleDecode: TMemo;
        ShpGrilleBevel: TShape;
        LbCompany: TLabel;
        PVigenereResults: TPanel;
        LbVigenereResults: TLabel;
        ShpVigenereBevel: TShape;
        MmVigenereEncode: TMemo;
        MmVigenereDecode: TMemo;
        ShpVigenereKey: TShape;
        SpdbtnVigenereDecode: TSpeedButton;
        PVigenereInput: TPanel;
        MmVigenereInput: TMemo;
        LbVigenereInput: TLabel;
        SpdbtnGrilleEncode: TSpeedButton;
        LbGrilleResults: TLabel;
        PGrilleInput: TPanel;
        MmGrilleInput: TMemo;
        LbGrilleInput: TLabel;
        ActDecode: TAction;
        ActCheckInputField: TAction;
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
        Procedure ActLoadFileExecute(Sender: TObject);
        Procedure ActSaveFileExecute(Sender: TObject);
        Procedure ActEncodeExecute(Sender: TObject);
        Procedure ActCheckInputFieldExecute(Sender: TObject);
        Procedure ActDecodeExecute(Sender: TObject);
    Private
        CipherEng: TCipherEng;
    End;

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances;
{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    CipherEng := TCipherEng.Create;
End;

Procedure TfrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Const
    BUTTON_CAP_GRILLE = '����� ���.' + #13#10 + '�������';
    BUTTON_CAP_VIGENERE = '��������' + #13#10 + '��������';
    BUTTON_CAP_ENCODE = '�����������' + #13#10 + '�����';
    BUTTON_CAP_DECODE = '������������' + #13#10 + '�����';
    BUTTON_CAP_LOAD_FILES = '���������' + #13#10 + '�� �����';
    BUTTON_CAP_SAVE_FILES = '���������' + #13#10 + '� ����';
Begin
    PgcSections.ActivePage := TsWelcome;

    // round corners
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(PGrilleInput, CtRoundedCornerDefault);
    RoundCornerOf(PGrilleResults, CtRoundedCornerDefault);
    RoundCornerOf(PVigenereInput, CtRoundedCornerDefault);
    RoundCornerOf(PVigenereResults, CtRoundedCornerDefault);
    // button caps
    SpdbtnTurningGrille.Caption := BUTTON_CAP_GRILLE;
    SpdbtnVigenere.Caption := BUTTON_CAP_VIGENERE;
    SpdbtnGrilleEncode.Caption := BUTTON_CAP_ENCODE;
    SpdbtnGrilleDecode.Caption := BUTTON_CAP_DECODE;
    SpdbtnGrilleLoadFile.Caption := BUTTON_CAP_LOAD_FILES;
    SpdbtnGrilleSaveFile.Caption := BUTTON_CAP_SAVE_FILES;
    SpdbtnVigenereEncode.Caption := BUTTON_CAP_ENCODE;
    SpdbtnVigenereDecode.Caption := BUTTON_CAP_DECODE;
    SpdbtnVigenereLoadFile.Caption := BUTTON_CAP_LOAD_FILES;
    SpdbtnVigenereSaveFile.Caption := BUTTON_CAP_SAVE_FILES;
End;

Procedure TfrmMain.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
    CipherEng.Destroy;
End;

{ Action manager - Form }

Procedure TfrmMain.ActCheckInputFieldExecute(Sender: TObject);
Var
    IsEnabled: Boolean;
Begin
    Case CipherEng.CipherType Of
        CtGrille:
            Begin
                // do it with sender requires two events with complicated logic
                IsEnabled := (Length(MmGrilleInput.Text) > 0);
                SpdbtnGrilleDecode.Enabled := IsEnabled;
                SpdbtnGrilleEncode.Enabled := IsEnabled;
            End;
        CtVigenere:
            Begin
                IsEnabled := (Length(EVigenereKey.Text) > 1) And (Length(MmVigenereInput.Text) > 0);
                SpdbtnVigenereDecode.Enabled := IsEnabled;
                SpdbtnVigenereEncode.Enabled := IsEnabled;
            End;
    End;
End;

Procedure TfrmMain.ActChooseOptionExecute(Sender: TObject);
Var
    ButtonTag: Integer;
Begin
    ButtonTag := (Sender As TAction).ActionComponent.Tag;
    PgcSections.ActivePageIndex := ButtonTag;
    If ButtonTag In [1 .. 2] Then // 1 - Grille, 2 - Vigenere
        CipherEng.CipherType := TCipherType(ButtonTag)
    Else
        CipherEng.CipherType := None;
End;

Procedure TfrmMain.ActCloseExecute(Sender: TObject);
Begin
    Application.Terminate;
End;

{ Action manager - Ciphering }

Procedure TfrmMain.ActEncodeExecute(Sender: TObject);
Begin
    Case CipherEng.CipherType Of
        CtGrille:
            Begin
                CipherEng.CalcAnswer(MmGrilleInput.Text, True); // true = encode
                MmGrilleEncode.Text := CipherEng.Answer;
                SpdbtnGrilleSaveFile.Enabled := True;
            End;
        CtVigenere:
            Begin
                CipherEng.CalcAnswer(MmVigenereInput.Text, EVigenereKey.Text, True);
                MmVigenereEncode.Text := CipherEng.Answer;
                SpdbtnVigenereSaveFile.Enabled := True;
            End;
    End;
End;

Procedure TfrmMain.ActDecodeExecute(Sender: TObject);
Begin
    Case CipherEng.CipherType Of
        CtGrille:
            Begin
                CipherEng.CalcAnswer(MmGrilleInput.Text, False); // false = decode
                MmGrilleDecode.Text := CipherEng.Answer;
                SpdbtnGrilleSaveFile.Enabled := True;
            End;
        CtVigenere:
            Begin
                CipherEng.CalcAnswer(MmVigenereInput.Text, EVigenereKey.Text, False); // false = decode
                MmVigenereDecode.Text := CipherEng.Answer;
                SpdbtnVigenereSaveFile.Enabled := True;
            End;
    End;
End;

Procedure TfrmMain.ActLoadFileExecute(Sender: TObject);
Begin
    If OpntxtLoadFile.Execute() Then
        Case CipherEng.CipherType Of
            CtGrille:
                MmGrilleInput.Lines.LoadFromFile(OpntxtLoadFile.FileName);
            CtVigenere:
                MmVigenereInput.Lines.LoadFromFile(OpntxtLoadFile.FileName);
        End;
End;

Procedure TfrmMain.ActSaveFileExecute(Sender: TObject);
Var
    OutputFile: TextFile;
Begin
    If SvtxtSaveFile.Execute() Then
    Begin
        AssignFile(OutputFile, SvtxtSaveFile.FileName);

        Try
            Try
                Rewrite(OutputFile);

                Case CipherEng.CipherType Of
                    CtGrille:
                        Begin
                        End;
                    CtVigenere:
                        Begin
                            Writeln(OutputFile, '       ������� ������: ');
                            Writeln(OutputFile, '�������� �����: ' + CipherEng.Key);
                            Writeln(OutputFile, '�������� �����: ' + CipherEng.Text);
                            Writeln(OutputFile, '       �������� ������: ');
                            Writeln(OutputFile, '��������� �����: ' + CipherEng.Answer);
                        End;
                End;

                Application.MessageBox('������ ������� �������� � ����!', '����������', MB_ICONINFORMATION);
            Finally
                CloseFile(OutputFile);
            End;
        Except
            Application.MessageBox('�������� � �������! �������� ��������� �����! ', '������!', MB_ICONERROR);
        End;
    End;
End;

End.
