class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  def as_json(options={})
    attributes = super(options)
    attributes[:birthdate] = self.birthdate.strftime('%d/%m/%Y')
    attributes
  end
end
