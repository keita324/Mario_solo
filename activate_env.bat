@echo off
REM Mario RL Project - Activate Virtual Environment Script

if not exist mario_env (
    echo ERROR: mario_env virtual environment not found.
    echo Please run setup_venv.bat to set up the environment.
    pause
    exit /b 1
)

echo Activating Mario virtual environment...
call mario_env\Scripts\activate.bat

echo.
echo ========================================
echo Mario virtual environment activated
echo ========================================
echo.
echo To start training: python main.py
echo To run model: python replay.py
echo To deactivate: deactivate
echo.
