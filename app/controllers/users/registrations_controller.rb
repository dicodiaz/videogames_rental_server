class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: UserSerializer.new(resource).serializable_hash[:data][:attributes], status: :ok
    else
      render json: { error: "User couldn't be created successfully" }, status: :unprocessable_entity
    end
  end
end
