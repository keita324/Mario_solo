@echo off
REM Mario RL Project - Backup Checkpoints Script

echo ========================================
echo Mario RL Project
echo Backup Checkpoints
echo ========================================
echo.

if not exist checkpoints (
    echo No checkpoints folder found.
    pause
    exit /b 0
)

REM Create backup folder name with timestamp
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I
set backup_name=checkpoints_backup_%datetime:~0,8%_%datetime:~8,6%

echo Creating backup: %backup_name%
xcopy /E /I /H /Y checkpoints %backup_name%

echo.
echo ========================================
echo Backup created successfully!
echo ========================================
echo Backup location: %backup_name%
echo.
pause
