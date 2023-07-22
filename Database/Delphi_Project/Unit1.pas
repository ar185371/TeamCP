unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBConn, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB;

type
  TUpdatePage = class(TForm)
    btnUpdate: TButton;
    procedure btnUpdateOnclick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdatePage: TUpdatePage;

implementation

{$R *.dfm}

procedure TUpdatePage.btnUpdateOnclick(Sender: TObject);
begin
  with dbconn.DataModule2 do
  begin
    ADOCPQuery.Close;
    ADOCPQuery.SQL.Add('SELECT SALES_ID,SALES_CUST_NO,SALES_PROD_ID,SALES_PROD_NAME,SALES_PROD_PRICE ' +
     ' FROM CP_SALES WHERE SALES_MOVED_TO_LAKE = ' + '''N''');
    ADOCPQuery.Open;

    ADODmartQuery.Close;
    ADODmartQuery.SQL.Add('SELECT SALES_ID,SALES_CUST_NO,SALES_PROD_ID,SALES_PROD_NAME,SALES_PROD_PRICE ' +
     ' FROM DMART_SALES WHERE SALES_MOVED_TO_LAKE = ' + '''N''');
    ADODmartQuery.Open;
    if ((ADOCPQuery.RecordCount > 0) OR (ADODmartQuery.RecordCount > 0)) then
    begin
      while not ADOCPQuery.eof do
      begin
        ADODataLakeInsertQuery.Close;
        ADODataLakeInsertQuery.SQL.Text := '';
        ADODataLakeInsertQuery.SQL.Text := 'INSERT INTO SalesData (SD_CUST_NO,SD_PROD_ID,SD_PRODUCT_NAME, ' +
        ' SD_PRODUCT_PRICE,SD_STORE_ID) values ' +
        '( ' + '''' + ADOCPQuery.FieldByName('SALES_CUST_NO').AsString + '''' + ',' +
        '''' + ADOCPQuery.FieldByName('SALES_PROD_ID').AsString + '''' + ',' +
        '''' + ADOCPQuery.FieldByName('SALES_PROD_NAME').AsString + '''' + ',' +
        '''' + ADOCPQuery.FieldByName('SALES_PROD_PRICE').AsString + '''' + ',' +
        '''CP''' + ')';
        ADODataLakeInsertQuery.ExecSQL;

        ADOCPUpdateQuery.Close;
        ADOCPUpdateQuery.SQL.Text := '';
        ADOCPUpdateQuery.SQL.Text := 'UPDATE CP_SALES SET SALES_MOVED_TO_LAKE = ' + '''Y''' + ' WHERE SALES_ID = ' +
        '''' + ADOCPQuery.FieldByName('SALES_ID').AsString + '''';
        ADOCPUpdateQuery.ExecSQL;

        ADOCPQuery.Next;
      end;

      while not ADODmartQuery.eof do
      begin
        ADODataLakeInsertQuery.Close;
        ADODataLakeInsertQuery.SQL.Text := '';
        ADODataLakeInsertQuery.SQL.Text := 'INSERT INTO SalesData (SD_CUST_NO,SD_PROD_ID,SD_PRODUCT_NAME, ' +
        ' SD_PRODUCT_PRICE,SD_STORE_ID) values ' +
        '( ' + '''' + ADODmartQuery.FieldByName('SALES_CUST_NO').AsString + '''' + ',' +
        '''' + ADODmartQuery.FieldByName('SALES_PROD_ID').AsString + '''' + ',' +
        '''' + ADODmartQuery.FieldByName('SALES_PROD_NAME').AsString + '''' + ',' +
        '''' + ADODmartQuery.FieldByName('SALES_PROD_PRICE').AsString + '''' + ',' +
        '''DMART''' + ')';
        ADODataLakeInsertQuery.ExecSQL;

        ADODMartUpdateQuery.Close;
        ADODMartUpdateQuery.SQL.Text := '';
        ADODMartUpdateQuery.SQL.Text := 'UPDATE DMART_SALES SET SALES_MOVED_TO_LAKE = ' + '''Y''' + ' WHERE SALES_ID = ' +
        '''' + ADODmartQuery.FieldByName('SALES_ID').AsString + '''';
        ADODMartUpdateQuery.ExecSQL;

        ADODmartQuery.Next;
      end;

      Showmessage ('Record Inserted into Datalake successfully');
    end
    else
      Showmessage ('No record to update');
  end;
end;

end.
