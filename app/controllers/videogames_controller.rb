class VideogamesController < ApplicationController
  before_action :set_videogame, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /videogames
  def index
    @videogames = Videogame.all.order(updated_at: :desc)

    render json: @videogames.map { |videogame| VideogameSerializer.new(videogame).serializable_hash[:data] }
  end

  # GET /videogames/1
  def show
    if @videogame
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data]
    else
      render json: { error: 'Videogame not found' }, status: :not_found
    end
  end

  # POST /videogames
  def create
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless can? :create, Videogame

    @videogame = Videogame.new(videogame_params)

    if @videogame.save
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data], status: :created,
             location: @videogame
    else
      render json: { error: @videogame.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videogames/1
  def update
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless can? :update, Videogame
    return render json: { error: 'Videogame not found' }, status: :not_found unless @videogame

    if @videogame.update(videogame_params)
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data]
    else
      render json: { error: @videogame.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  # DELETE /videogames/1
  def destroy
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless can? :destroy, Videogame

    if @videogame
      @videogame.destroy
      render json: { message: 'Videogame deleted' }, status: :ok
    else
      render json: { error: 'Videogame not found' }, status: :not_found
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_videogame
    @videogame = Videogame.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def videogame_params
    params.require(:videogame).permit(:name, :photo, :description, :price_per_day)
  end
end
