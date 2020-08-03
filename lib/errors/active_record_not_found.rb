module Errors
  class ActiveRecordNotFound < Errors::ApplicationError
    attr_reader :model, :field, :detail

    def initialize error
      @model = error.model.underscore
      @detail = error.class.to_s.split("::")[1].underscore
      @field = error.model.constantize.primary_key
      @errors = serialize
    end

    def serialize
      [
        {
          resource: resource,
          field: field,
          code: code,
          message: message
        }
      ]
    end

    private
    def message
      I18n.t message_key,
        scope: [:api, :errors, :messages, :not_found],
        resource: resource.titlecase.downcase
    end

    def resource
      I18n.t model,
        locale: :api,
        scope: [:api, :errors, :resources],
        default: model
    end

    def code
      I18n.t detail,
        locale: :api,
        scope: [:api, :errors, :code],
        default: detail
    end

    def message_key
      I18n.t("api.errors.messages.not_found").key?(model) ? model : :default
    end
  end
end
