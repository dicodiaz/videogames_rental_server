class VideogamesController < ApplicationController
  before_action :set_videogame, only: %i[show update destroy]

  # GET /videogames
  def index
    @videogames = Videogame.all

    render json: @videogames
  end

  # GET /videogames/1
  def show
    if @videogame
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data][:attributes]
    else
      render json: { message: 'Videogame not found' }, status: :not_found
    end
  end

  # POST /videogames
  def create
    @videogame = Videogame.new(videogame_params)

    if @videogame.save
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data][:attributes], status: :created,
             location: @videogame
    else
      render json: { message: @videogame.errors.full_messages.to_sentence.prepend('Error(s): ') },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videogames/1
  def update
    return render json: { message: 'Videogame not found' }, status: :not_found unless @videogame

    if @videogame.update(videogame_params)
      render json: VideogameSerializer.new(@videogame).serializable_hash[:data][:attributes]
    else
      render json: { message: @videogame.errors.full_messages.to_sentence.prepend('Error(s): ') },
             status: :unprocessable_entity
    end
  end

  # DELETE /videogames/1
  def destroy
    if @videogame
      @videogame.destroy
      render json: { message: 'Videogame deleted' }, status: :ok
    else
      render json: { message: 'Videogame not found' }, status: :not_found
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
