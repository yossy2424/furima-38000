class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :phone_number, :building, :user_id, :item_id, :address,:token
  
  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, presence: true
    validates :token, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

    def save
      # 寄付情報を保存し、変数donationに代入する
      purchase = Purchase.create(user_id: user_id,item_id: item_id)  
      # 住所を保存する
      # donation_idには、変数donationのidと指定する
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building: building, purchase_id: purchase.id, address: address)
    end
end