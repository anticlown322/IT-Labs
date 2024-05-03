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
        VilButtons_48: TVirtualImageList;
        SpdbtnRSA: TSpeedButton;
        SpdbtnExit: TSpeedButton;
        SpdbtnHelp: TSpeedButton;
        PgcSections: TPageControl;
        TsRSAEncryption: TTabSheet;
        Lb_Encr_Title: TLabel;
        TsHelp: TTabSheet;
        P_Encr_Options: TPanel;
        Spdbtn_Encr_LoadFile: TSpeedButton;
        Spdbtn_Encr_SaveFile: TSpeedButton;
        EsvimgBackground: TEsVirtualImage;
        LbWelcome: TLabel;
        LbHelp: TLabel;
        LbCompany: TLabel;
        Spdbtn_Encr_Encrypt: TSpeedButton;
        P_Encr_Result: TPanel;
        Mm_Encr_Result: TMemo;
        TsWelcome: TTabSheet;
        DlgLoadFile: TOpenDialog;
        DlgSaveFile: TSaveDialog;
        Shp_Encr_Q: TShape;
        Shp_Encr_P: TShape;
        Shp_Encr_Key: TShape;
        SpdbtnRSADecode: TSpeedButton;
        TsRSADecryption: TTabSheet;
        Lb_Encr_KeyRequirement: TLabel;
        Lb_Encr_QRequirement: TLabel;
        Lb_Encr_PRequirement: TLabel;
        Lb_Encr_Result: TLabel;
        E_Encr_P: TEdit;
        E_Encr_Q: TEdit;
        E_Encr_Key: TEdit;
        Lb_Decr_Title: TLabel;
        Lb_Decr_KeyRequirement: TLabel;
        E_Decr_Key: TEdit;
        Shp_Decr_Key: TShape;
        P_Decr_Options: TPanel;
        Spdbtn_Decr_LoadFile: TSpeedButton;
        Spdbtn_Decr_SaveFile: TSpeedButton;
        Spdbtn_Decr_Decrypt: TSpeedButton;
        Lb_Decr_FileName: TLabel;
        Lb_Encr_FileName: TLabel;
        ActmngActions: TActionManager;
        Act_Encr_Encrypt: TAction;
        Act_Encr_LoadFile: TAction;
        Act_Encr_SaveFile: TAction;
        ActClose: TAction;
        ActChooseOption: TAction;
        Act_Decr_Decrypt: TAction;
        Act_Decr_LoadFile: TAction;
        Act_Decr_SaveFile: TAction;
        Lb_Decr_ModuleRequirement: TLabel;
        Shp_Decr_Module: TShape;
        E_Decr_Module: TEdit;
        P_Decr_Result: TPanel;
        Mm_Decr_Result: TMemo;
        Lb_Decr_Result: TLabel;
        Lb_Encr_PublicKeyAndModule: TLabel;
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure Act_Encr_SaveFileExecute(Sender: TObject);
        Procedure Act_Encr_LoadFileExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure Act_Encr_EncryptExecute(Sender: TObject);
        Procedure Act_Decr_DecryptExecute(Sender: TObject);
        Procedure Act_Decr_LoadFileExecute(Sender: TObject);
        Procedure Act_Decr_SaveFileExecute(Sender: TObject);
    Private
        Engine: TCipherEng;
        DataToEncrypt, DataToDecrypt, EncryptAnswer, DecryptAnswer: TArray<Byte>;
    End;

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    System.IOUtils;
{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    Engine := TCipherEng.Create;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Const
    BUTTON_CAP_ENCODE = '�����������';
    BUTTON_CAP_DECODE = '������������';
    BUTTON_CAP_LOAD_FILES = '���������' + #13#10 + '�� �����';
    BUTTON_CAP_SAVE_FILES = '���������' + #13#10 + '� ����';
Begin
    PgcSections.ActivePage := TsWelcome;

    // round corners
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(P_Encr_Result, CtRoundedCornerDefault);
    RoundCornerOf(P_Decr_Result, CtRoundedCornerDefault);
    // button captions
    Spdbtn_Encr_Encrypt.Caption := BUTTON_CAP_ENCODE;
    Spdbtn_Encr_LoadFile.Caption := BUTTON_CAP_LOAD_FILES;
    Spdbtn_Encr_SaveFile.Caption := BUTTON_CAP_SAVE_FILES;
    Spdbtn_Decr_Decrypt.Caption := BUTTON_CAP_DECODE;
    Spdbtn_Decr_LoadFile.Caption := BUTTON_CAP_LOAD_FILES;
    Spdbtn_Decr_SaveFile.Caption := BUTTON_CAP_SAVE_FILES;
End;

Procedure TfrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

{ Action manager - Form }

Procedure TfrmMain.ActChooseOptionExecute(Sender: TObject);
Var
    ButtonTag: Integer;
Begin
    ButtonTag := (Sender As TAction).ActionComponent.Tag;
    PgcSections.ActivePageIndex := ButtonTag;
End;

Procedure TfrmMain.ActCloseExecute(Sender: TObject);
Begin
    FreeAndNil(Engine);
    Close;
End;

{ Action manager - Encryption }

Procedure TfrmMain.Act_Encr_LoadFileExecute(Sender: TObject);
Var
    InputFile: File Of Byte;
    Buff: TArray<Byte>;
    Size: Integer;
Begin
    If DlgLoadFile.Execute Then
    Begin
        AssignFile(InputFile, DlgLoadFile.FileName);
        Try
            Reset(InputFile);
            Try
                Size := Filesize(InputFile);
                Setlength(Buff, Size);
                While Not Eof(InputFile) Do
                    BlockRead(InputFile, Buff[0], Size);
                DataToEncrypt := Copy(Buff);

                Lb_Encr_FileName.Caption := '����: ' + DlgLoadFile.FileName;
            Except
                Application.MessageBox('������ ��� ������ �����! ', '������!', MB_ICONERROR);
            End;
        Finally
            CloseFile(InputFile);
        End;
    End;
End;

Procedure TfrmMain.Act_Encr_SaveFileExecute(Sender: TObject);
Begin
    If DlgSaveFile.Execute Then
    Begin
        Try
            TFile.WriteAllBytes(DlgSaveFile.FileName, EncryptAnswer);
        Except
            Application.MessageBox('������ ��� ������ � ����! ', '������!', MB_ICONERROR);
        End;
    End;
End;

Procedure TfrmMain.Act_Encr_EncryptExecute(Sender: TObject);
Var
    P, Q, Exponenta: Integer;
    HumanAnswer: TStringList;
Begin
    If (Length(E_Encr_P.Text) > 0) And (Length(E_Encr_Q.Text) > 0) And (Length(E_Encr_Key.Text) > 0) Then
    Begin
        P := StrToInt(E_Encr_P.Text);
        Q := StrToInt(E_Encr_Q.Text);
        Exponenta := StrToInt(E_Encr_Key.Text);
        If Engine.EncryptRSA(P, Q, Exponenta, DataToEncrypt) Then
        Begin
            HumanAnswer := TStringList.Create;
            EncryptAnswer := Engine.FAnswer;
            For Var I := 0 To (Engine.FByteText.Count - 1) Do
                HumanAnswer.Add(IntToStr(Engine.FByteText[I]));

            Mm_Encr_Result.Text := HumanAnswer.Text;
            Lb_Encr_PublicKeyAndModule.Caption := Format('�������� ���� - %d, ������ - %d',
                [Engine.FPrivateKey, Engine.FModuleValue]);
        End
        Else
            MessageBox(Handle, Pchar('������� ������������ ������'), Pchar('������'), MB_ICONERROR);
    End
    Else
        MessageBox(Handle, Pchar('�� ��� ����������� ���� ���������'), Pchar('������'), MB_ICONERROR);
End;

{ Action manager - Decryption }

Procedure TfrmMain.Act_Decr_LoadFileExecute(Sender: TObject);
Var
    InputFile: File Of Byte;
    Buff: TArray<Byte>;
    Size: Integer;
Begin
    If DlgLoadFile.Execute Then
    Begin
        AssignFile(InputFile, DlgLoadFile.FileName);
        Try
            Reset(InputFile);
            Try
                Size := Filesize(InputFile);
                Setlength(Buff, Size);
                While Not Eof(InputFile) Do
                    BlockRead(InputFile, Buff[0], Size);
                DataToDecrypt := Copy(Buff);

                Lb_Decr_FileName.Caption := '����: ' + DlgLoadFile.FileName;
            Except
                Application.MessageBox('������ ��� ������ �����! ', '������!', MB_ICONERROR);
            End;
        Finally
            CloseFile(InputFile);
        End;
    End;
End;

Procedure TfrmMain.Act_Decr_SaveFileExecute(Sender: TObject);
Begin
    If DlgSaveFile.Execute Then
    Begin
        Try
            TFile.WriteAllBytes(DlgSaveFile.FileName, DecryptAnswer);
        Except
            Application.MessageBox('������ ��� ������ � ����! ', '������!', MB_ICONERROR);
        End;
    End;
End;

Procedure TfrmMain.Act_Decr_DecryptExecute(Sender: TObject);
Var
    Key, Module: Integer;
    HumanAnswer: TStringList;
Begin
    If (Length(E_Decr_Key.Text) > 0) And (Length(E_Decr_Module.Text) > 0) Then
    Begin
        Key := StrToInt(E_Decr_Key.Text);
        Module := StrToInt(E_Decr_Module.Text);

        If Engine.DecryptRSA(Module, Key, DataToDecrypt) Then
        Begin
            HumanAnswer := TStringList.Create;
            DecryptAnswer := Engine.FAnswer;
            For Var I := 0 To (Engine.FByteText.Count - 1) Do
                HumanAnswer.Add(IntToStr(Engine.FByteText[I]));

            Mm_Decr_Result.Text := HumanAnswer.Text;
        End
        Else
            MessageBox(Handle, Pchar('������� ������������ ������'), Pchar('������'), MB_ICONERROR);
    End
    Else
        MessageBox(Handle, Pchar('�� ��� ����������� ���� ���������'), Pchar('������'), MB_ICONERROR);
End;

End.
