@echo off
REM Mario強化学習プロジェクト - Conda環境セットアップスクリプト (Windows)

echo ========================================
echo Mario強化学習プロジェクト
echo Conda環境セットアップ
echo ========================================
echo.

REM Condaバージョン確認
echo [1/3] Condaバージョンを確認中...
conda --version
if errorlevel 1 (
    echo エラー: Condaが見つかりません。
    echo Anaconda または Miniconda をインストールしてください。
    pause
    exit /b 1
)
echo.

REM 既存環境の確認
echo [2/3] 既存のmario環境を確認中...
conda env list | findstr "mario"
if not errorlevel 1 (
    echo 既存のmario環境が見つかりました。削除して再作成しますか？ [Y/N]
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
echo セットアップが完了しました！
echo ========================================
echo.
echo 環境をアクティブ化するには:
echo   conda activate mario
echo.
echo 学習を開始するには:
echo   python main.py
echo.
echo 学習済みモデルを実行するには:
echo   python replay.py
echo.
pause
