class PicsController < ApplicationController
  before_filter :set_search
  before_action :set_pic, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /pics
  # GET /pics.json

  def index
    @q = Pic.ransack(params[:q])
    if params[:q].present?
      @q = Pic.ransack(params[:q])
      @pics = @q.result(distinct: true)
    else 
      @pics = Pic.all
    end
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
    @pic = Pic.find(params[:id])
  end

  # GET /pics/new
  def new
    @pic = Pic.new
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = current_user.pics.new(pic_params)

    # if @pic.save
    #      redirect_to pics_path, notice: "The pic has been uploaded."
    #    else
    #      render "new"
    #    end
    respond_to do |format|
      if @pic.save
        format.html { redirect_to @pic, notice: 'Pic was successfully created.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  # PATCH/PUT /pics/1.json
  def update
    respond_to do |format|
      if @pic.update(pic_params)
        format.html { redirect_to @pic, notice: 'Pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    current_user.pics.find(params[:id]).destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to pics_url, notice: 'Pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @pic = Pic.find(params[:id])
    @pic.upvote_by current_user
    redirect_to pics_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:url, :image, :title, :description, :place_id, :user_id, :username)
    end
end
