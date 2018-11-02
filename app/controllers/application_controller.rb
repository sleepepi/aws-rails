class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :devise_login?

  private

  def devise_login?
    params[:controller] == "sessions" && params[:action] == "create"
  end

  # Expects an "Uploader" type class, ex: uploader = @project.logo
  def send_file_if_present(uploader, *args)
    if uploader.present?
      send_file uploader.path, *args
    else
      head :ok
    end
  end
end
