class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :days, :total_price, :created_at
  attribute :videogame do |reservation|
    VideogameSerializer.new(reservation.videogame).serializable_hash[:data][:attributes]
  end
end
