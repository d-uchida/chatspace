class ImageFilesController < ApplicationController
  def upload
    raise ArgumentError, 'invalid params' if params[:image].blank? || params[:name].blank?

    imageFile = ImageFile.create(image: params[:image])
    imageFile.save!
    redirect_to group_messages_path
    }
  end
end
