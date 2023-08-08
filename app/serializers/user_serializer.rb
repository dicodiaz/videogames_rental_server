class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :name, :address, :admin, :created_at, :updated_at
end
