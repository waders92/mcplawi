class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    admin_required
    @event = Event.find(params[:event_id])
    @photo = Photo.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event.photos.create(photo_params)
    if @event.save
      send_flash_alert('Result was added!')
      redirect_to event_path(@event)
    else
      render 'photos/new'
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @photo = Photo.find_by(id: params[:id])
    @photo.update(photo_params)
    send_flash_alert('Result was updated!')
    redirect_to event_path(@event)
  end

  def edit 
    admin_required
    @event = Event.find_by(id: params[:event_id])
    @photo = Photo.find_by(id: params[:id])
    return render_not_found if @photo.blank?
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    if @event.save
      send_flash_alert('Result was deleted!')
      redirect_to event_path(@event)
    else
      render 'photos/edit'
    end
  end


  private

    def photo_params
      params.require(:photo).permit(:flight_winner, :winners_image, :which_flight, :winning_score)
    end
end
