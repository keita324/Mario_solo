# Mario強化学習プロジェクト - セットアップガイド

このガイドでは、Mario強化学習プロジェクトの仮想環境をセットアップする方法を説明します。

## 必要要件

- Python 3.7 以上（推奨: Python 3.8）
- または Anaconda/Miniconda

## セットアップ方法

### オプション1: Python venv を使用（推奨）

Pythonの標準仮想環境を使用する方法です。

#### Windows

1. コマンドプロンプトまたはPowerShellでこのフォルダに移動
2. セットアップスクリプトを実行:
   ```batch
   setup_venv.bat
   ```
3. 仮想環境をアクティブ化:
   ```batch
   activate_env.bat
   ```
   または
   ```batch
   mario_env\Scripts\activate
   ```

#### macOS / Linux

1. ターミナルでこのフォルダに移動
2. 仮想環境を作成:
   ```bash
   python3 -m venv mario_env
   ```
3. 仮想環境をアクティブ化:
   ```bash
   source mario_env/bin/activate
   ```
4. pipをアップグレード:
   ```bash
   pip install --upgrade pip
   ```
5. 依存関係をインストール:
   ```bash
   pip install -r requirements.txt
   ```

### オプション2: Conda を使用

Anacondaをお使いの場合はこちらの方法を推奨します。

#### Windows

```batch
setup_conda.bat
```

#### macOS / Linux

```bash
conda env create -f environment.yml
conda activate mario
```

## インストールされる主要パッケージ

- **PyTorch 1.5.0**: ディープラーニングフレームワーク
- **gym 0.17.2**: 強化学習環境
- **gym-super-mario-bros 7.3.0**: Super Marioゲーム環境
- **nes-py 8.1.1**: NESエミュレーター
- **numpy 1.18.4**: 数値計算ライブラリ
- **scikit-image**: 画像処理（画像のリサイズに使用）
- **tqdm**: プログレスバー表示

## プロジェクトの実行

### 学習を開始

```bash
python main.py
```

- 40,000エピソードの学習を実行
- CPUで約80時間、GPUで約20時間かかります
- 学習の進捗は`checkpoints`フォルダに保存されます

### 学習済みモデルを実行

```bash
python replay.py
```

- 学習済みモデルでMarioをプレイ
- ゲーム画面が表示されます
- `replay.py`内の`load_dir`を変更して特定のチェックポイントを読み込めます

## トラブルシューティング

### PyTorchのインストールに失敗する場合

PyTorch 1.5.0は古いバージョンです。より新しいバージョンを使用する場合:

```bash
# requirements.txtを編集して、以下の行を削除:
# torch==1.5.0
# torchvision==0.6.0

# 最新のPyTorchをインストール（CPU版）:
pip install torch torchvision

# またはGPU版（CUDA対応の場合）:
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
```

### gym-super-mario-bros のインストールに失敗する場合

依存関係を個別にインストール:

```bash
pip install nes-py
pip install gym-super-mario-bros
```

### scikit-image のインストールに失敗する場合

ビルドツールが必要な場合があります:

**Windows**: Microsoft C++ Build Tools をインストール
**macOS**: Xcode Command Line Tools をインストール
**Linux**: `build-essential` パッケージをインストール

または、プリビルド版を使用:

```bash
pip install --upgrade pip
pip install scikit-image --only-binary :all:
```

### ImportError: No module named 'gym'

仮想環境がアクティブ化されているか確認してください:

**Windows**:
```batch
mario_env\Scripts\activate
```

**macOS/Linux**:
```bash
source mario_env/bin/activate
```

## プロジェクト構成

- `main.py`: メインの学習ループ
- `agent.py`: Marioエージェント（DQN実装）
- `neural.py`: ニューラルネットワーク（MarioNet）
- `wrappers.py`: 環境のラッパー（前処理）
- `metrics.py`: メトリクスロガー
- `replay.py`: 学習済みモデルの実行
- `checkpoints/`: 学習済みモデルとログの保存先
- `environment.yml`: Conda環境設定ファイル
- `requirements.txt`: pip依存関係リスト

## 参考リンク

- [PyTorch公式チュートリアル](https://pytorch.org/tutorials/intermediate/mario_rl_tutorial.html)
- [OpenAI Gym](https://gym.openai.com/)
- [gym-super-mario-bros](https://github.com/Kautenja/gym-super-mario-bros)

## ライセンス

このプロジェクトはPyTorchの公式チュートリアルを基にしています。
