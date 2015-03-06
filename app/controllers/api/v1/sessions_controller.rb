class Api::V1::SessionsController < Devise::SessionsController
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  skip_before_filter  :verify_authenticity_token
  def create
    self.resource = warden.authenticate!(params[:user])
    sign_in(resource_name, resource)

    current_user.update authentication_token: nil

    respond_to do |format|
      format.json {
        render :json => {
          :user => current_user,
          :status => :ok,
          :authentication_token => current_user.authentication_token
        }
      }
    end
  end

  # DELETE /resource/sign_out
  def destroy
    user = User.find_by(email: env["HTTP_X_USER_EMAIL"])
    respond_to do |format|
      format.json {
        if user
          user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end
      }
    end
  end
end
