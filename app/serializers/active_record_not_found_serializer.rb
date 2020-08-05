class ActiveRecordNotFoundSerializer < ActiveModel::Serializer
  attr_reader :resource, :field, :code, :message

  def initialize resource, field, code, message
    @resource = resource
    @field = field
    @code = code
    @message = message
  end

  def serialize
    {
      resource: resource,
      field: field,
      code: code,
      message: message
    }
  end
end
