email = "test@example.com"
password = "password"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

user2.recommended_foods.create!(name: "沖縄そば", comment: "沖縄料理")
user1.recommended_foods.create!(name: "広島風お好み焼き", comment: "蕎麦入りのお好み焼き")
user3.recommended_foods.create!(name: "ザク丼", comment: "家系ラーメン大桜の角煮丼")
user3.recommended_foods.create!(name: "味噌カツ", comment: "愛知県の郷土料理")
user1.recommended_foods.create!(name: "浜なし", comment: "横浜のなし")

User.create!(email: email, password: password)
puts "ユーザーの初期データインポートに成功しました。"
