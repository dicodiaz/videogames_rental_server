class VideogameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :photo, :description, :price_per_day
end
