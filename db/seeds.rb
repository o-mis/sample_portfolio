# 管理ユーザー作成
User.create!(name: 'Admin User',
            email: 'admin-contrail@example.com',
            password: 'abcdefg',
            password_confirmation: 'abcdefg',
            avatar: open("#{Rails.root}/db/fixtures/avatar/admin.png"),
            admin: true)

# ユーザー作成
30.times do |n|
  name = Faker::Name.name
  email = "sample#{n+1}@sample.com"
  password = 'password'
  User.create!( name:  name,
                email: email,
                password:               password,
                password_confirmation:  password,
                confirmed_at: Time.zone.now,
                created_at: Time.zone.now)
end

# ユーザー画像作成
users = User.order(:id).take(13)
users.each_with_index do |user, i|
  user.avatar = open("#{Rails.root}/db/fixtures/avatar/avatar-#{i + 1}.jpg")
  user.save
end

# 投稿作成
Micropost.create!(
  [
    {
      user_id: 1,
      image: open("#{Rails.root}/db/fixtures/pic/pic-1.JPG"),
      arrived_at: "昼",
      budget: "2",
      address: "まる伊 銀座総本店",
      content: "ボリュームたっぷりのづけあなちらしがおすすめです。コスパが良い。",
      tag_list: "銀座,寿司,おすすめ,コスパ"
    },
    {
      user_id: 2,
      image: open("#{Rails.root}/db/fixtures/pic/pic-2.jpg"),
      arrived_at: "未選択",
      budget: "2",
      address: "池袋 天丼ふじ",
      content: "ししとうやキスが入っているのが少し珍しい。甘辛いタレによく合います。",
      tag_list: "池袋,天丼,おすすめ"
    },
    {
      user_id: 3,
      image: open("#{Rails.root}/db/fixtures/pic/pic-3.jpg"),
      arrived_at: "夜",
      budget: "4",
      address: "渋谷 寿司の美登利",
      content: "コスパの良いお店。ランチセットも美味しい。",
      tag_list: "渋谷,寿司,おすすめ"
    },
    {
      user_id: 4,
      image: open("#{Rails.root}/db/fixtures/pic/pic-4.JPG"),
      arrived_at: "昼",
      budget: "2",
      address: "神楽坂 紀の善",
      content: "全体的に甘さ控えめの抹茶ババロア。年中食べたい。",
      tag_list: "神楽坂,ババロア,スイーツ"
    },
    {
      user_id: 5,
      image: open("#{Rails.root}/db/fixtures/pic/pic-5.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "かつき亭 吾妻橋店",
      content: "エビフライとヒレカツが特に美味しい。エビがプリプリで大きい。",
      tag_list: "吾妻橋,エビフライ,ヒレカツ"
    },
    {
      user_id: 6,
      image: open("#{Rails.root}/db/fixtures/pic/pic-6.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "亀有 つけ麺道",
      content: "ラーメン屋のクリームブリュレ。これを目当てに行くのも良いですね。",
      tag_list: "スイーツ, ラーメン"
    },
    {
      user_id: 7,
      image: open("#{Rails.root}/db/fixtures/pic/pic-7.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "Cafe&Meal MUJI 渋谷",
      content: "濃厚な硬めプリン。もっとMUJIプリンが流行ってほしい。",
      tag_list: "渋谷,プリン,スイーツ"
    },
    {
      user_id: 8,
      image: open("#{Rails.root}/db/fixtures/pic/pic-8.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "とんかつ檍 大門店",
      content: "お肉が甘くて柔らかい。勇気を出して塩を付けて食べるのが良いです。",
      tag_list: "とんかつ,おすすめ"
    },
    {
      user_id: 9,
      image: open("#{Rails.root}/db/fixtures/pic/pic-9.jpg"),
      arrived_at: "夜",
      budget: "2",
      address: "十二分屋 早稲田店",
      content: "コシの強い麺に少し酸味の効いたスープは食欲が無い時にも。",
      tag_list: "ラーメン,つけ麺"
    },
    {
      user_id: 10,
      image: open("#{Rails.root}/db/fixtures/pic/pic-10.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "Mr.チキン 要町店",
      content: "甘辛いタレにザクザクの衣がついている。お餅とさつまいもも付いています。",
      tag_list: "池袋,チキン,デリバリー"
    },
    {
      user_id: 11,
      image: open("#{Rails.root}/db/fixtures/pic/pic-11.JPG"),
      arrived_at: "昼",
      budget: "2",
      address: "チャオチャオバンブー",
      content: "バイキング形式で食べたいものをよそってもらえる。雰囲気も良いです。",
      tag_list: "表参道,タイ料理"
    },
    {
      user_id: 12,
      image: open("#{Rails.root}/db/fixtures/pic/pic-12.jpg"),
      arrived_at: "夜",
      budget: "7",
      address: "万両 東天満店",
      content: "幻カルピが一番おすすめ。こんなに美味しいお店東京ならもっと高いはず...",
      tag_list: "大阪,焼き肉,コスパ"
    },
    {
      user_id: 13,
      image: open("#{Rails.root}/db/fixtures/pic/pic-13.JPG"),
      arrived_at: "夜",
      budget: "3",
      address: "幸寿司 高田馬場",
      content: "どれを食べても美味しいです。ちなみにお昼はお蕎麦屋さんです。",
      tag_list: "高田馬場,寿司"
    },
    {
      user_id: 14,
      image: open("#{Rails.root}/db/fixtures/pic/pic-14.jpg"),
      arrived_at: "昼",
      budget: "2",
      address: "新宿割烹中嶋",
      content: "薄味の鰯の煮付けが本当に美味しい。脂がのっていて最高です。",
      tag_list: "新宿,和食"
    },
    {
      user_id: 15,
      image: open("#{Rails.root}/db/fixtures/pic/pic-15.JPG"),
      arrived_at: "昼",
      budget: "1",
      address: "ラーメン凪 新宿",
      content: "太めのちぢれ麺に濃厚な煮干スープは相性抜群です。",
      tag_list: "新宿,ラーメン,おすすめ"
    }
  ]
)

# フォロー・フォロワー関係
users = User.all
user = users.first
following = users[2..20]
followers = users[3..10]
following.each { |followed|user.follow(followed) }
followers.each { |follower|follower.follow(user) }

# いいね
users = User.order(:id).take(10)
microposts = Micropost.order(:id).take(15)
users.each do |user|
  microposts.each do |micropost|
    micropost.like(user)
  end
end
