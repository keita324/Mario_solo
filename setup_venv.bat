@echo off
REM Mario RL Project - Virtual Environment Setup Script (Windows)

echo ========================================
echo Mario RL Project
echo Virtual Environment Setup
echo ========================================
echo.

REM Check Python version
echo [1/4] Checking Python version...
python --version
if errorlevel 1 (
    echo ERROR: Python not found.
    echo Please install Python 3.7 or higher.
    pause
    exit /b 1
)
echo.

REM Create virtual environment
echo [2/4] Creating virtual environment...
if exist mario_env (
    echo Existing virtual environment found. Remove and recreate? [Y/N]
    set /p confirm=
    if /i "%confirm%"=="Y" (
        rmdir /s /q mario_env
        python -m venv mario_env
    )
) else (
    python -m venv mario_env
)
echo Virtual environment created.
echo.

REM Activate virtual environment
echo [3/4] Activating virtual environment...
call mario_env\Scripts\activate.bat
echo.

REM Upgrade pip
echo [4/4] Upgrading pip...
python -m pip install --upgrade pip
echo.

REM Install dependencies
echo Installing dependencies...
pip install -r requirements.txt
echo.

echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo To use the virtual environment:
echo   Run activate_env.bat
echo.
echo To start training:
echo   python main.py
echo.
echo To run trained model:
echo   python replay.py
echo.
pause
