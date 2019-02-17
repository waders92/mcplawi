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
    @event.photo.update(photo_params)
    if @event.save
      send_flash_alert('Result was updated!')
      redirect_to event_path(@event)
    else
      render 'photos/edit'
    end
  end

  def edit 
    admin_required
    @event = Event.find(params[:event_id])
    @photo = Photo.find_by(id: params[:id])
    return render_not_found if @photo.blank?
  end


    private

    def admin_required
      unless current_user.admin?
        redirect_to root_path
        flash[:alert] = 'You are not an authorized administrator!'
      end
    end

    def photo_params
      params.require(:photo).permit(:flight_winner, :winners_image, :which_flight, :winning_score)
    end

    def send_flash_alert(message)
      flash[:alert] = message
    end
  
    def send_flash_error(message)
      flash[:error] = message
    end

    def render_not_found(status = :not_found)
      render plain: status.to_s.titleize.to_s, status: status
    end
end
