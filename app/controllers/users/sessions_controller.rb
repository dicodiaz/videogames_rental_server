class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def destroy
    super { @logged_out = true }
  end

  private

  def respond_with(resource, _opts = {})
    render json: UserSerializer.new(resource).serializable_hash[:data][:attributes], status: :ok
  end

  def respond_to_on_destroy
    if @logged_out
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: "Couldn't find an active session" }, status: :unauthorized
    end
  end
end
