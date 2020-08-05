module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    rescue_from Errors::Runtime::ActionFailed, with: :render_runtime_error_response
    rescue_from Errors::Runtime::ServiceFailed, with: :render_runtime_error_response
    rescue_from ActionController::RoutingError, with: :render_runtime_error_response
    rescue_from ActionController::ParameterMissing, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotDestroyed, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotUnique, with: :render_unprocessable_entity_response
  end

  private

  def render_unprocessable_entity_response error, status: :unprocessable_entity
    render json: Errors::ActiveRecordValidation.new(error.record).to_hash, status: status
  end

  def render_runtime_error_response error, status: :bad_request
    render json: error.to_hash, status: status
  end

  def render_record_not_found_response error, status: :not_found
    render json: Errors::ActiveRecordNotFound.new(error).to_hash, status: status
  end
end
