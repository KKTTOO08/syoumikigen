class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :syumoku
  
  validates :name, presence: true, length: {maximum: 255 }
  validates :syumoku_id, presence: true
  
  attr_accessor :zanbi

def generate_zanbi
  kigen = self.syumoku.kigen
  past_secounds = Time.zone.now - Item.first.created_at
  past_days = (past_secounds / 1.days).floor
  self.zanbi = kigen - past_days
end
  
end
