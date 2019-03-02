class MinutesController < ApplicationController

  def index
    @minutes = Minute.all.order("created_at ASC").group_by(&:year)
  end

  def new
    admin_required
    @minute = Minute.new
  end

  def create
    @minute = current_user.minutes.build(minute_params)
    if @minute.save
      send_flash_alert('Minutes were created!')
      redirect_to minutes_path
    else
      render 'minutes/new'
    end
  end

  def edit
    admin_required
    @minute = Minute.find_by(id: params[:id])
    return render_not_found if @minute.blank?
  end

  def update
    @minute = Minute.find_by(id: params[:id])
    @minute.update(minute_params)
    if @minute.save
      send_flash_alert('Minutes were updated!')
      redirect_to minutes_path
    else
      render 'minutes/edit'
    end
  end

  def destroy
    admin_required
    @minute = Minute.find_by(id: params[:id])
    @minute.destroy
    send_flash_alert('Minutes have been removed!')
    redirect_to minutes_path
  end

  private

  def minute_params
    params.require(:minute).permit(:title, :date, :pdf_file)
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end

  def render_not_found(status = :not_found)
    render plain: status.to_s.titleize.to_s, status: status
  end

  def admin_required
    unless current_user && current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end
end
