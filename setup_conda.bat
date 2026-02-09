@echo off
REM Mario RL Project - Conda Environment Setup Script (Windows)

echo ========================================
echo Mario RL Project
echo Conda Environment Setup
echo ========================================
echo.

REM Check Conda version
echo [1/3] Checking Conda version...
conda --version
if errorlevel 1 (
    echo ERROR: Conda not found.
    echo Please install Anaconda or Miniconda.
    pause
    exit /b 1
)
echo.

REM Check existing environment
echo [2/3] Checking for existing mario environment...
conda env list | findstr "mario"
if not errorlevel 1 (
    echo Existing mario environment found. Remove and recreate? [Y/N]
    set /p confirm=
    if /i "%confirm%"=="Y" (
        conda env remove -n mario -y
        conda env create -f environment.yml
    )
) else (
    conda env create -f environment.yml
)
echo.

echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo To activate the environment:
echo   conda activate mario
echo.
echo To start training:
echo   python main.py
echo.
echo To run trained model:
echo   python replay.py
echo.
pause
