class PicturesController < ApplicationController
  before_action :set_picture, only: [:show]
  before_action :auth, only: [:index, :show, :new, :sv, :pk, :dq]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.where(key: params[:key])
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    type = @picture.temp_type
    key = @picture.key
    case type
      when 0
        render layout: 'pk' and return
      when 1
        render layout: 'dq' and return
      when 2
        render layout: 'sv' and return
    end
    render :nothing and return
  end

  def sv
  end

  def pk
  end

  def dq
  end

  # GET /pictures/new
  def new
    p 'a'
    @picture = Picture.new
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    p 'b'
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.', params: @picture.key }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :key, :temp_type, :photo)
    end

    def auth
      key = params[:key]
      user = User.find_by(key: key)
      if user
        @user = user
      else
        throw(:abort)
      end
    end
end
