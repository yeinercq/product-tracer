# == Schema Information
#
# Table name: farms
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  code       :string
#  latitude   :string           not null
#  longitude  :string           not null
#  country    :string           not null
#  state      :string           not null
#  city       :string           not null
#  address    :string           not null
#  zone_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Farm < ApplicationRecord
  belongs_to :zone

  scope :ordered, -> { order(id: :desc) }
  
  validates :name, :latitude, :longitude, :country, :state, :city, :address, presence: true
end
