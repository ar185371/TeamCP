program DataLoadintoDataLake;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {UpdatePage},
  DBConn in 'DBConn.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUpdatePage, UpdatePage);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.