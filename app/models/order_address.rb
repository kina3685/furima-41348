class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id,
                :token

  # :street_address,
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁-4桁」の半角数字で入力してください' }
    # validates :street_address
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力してください' }
    validates :token, presence: { message: 'を入力してください' } # クレジットカードのトークン
  end
  def save
    # トランザクションで Order と Address を同時に保存

    # Order オブジェクトの保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # Address オブジェクトの保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                   building: building, phone_number: phone_number, order_id: order.id)
    # rescue StandardError => e
    # エラーハンsドリング
    # errors.add(:base, '購入処理でエラーが発生しました')
    # false
  end
end
