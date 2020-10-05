# Contrail

お気に入りのお店の口コミを手軽に投稿できるサービスです。
150 字以内でお店を共有、検索することができるのが特徴です。
<img width="1440" alt="スクリーンショット 2020-10-05 23 01 02" src="https://user-images.githubusercontent.com/54735254/95089686-6142fe00-075f-11eb-99df-6b046b287594.png">

# リンク

https://www.contrail-app.com

# 使用技術

- Ruby 2.6.4、Rails 6.0.3.2
- Rspec
- Sass
- MySQL 8.0.19
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
- CircleCI(orbs を使用してデプロイしています)

# AWS 構成図

![contrail](https://user-images.githubusercontent.com/54735254/94371958-2f191700-0135-11eb-9be5-b73970e491c0.png)

# 機能一覧と使用 gem

- ゲストログイン機能
- ユーザー登録、ログイン、編集機能(devise)
- 管理ユーザーログイン機能
- 管理ユーザーのみ全投稿/全ユーザー削除機能
- プロフィール画像アップロード機能
- 投稿機能、削除機能
- 画像ファイルアップロード機能(carrierwave,minimagick)
- タグ付け機能(acts-as-taggable-on)
- 投稿場所のマップ表示機能(Google API,geocoder)
- コメント機能
- ページネーション機能(kaminari)
- ユーザー間でのフォロー機能
- 投稿/ユーザー検索機能(ransack)
- いいね機能
- ブックマーク機能
