class Api::V1::BaseController < ApplicationController
  before_filter :authenticate_user!

  rescue_from ActiveRecord::UnknownAttributeError, ArgumentError do |exception|
    respond_with_error(exception, 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    respond_with_error(exception, 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    respond_with_error(exception, 422, errors: exception.record.errors.messages)
  end

  rescue_from RuntimeError do |exception|
    respond_with_error(exception, 500)
  end

  private

  def respond_with_error(exception, code, errors = {})
    render json: { error: exception.class.to_s,
                   message: exception.to_s,
                   errors: errors },
           status: code
  end
end
