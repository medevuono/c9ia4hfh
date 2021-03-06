class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end


  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: "The room have been modified"
    else
      render :edit
    end 
  end

  def destroy
    room = Room.find(params[:id])
    room.delete

    redirect_to rooms_path, notice: "The room have been deleted"
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :price_per_night, :image_url)
    end
end
