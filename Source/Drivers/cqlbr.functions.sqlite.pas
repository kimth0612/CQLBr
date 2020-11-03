{
         CQL Brasil - Criteria Query Language for Delphi/Lazarus


                   Copyright (c) 2019, Isaque Pinheiro
                          All rights reserved.

                    GNU Lesser General Public License
                      Vers�o 3, 29 de junho de 2007

       Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
       A todos � permitido copiar e distribuir c�pias deste documento de
       licen�a, mas mud�-lo n�o � permitido.

       Esta vers�o da GNU Lesser General Public License incorpora
       os termos e condi��es da vers�o 3 da GNU General Public License
       Licen�a, complementado pelas permiss�es adicionais listadas no
       arquivo LICENSE na pasta principal.
}

{ @abstract(CQLBr Framework)
  @created(18 Jul 2019)
  @author(Isaque Pinheiro <isaquesp@gmail.com>)
  @author(Site : https://www.isaquepinheiro.com.br)
}

unit cqlbr.functions.sqlite;

interface

uses
  SysUtils,
  cqlbr.functions.abstract;

type
  TCQLFunctionsSQLite = class(TCQLFunctionAbstract)
  public
    constructor Create;
    function Substring(const AVAlue: String; const AStart, ALength: Integer): String; override;
    function Date(const AVAlue: String; const AFormat: String): String; overload; override;
    function Date(const AVAlue: String): String; overload; override;
    function Day(const AValue: String): String; override;
    function Month(const AValue: String): String; override;
    function Year(const AValue: String): String; override;
  end;

implementation

uses
  cqlbr.db.register,
  cqlbr.interfaces;

{ TCQLFunctionsSQLite }

constructor TCQLFunctionsSQLite.Create;
begin
  inherited;
end;

function TCQLFunctionsSQLite.Date(const AValue, AFormat: String): String;
begin
  Result := 'DATE(' + FormatDateTime(AFormat, StrToDate(AValue)) + ')';
end;

function TCQLFunctionsSQLite.Date(const AValue: String): String;
begin
  Result := 'DATE(' + AValue + ')';
end;

function TCQLFunctionsSQLite.Day(const AValue: String): String;
begin
  Result := 'STRFTIME(%d, ' + AValue + ')';
end;

function TCQLFunctionsSQLite.Month(const AValue: String): String;
begin
  Result := 'STRFTIME(%m, ' + AValue + ')';
end;

function TCQLFunctionsSQLite.Substring(const AVAlue: String; const AStart,
  ALength: Integer): String;
begin
  Result := 'SUBSTRING(' + AValue + ', ' + IntToStr(AStart) + ', ' + IntToStr(ALength) + ')';
end;

function TCQLFunctionsSQLite.Year(const AValue: String): String;
begin
  Result := 'STRFTIME(%Y, ' + AValue + ')';
end;

initialization
  TDBRegister.RegisterFunctions(dbnSQLite, TCQLFunctionsSQLite.Create);

end.