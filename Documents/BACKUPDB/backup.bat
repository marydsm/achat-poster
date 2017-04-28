@echo off
SET mypath=%~dp0
SET myLogin=root
rem SET myDatabase=venteposters
SET myDatabase=venteposters
SET myDate=%DATE:~-4%-%DATE:~3,2%-%DATE:~7,2%
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set myTime=%%a-%%b)
SET myfile=%myDate%_%myTime%
SET myfileSQL=%mypath%%myfile%_%myDatabase%_DATA_DB.sql
SET myfileBAT=%mypath%%myfile%_%myDatabase%_RESTORE_DB.bat
C:\wamp64\bin\mysql\mysql5.7.14\bin\mysqldump -h localhost -u %myLogin% -B %myDatabase% -S -H -Y > %myfileSQL%
echo call backup.bat> %myfileBAT%
echo C:\wamp64\bin\mysql\mysql5.7.14\bin\mysql -u %myLogin% -B %myDatabase% ^< %myfileSQL% >> %myfileBAT%