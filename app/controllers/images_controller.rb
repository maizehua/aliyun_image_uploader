class ImagesController < ApplicationController
  before_action :find_image, only: [:show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
  end

  def create
    @image = Image.new
    @image.file.attach(image_param[:file])
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully uploaded.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def image_param
    params.require(:image).permit(:file)
  end

  def find_image
    @image = Image.find(params[:id])
  end
end
