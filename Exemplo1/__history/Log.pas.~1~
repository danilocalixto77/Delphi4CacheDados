unit Log;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TLog = class
  private
  public
    class function Instance: TLog; virtual;
    function Load(const LogFile: String;
                  const Strings: TStrings): Boolean virtual;
    function WriteLog(const LogFile: String;
                      const aMessage: String;
                      const CanCreate: Boolean = True;
                      const ClearBeforeWrite: Boolean = False;
                      const UseDateTimeInLog: Boolean = True): Boolean;
  end;


implementation

var
  FInstance: TLog;

class function TLog.Instance: TLog;
begin
  Result := FInstance;
end;

function TLog.Load(const LogFile: String; const Strings: TStrings): Boolean;
begin
  var LLog := TStringist.Create;
  try


  finally
    LLog.Free;
  end;
end;

function TLog.WriteLog(const LogFile, aMessage: String; const CanCreate,
  ClearBeforeWrite, UseDateTimeInLog: Boolean): Boolean;
begin

end;

end.
