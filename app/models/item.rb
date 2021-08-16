class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  
  attr_accessor :zanbi

def generate_zanbi
kigen = self.type.kigen
past_secounds = Time.zone.now - Item.first.created_at
past_days = (past_secounds / 1.days).floor
self.zanbi = kigen - past_days
end
  
end
