@echo off
REM Mario RL Project - Clean Checkpoints Script

echo ========================================
echo Mario RL Project
echo Clean Checkpoints
echo ========================================
echo.

if not exist checkpoints (
    echo No checkpoints folder found.
    pause
    exit /b 0
)

echo Current checkpoints:
dir /b checkpoints
echo.

echo WARNING: This will delete ALL checkpoints and logs!
echo This action cannot be undone.
echo.
echo Do you want to continue? [Y/N]
set /p confirm=

if /i "%confirm%"=="Y" (
    echo Deleting checkpoints...
    rmdir /s /q checkpoints
    mkdir checkpoints
    echo.
    echo ========================================
    echo Checkpoints cleaned successfully!
    echo ========================================
) else (
    echo Operation cancelled.
)

echo.
pause
