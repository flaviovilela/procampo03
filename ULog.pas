unit ULog;

interface
 uses
  TLoggerUnit;

  type
    TLog = class
      public

        class procedure Error(msg : string);

        class procedure Debug(msg : string);

        class procedure Info(msg : string);

    end;

implementation

uses
 SysUtils;

{ TLog }

class procedure TLog.Debug(msg: string);
begin
  TLogger.GetInstance.Debug(msg+' - '+DateTimeToStr(Now));
end;

class procedure TLog.Error(msg: string);
begin
  TLogger.GetInstance.Error(msg+' - '+DateTimeToStr(Now));
end;

class procedure TLog.Info(msg: string);
begin
  TLogger.GetInstance.Info(msg+' - '+DateTimeToStr(Now));
end;

end.
