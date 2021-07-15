class ImagesController < ApplicationController
    def index
        @images = Image.all
    end

    def show
        @image = Image.find_by(id: params[:id])
    end

    def new
        @image = Image.new
    end

    def create
        image = Image.new(image_params)
        
        if image.save
            redirect_to image_path(image)
        else
            # add error display
            puts "error"
            render :new
        end
    end

    private

    def image_params
        params.require(:image).permit(:uploaded_image)
    end
end