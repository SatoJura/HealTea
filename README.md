## アプリケーション名
「HealTea」

## URL
[HealTea](13.115.216.22)

## 概要
ユーザーがおすすめするハーブティの美味しい飲み方や、ハーブに関する情報を共有し合うアプリケーション

### 制作のきっかけ
1. 健康やストレス解消に適切な飲み物があることを知ってもらい、テレワークの増加や自粛生活が続く中での息抜きとして、自宅で美味しくハーブティを楽しんでもらいたい。
2. 1つ1つのハーブについて、美味しいハーブティの飲み方や共有ができるサイトやアプリケーションが少ない。もっと簡単に知ることができるものがあれば良いなと思ったため。

### 利用方法
#### ユーザー側
* ハーブ一覧ページから、効能別で、どのようなハーブがあるのかを調べることができる。
* ハーブ詳細ページから、他人のコメントを通してハーブティのおすすめの飲み方の情報を得ることができる。
* ハーブ詳細ページから、自分のおすすめのハーブティの飲み方やハーブの使用方法を共有することができる。
#### 管理者側
* ハーブを登録することができる。その際、効能のタグ付けは必須で登録できる。

### こだわり
* ユーザーと管理者がアクセス可能なページを分けた。
* 非ログイン時にはハーブ一覧ページを見ることができるが、ログインしないとコメントやハーブ詳細ページは見ることができないようにした。
* 夜や癒されたいときに見ることを想定し、サイトの色味を柔らかいイメージにした。

## ER図
![ER](https://user-images.githubusercontent.com/86064337/137625772-437a7e9a-f9d4-45ef-865f-456586dbc521.png)

## 機能・技術一覧
* 投稿機能
* コメント機能
* 画像アップロード（refile-mini_magick）
* タグ付け
* いいね機能
* ログイン・ログアウト（devise）
* CSSフレームワーク（bootstrap）
* コードチェック（rubocop）
* 環境変数（dotenv-rails）

### バージョン
Rails 5.2.6  
Ruby 2.6.3  
