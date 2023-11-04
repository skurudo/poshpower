REM Robocopy mirroring folders
robocopy.exe SOURCE-PATH DESTINATION-PATH /MIR /sec /r:0 /w:0 /mt:32 /unilog:C:\cmd\logfile.log

REM Robocopy options
REM ----------------
REM - copy all files with ntfs permissions, exclude empty foldes
REM robocopy.exe SOURCE-PATH DESTINATION-PATH /s /sec /r:0 /w:1 /unilog:C:\cmd\logfile.log
REM - copy all files with ntfs permissions, mirroring folders
REM robocopy.exe SOURCE-PATH DESTINATION-PATH /MIR /sec /r:0 /w:1 /unilog:C:\cmd\logfile.log
REM - copy all files with ntfs permission s, with empty foldes
REM robocopy.exe SOURCE-PATH DESTINATION-PATH /e /sec /r:0 /w:0 /unilog:C:\cmd\logfile.log
