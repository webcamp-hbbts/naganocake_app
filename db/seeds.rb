# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Customer.create!(
    email: 'test@test.com',
    password: "012345",
    last_name: "あ",
    first_name: "い",
    last_name_kana: "ア",
    first_name_kana: "イ",
    postcode: "1111111",
    address: "あ県い区う",
    phone_number: "0000000000",
    is_deleted: "false"
)

Address.create!(
    customer_id: 1,
    name: "お",
    address: "1県2区3",
    postcode: "1111111"
)

Genre.create!(
    name: "洋菓子"
    )

Item.create!(
  genre_id: 1,
  name: "ケーキ",
  image: File.open('./app/assets/images/sample_rails.png'),
  description: "説明です",
  tax_exclude_price: 1000,
  is_active: "false"
)

Order.create!(
  customer_id: 1,
  shipping_price: 100,
  billing: 200,
  name: "太郎",
  address: "ア県イ区ウ",
  postcode: "2222222",
  status: "入金待ち",
  payment_method: "クレジットカード"
  )
  
OrderItem.create!(
  item_id: 1,
  order_id: 1,
  amount: 1,
  production_status: "着手不可",
  tax_included_price: 1000
  )
  

    
CartItem.create!(
  item_id: 1,
  customer_id: 1,
  amount: 10
  )
  
Admin.create!(
    email: "a@a",
    password: "012345",
    )
