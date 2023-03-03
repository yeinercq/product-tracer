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

  scope :ordered, -> { order(id: :desc) }

  validates :name, presence: true

  before_create :generate_code

  private

  def generate_code
    self.code = "NEW CODE XXX"
  end
end
