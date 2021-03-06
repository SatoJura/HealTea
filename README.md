# HealTea

### URL
[Healtea](http://13.115.216.22)

##### ユーザー　ハーブ一覧画面
<img width="939" alt="user herb index" src="https://user-images.githubusercontent.com/86064337/137626850-d87d1bc4-fc4d-4ebf-a240-e9c3410b92bf.png">

##### ユーザー　ハーブ詳細画面
<img width="941" alt="user herb show" src="https://user-images.githubusercontent.com/86064337/137627068-1d4507c3-b5ac-485f-a7bd-8c59bb704676.png">

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
* 非ログイン時にはハーブ一覧ページを見ることができるが、ログインしないとコメントやいいね、ハーブ詳細ページは見ることができないようにした。
* 夜や癒されたいときに見ることを想定し、サイトの色味を柔らかいイメージにした。

## ER図
![ER](https://user-images.githubusercontent.com/86064337/137625772-437a7e9a-f9d4-45ef-865f-456586dbc521.png)

## 機能・技術一覧
* 投稿機能
* コメント機能
* 画像アップロード（refile-mini_magick）
* タグ付け
* いいね機能
* ページネーション（kaminari）
* ログイン・ログアウト（devise）
* CSSフレームワーク（bootstrap）
* コードチェック（rubocop）
* テスト(RSpec)
* 環境変数（dotenv-rails）
* Nginx
* AWS(EC2,RDS,GitHub Actions)

### 使用した言語
Ruby,HTML,CSS

### 使用したWebアプリケーション
Ruby on Rails

### バージョン
Rails 5.2.6
Ruby 2.6.3
