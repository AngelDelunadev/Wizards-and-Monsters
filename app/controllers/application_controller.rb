class ApplicationController < ActionController::API
  rescue_from RuntimeError, with: :rescue_unhandled_exception
  def rescue_unhandled_exception(error)
    render json: error
  end
  
end
