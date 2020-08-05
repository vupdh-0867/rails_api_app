class RuntimeErrorSerializer < ActiveModel::Serializer
  attr_reader :code, :message

  def initialize code, message
    @code = code
    @message = message
  end

  def serialize
    {
      code: code,
      message: message
    }
  end
end
