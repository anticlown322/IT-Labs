Program AnticlownCiphering2;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  udtmdImages in 'udtmdImages.pas' {dtmdImages: TDataModule},
  uTCipherEng in 'uTCipherEng.pas',
  uFormEnhances in 'uFormEnhances.pas';

{$R *.res}

Begin
    Application.Initialize;
    // Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmdImages, DtmdImages);
  Application.Run;

End.
