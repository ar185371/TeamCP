unit DBConn;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.DBClient, System.IniFiles, Vcl.Dialogs;

type
  TDataModule2 = class(TDataModule)
    procedure DataModuleSetup(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    ADOCPHack: TADOConnection;
    ADOCPQuery: TADOQuery;
    ADODmartHack: TADOConnection;
    ADODmartQuery: TADOQuery;
    ADODataLakeHack: TADOConnection;
    ADODataLakeInsertQuery: TADOQuery;
    ADOCPUpdateQuery: TADOQuery;
    ADODmartUpdateQuery: TADOQuery;
    FileIni : TIniFile;
    myIniPath, ConnString:string;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
 if Assigned(FileIni) then
   FreeAndNil(FileIni);
 if Assigned(ADOCPHack) then
   FreeAndNil(ADOCPHack);
 if Assigned(ADOCPQuery) then
   FreeAndNil(ADOCPQuery);
 if Assigned(ADOCPUpdateQuery) then
   FreeAndNil(ADOCPUpdateQuery);
 if Assigned(ADODmartHack) then
   FreeAndNil(ADODmartHack);
 if Assigned(ADODmartQuery) then
   FreeAndNil(ADODmartQuery);
 if Assigned(ADODmartUpdateQuery) then
   FreeAndNil(ADODmartUpdateQuery);
 if Assigned(ADODataLakeHack) then
   FreeAndNil(ADODataLakeHack);
 if Assigned(ADODataLakeInsertQuery) then
   FreeAndNil(ADODataLakeInsertQuery);
end;

procedure TDataModule2.DataModuleSetup(Sender: TObject);
begin
  myIniPath := ExtractFilePath(ParamStr(0)) + 'ConnectingString.ini';
  if not FileExists(myIniPath) then
    Showmessage ('ConnectingString.ini file not found in ' + myIniPath);

  Try
    FileIni := TIniFile.Create(myIniPath) ;

    ADOCPHack := TADOConnection.Create(Self);
    ADOCPQuery := TADOQuery.Create(Self);
    ADOCPUpdateQuery := TADOQuery.Create(Self);

    ADODmartHack := TADOConnection.Create(Self);
    ADODmartQuery := TADOQuery.Create(Self);
    ADODmartUpdateQuery := TADOQuery.Create(Self);

    ADODataLakeHack := TADOConnection.Create(Self);
    ADODataLakeInsertQuery := TADOQuery.Create(Self);

    ConnString := '';
    ConnString:=FileIni.ReadString('Connection','CPHackathon','');
    ADOCPHack.ConnectionString := ConnString;
    ADOCPHack.LoginPrompt := True;
    ADOCPHack.Open;
    ADOCPQuery.Connection := ADOCPHack;
    ADOCPUpdateQuery.Connection := ADOCPHack;

    ConnString := '';
    ConnString:=FileIni.ReadString('Connection','DmartHackathon',ConnString);
    ADODmartHack.ConnectionString := ConnString;
    ADODmartHack.LoginPrompt := True;
    ADODmartHack.Open;
    ADODmartQuery.Connection := ADODmartHack;
    ADODmartUpdateQuery.Connection := ADODmartHack;

    ConnString := '';
    ConnString:=FileIni.ReadString('Connection','HackathornDataLake',ConnString);
    ADODataLakeHack.ConnectionString := ConnString;
    ADODataLakeHack.LoginPrompt := True;
    ADODataLakeHack.Open;
    ADODataLakeInsertQuery.Connection := ADODataLakeHack;
  Except
    On E : exception do
    Showmessage(E.Message);
  End;
end;

end.
