class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    raise ActiveRecord::RecordNotFound unless @image.file.attachment.present?
  rescue ActiveRecord::RecordNotFound
    set_notice('danger', 'Cannot find this image')
  end

  def create
    @image = Image.new
    @image.file.attach(image_param[:file])

    if @image.save
      set_notice('success', 'Image was successfully uploaded.')
      redirect_to @image
    else
      set_notice('danger', 'Failed to upload Image.')
      render :new
    end
  end

  private
  def image_param
    params.require(:image).permit(:file)
  end

  def set_notice(type, message)
    flash.now[:notice] = message
    flash.now[:notice_type] = type
  end
end
