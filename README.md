# Contrail

**飲食店のお客様と店主の方たちが繋がりやすくする**ため作成しました。   

以前アルバイトしていた飲食店で、集客のためチラシを手書きで書き、   
近隣のお宅へポスト投函していました。   
その手間を無くすために、**お店のホームページ**と、**口コミサイト**が合わさった   
サービスを作ることを決めました。  
飲食店限定の口コミサイト上でお店の投稿もできれば、チャンスになると考えたからです。    
また、情報を発信することで店主の方のお人柄も伝わりやすいと考えました。      

お料理以外の理由でも来店していただけるような**きっかけづくり**をしたいと思い、   
アプリケーションの使い心地を工夫しました。

![cloud-arch](https://user-images.githubusercontent.com/54735254/102874872-62deb100-4486-11eb-86db-16d4fd77d4a1.jpeg)

# リンク

https://www.contrail-app.com  

ゲストログイン機能を用意しています。
すべての機能をご利用いただけるのでぜひご覧ください。

# 特に力を入れたところ
**【 アプリケーションUI/UX 】**
- お店の集客に寄与できるように「お店からのお知らせ」を投稿できるようにしたこと   
- 使用する敷居を低くするため、一般ユーザーと店主の方のアカウント作成フォームは同一なものにしたこと

**【技術】**
- Dockerを用いて開発環境と本番環境の差異を無くしたこと
- CloudFrontを使用して静的コンテンツの自動圧縮、画像のCDN配信を行っていること
- CircleCIを使用してビルド、ECSデプロイすることでCI/CDパイプラインを構築していること
- 独学での学習のため、チーム開発を考慮してGitHubのissue/プルリクを活用しながら開発を進めたこと

# 使用技術

- Ruby 2.6.4 / Rails 6.0.3.2
- Rspec
- jQuery
- JavaScript
- MySQL 8.0.19
- Nginx,puma(ソケット通信)
- Docker / docker-compose(開発環境)
- AWS
  - VPC
  - EC2/ELB
  - RDS(MySQL)
  - Route53
  - ACM
  - CloudFront
  - S3
  - ECS
  - ECR
- CircleCI(orbsを使用してデプロイ)
- Git, GitHub

# AWS構成図

![contrail](https://user-images.githubusercontent.com/54735254/94371958-2f191700-0135-11eb-9be5-b73970e491c0.png)

# 機能一覧と使用gem

- ゲストログイン機能(ログイン無しで全ての機能を使用可能)
- 管理ユーザー機能 (ユーザー/ 投稿削除権限を付与)
- ユーザー登録/編集/削除機能(devise)
- プロフィール画像アップロード機能
- お店のお知らせ投稿/削除機能
- お店のお知らせへのマーク機能
- 一般ユーザーの投稿 / 削除機能
- 画像ファイル投稿機能(CarrierWave, minimagick)
- 地図表示機能(Google API, geocoder)
- タグ付け機能(acts-as-taggable-on)
- いいね機能
- ブックマーク機能
- コメント機能
- 投稿/ユーザー検索機能(ransack)
- フォロー/フォロー解除機能(Ajax対応)
- ページネーション機能(kaminari)

# その他使用gem
- Rubocop(code formatter)
- Capybara(System Spec用)
- selenium-webdriver(Headless Chrome用)
- rspec_junit_formatter(CircleCIとGitHub連携用)
- bullet(N+1問題検知)
- enum_help(enumをI18nに対応)
- annotate(schemaを表示)

# ポートフォリオの課題
- jQueryで書いた箇所を素のJavaScriptへ書き換え

# 現在興味がある技術について
**SPA構成のアプリケーション作成**に興味があります。   
個人的な作成ではVueを使用するつもりです。JavaScriptが理解できればVueの習得も理解が早いと考え、   
現在はまず下記に取り組み中です。   

ポートフォリオ内でJavaScriptに書き換え可能な箇所を少しづつ修正すること。
