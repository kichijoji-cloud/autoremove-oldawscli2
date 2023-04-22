# AWS-CLI2のアップデート後に残る過去バージョンを削除するbash用のShell-Script

----

## 概要

AWS-CLI2のアップデート後に残る過去バージョンを最新版を残して削除するbash用のShell-Scriptです


----

### 目的

#### 具体的課題とソリューション


AWS-CLI2はpip等のパッケージインストーラが使えないので、AWS配布のインストーラでアップデートすると1回のバージョン更新毎に210MB前後のストレージが消費されてしまう。
このスクリプトは、AWS-CLI2のインストールファイルを最新バージョンのみ保持して、古いバージョンを削除するスクリプトです。

- AWSCLI2が発端の不具合の例として、2023年2月～2023年3月末までの2か月間で20回のアップデートが発生して8GBのストレージが圧迫された
- rootユーザー用と、ユーザー権限のインストールを分けている場合は、インストールしたディレクトリ分のストレージが圧迫される（前述の例で2か月間更新して20回アップデートすると、2つのインストールで16GBが消費される）
- VPSやクラウドのインスタンス、コンテナ等で10GB～20GB程度しかストレージを持たせていない場合は、システムが機能不全になる恐れがある


----

### 前提

| ソフトウェア | バージョン | 備考 |
| :----------- | :--------- | :--- |
| bash| 5.0.17|構築した環境はbash 5.0.17ですが、Version5.0未満のbashやzshでも動くと思います|



#### AWSCLI2のインストール

Please see there.
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


#### インストールディレクトリの前提条件


##### 全ユーザー共用のroot権限用のインストールディレクトリ

~~~~
sudo ./aws/install
~~~~

※上記はデフォルトのインストールオプションとして下記のパラメータ値が付与されます

~~~~
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
~~~~


##### Installation directory for user privileges.

~~~~
sudo ./aws/install --bin-dir ~/.local/bin --install-dir ~/.local/aws-cli --update
~~~~

----

## 構成

- autoremove-oldawscli2-root.sh

全ユーザー共用のroot権限用（インストールディレクトリの前提が "/usr/local/aws-cli/v2"、実行ファイルのインストールディレクトリが"/usr/local/bin"）


- autoremove-oldawscli2.sh

ユーザー権限用（インストールディレクトリの前提が "$HOME/.local/aws-cli/v2"、実行ファイルのインストールディレクトリが"$HOME/.local/bin"）



----

## 詳細

### 導入

スクリプトをgit cloneもしくはダウンロードして下さい。

~~~~
git clone autoremove-oldawscli2
~~~~

- autoremove-oldawscli2.sh
- autoremove-oldawscli2-root.sh


### 使い方

#### root権限用のスクリプトはsudoを付与して実行してください

~~~~
chmod +x autoremove-oldawscli2-root.sh
sudo autoremove-oldawscli2-root.sh
~~~~

#### ユーザー権限用のスクリプトはユーザー権限のまま実行してください

~~~~
chmod +x autoremove-oldawscli2.sh
autoremove-oldawscli2.sh
~~~~

----

## 免責

本プログラムを利用したことによる損害等の一切の責任を負いかねますので、予めご了承ください。

----

## ライセンス

"autoremove-oldawscli2" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License)



