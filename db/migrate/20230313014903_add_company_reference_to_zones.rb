class AddCompanyReferenceToZones < ActiveRecord::Migration[7.0]
  def change
    add_reference :zones, :company, null: false, foreign_key: true
  end
end
