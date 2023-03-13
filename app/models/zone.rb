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
  belongs_to :company

  has_many :farms, dependent: :destroy

  scope :ordered, -> { order(id: :desc) }

  validates :name, presence: true

  before_create :generate_code

  # after_create_commit -> { broadcast_prepend_to "zones", partial: "zones/zone", locals: { zone: self }, target: "zones" }
  broadcasts_to ->(zone) { [zone.company, "zones"] }, inserts_by: :prepend

  private

  def generate_code
    self.code = "NEW CODE XXX"
  end
end
