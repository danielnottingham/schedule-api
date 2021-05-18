class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_path(object.kind.id) }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_path(object.id) }

  def attributes(*args)
    attributes = super(*args)
    attributes[:birthdate] = object.birthdate.strftime('%d/%m/%Y')
    # attributes[:birthdate] = object.birthdate.to_time.iso8601
    attributes
  end
end
