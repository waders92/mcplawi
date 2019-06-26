class TeetimesController < ApplicationController

  def index
    @teetimes = Teetime.all.order("created_at DESC").group_by(&:month) 
  end

  def new
    admin_required
    @teetime = Teetime.new
  end

  def create
    @teetime = current_user.teetimes.build(teetime_params)
    if @teetime.save
      send_flash_alert('New tee time was created!')
      redirect_to teetimes_path
    else
      render 'teetimes/new'
    end
  end

  def edit
    admin_required
    @teetime = Teetime.find_by(id: params[:id])
    return render_not_found if @teetime.blank?
  end

  def update
    @teetime = Teetime.find_by(id: params[:id])
    @teetime.update(teetime_params)
    if @teetime.save
      send_flash_alert('Tee time was updated!')
      redirect_to teetimes_path
    else
      render 'teetimes/edit'
    end
  end

  def destroy
    admin_required
    @teetime = Teetime.find_by(id: params[:id])
    @teetime.destroy
    send_flash_alert('Tee time has been removed!')
    redirect_to teetimes_path
  end

  private

  def teetime_params
    params.require(:teetime).permit(:teetime_pdf, :title, :date)
  end
end
