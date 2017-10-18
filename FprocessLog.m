function log = FprocessLog(logMessage)
%myFun - Description
%
% Syntax: log = FprocessLog(logMessage)
%
% Long description
    mDate = datestr(now, 31);
    logDetail = logMessage;
    log = [mDate, ':' logDetail];

end