class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  accepts_nasted_attributes_for :phones, allow_destroy: true

  def as_json(options={})
    attributes = super(options)
    attributes[:birthdate] = self.birthdate.strftime('%d/%m/%Y')
    attributes
  end
end
