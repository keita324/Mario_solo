#!/bin/bash
# Mario強化学習プロジェクト - 仮想環境セットアップスクリプト (macOS/Linux)

echo "========================================"
echo "Mario強化学習プロジェクト"
echo "仮想環境セットアップ"
echo "========================================"
echo ""

# Pythonバージョン確認
echo "[1/4] Pythonバージョンを確認中..."
if ! command -v python3 &> /dev/null; then
    echo "エラー: Python3が見つかりません。"
    echo "Python 3.7以上をインストールしてください。"
    exit 1
fi
python3 --version
echo ""

# 仮想環境作成
echo "[2/4] 仮想環境を作成中..."
if [ -d "mario_env" ]; then
    echo "既存の仮想環境が見つかりました。削除して再作成しますか？ [y/N]"
    read -r confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        rm -rf mario_env
        python3 -m venv mario_env
    fi
else
    python3 -m venv mario_env
fi
echo "仮想環境が作成されました。"
echo ""

# 仮想環境をアクティブ化
echo "[3/4] 仮想環境をアクティブ化中..."
source mario_env/bin/activate
echo ""

# pipをアップグレード
echo "[4/4] pipをアップグレード中..."
pip install --upgrade pip
echo ""

# 依存関係をインストール
echo "依存関係をインストール中..."
pip install -r requirements.txt
echo ""

echo "========================================"
echo "セットアップが完了しました！"
echo "========================================"
echo ""
echo "仮想環境を使用するには:"
echo "  source mario_env/bin/activate"
echo ""
echo "学習を開始するには:"
echo "  python main.py"
echo ""
echo "学習済みモデルを実行するには:"
echo "  python replay.py"
echo ""
