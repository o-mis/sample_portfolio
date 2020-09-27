# Contrail

お気に入りのお店の口コミを投稿できるサービスです。
150 字以内でお気に入りのお店をすぐに共有することができるのが特徴です。

# リンク

https://www.contrail-app.com

# 使用技術

- Ruby 2.6.4、Rails 6.0.3.2
- Rspec
- Sass
- MySQL 8.0.20
- Nginx,puma(ソケット通信)
- Docker, docker-compose
- AWS
  - VPC
  - EC2/ELB
  - RDS(MySQL)
  - Route53
  - ACM
  - S3
  - ECS
  - ECR
- CircleCI(orbsを使用してデプロイしています)

# AWS構成図

![contrail-chart](https://user-images.githubusercontent.com/54735254/91636940-885f2f00-ea3f-11ea-8ef0-70394a838416.jpeg)

# 機能一覧と使用 gem

- ゲストログイン機能
- ユーザー登録、ログイン、編集機能(devise)
- 管理ユーザーログイン機能
- 管理ユーザーのみ全投稿/全ユーザー削除機能
- プロフィール画像アップロード機能
- 口コミ投稿、削除機能
- 画像ファイルアップロード機能(carrierwave,minimagick)
- タグ付け機能(acts-as-taggable-on)
- 投稿場所のマップ表示機能(Google API,geocoder)
- コメント機能
- ページネーション機能(kaminari)
- ユーザー間でのフォロー機能
- 投稿/ユーザー検索機能(ransack)
- いいね機能
- ブックマーク機能
- Twitterシェア機能
