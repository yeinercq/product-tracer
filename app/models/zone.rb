# == Schema Information
#
# Table name: zones
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Zone < ApplicationRecord
  has_many :farms
   
  validates :name, presence: true
end
