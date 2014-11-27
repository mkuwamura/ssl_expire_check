# ssl_expire_check

リストから読み取って、SSL証明書の残日数を確認するシェルスクリプトです。HTMLで表示できるように適当に挿入

## インストール

    git clone https://github.com/mkuwamura/ssl_expire_check.git

しても構いませんし、シェルスクリプト自体をコピーしても構いません。

## 概要

### 実行例

    git clone https://github.com/mkuwamura/ssl_expire_check.git
    cd ssl_expire_check
    chmod 700 ssl_expire_check.sh

windowsからアップしたら権限どうなるのかな？？。chmodで権限与えといてください。

### リストを適度に修正
cronにするもよし、私は

    /home/mkuwamura/ssl_expire_check/ssl_expire_check.sh >/var/www/html/expire.chkc.html
  
にしています。
  
## 課題

とりあえず作った感がある。