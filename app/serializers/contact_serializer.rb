class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    attributes = super(*args)
    attributes[:birthdate] = object.birthdate.strftime('%d/%m/%Y')
    # attributes[:birthdate] = object.birthdate.to_time.iso8601
    attributes
  end
end
