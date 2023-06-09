class Order < ApplicationRecord

  validates :total_payment, presence: true
  validates :payment_option, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_address, length: { in: 1..48 }
  validates :shipping_postcode, length: { is: 8}
  validates :shipping_name, length: { in: 1..32 }
  validates :status, presence: true

  has_many :oder_details, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :oder_details

  enum payment_option: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}


  def temporary_information_input(current_customer_id)
    self.customer_id = current_customer_id
    self.shipping_fee = 800
    self.total_payment = 1
  end

  def order_in_postcode_address_name(postal_code, address, name)
    self.shipping_postcode = postal_code
    self.shipping_address = address
    self.shipping_name = name
  end


end
