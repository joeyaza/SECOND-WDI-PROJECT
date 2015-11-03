class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /places
  # GET /places.json
  # def index
  #   @search = Place.search(params[:q])
  #   @places = @search.result
  # end


  def index
     @q = Place.ransack(params[:q])
     if params[:q].present?
       @q = Place.ransack(params[:q])
       @places = @q.result(distinct: true)
     else
       @places = Place.all
     end
   end

  # GET /places/1
  # GET /places/1.json
  def show
    
  end

  # GET /places/new
  def new
    @place = Place.new
    @pic = Pic.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @place = Place.find(params[:id])
    @place.upvote_by current_user
    redirect_to places_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def random_place
      @place = Place.find(rand(Place.count))
      redirect_to @place
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:country, :place, :pic_id, :user_id, :pic_urls)
    end

end
