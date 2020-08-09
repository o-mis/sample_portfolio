# Contrail

飲食店の口コミを手軽に投稿できるサービスです。
口コミ投稿サービスとしては短い、150字の文字制限を設けお気に入りのお店をすぐに共有することができるのが特徴です。

#リンク
https://www.contrail-app.com

#使用技術
- Ruby 2.6.4、Rails 6.0.3.2
- Rspec
- Sass
- MySQL 8.0.20
- Nginx,puma(ソケット通信)
- AWS
	- VPC
	- EC2/ELB
        - RDS(MySQL)
	- Route53
	- ACM
        - S3
- Capistrano
- Github

#クラウドアーキテクチャ

#機能一覧と使用gem
- かんたんログイン機能
- ユーザー登録、ログイン、編集機能(devise)
- プロフィール画像アップロード機能
- 口コミ投稿、削除機能
- ページネーション機能(kaminari)
- 画像ファイルアップロード機能(carrierwave)
- コメント機能
- ユーザー間でのフォロー機能
- 検索機能(ransack)
- いいね機能
- ブックマーク機能
- 投稿場所のマップ表示機能(Google API)


