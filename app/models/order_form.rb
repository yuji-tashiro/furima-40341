class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  # 郵便番号 - ハイフンありの7桁
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む7桁で入力してください" }

  # 都道府県コード - 選択が必要（0以外）
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  # 市区町村
  validates :city, presence: true

  # 番地
  validates :address, presence: true

  # 建物名 - 任意入力なのでバリデーションは不要

  # 電話番号 - ハイフンなしの10桁または11桁
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしの10桁または11桁で入力してください" }

  def save
    # orderのデータを保存し、order_idを取得する
    order = Order.create(user_id: user_id, item_id: item_id)

    # addressのデータを保存する
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
  
end