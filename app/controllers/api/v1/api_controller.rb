class Api::V1::ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render :json=> exception.to_json, :status => :forbidden }
    end
  end
end
