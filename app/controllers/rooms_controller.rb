class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    # @room = Room.find(params[:id])
    @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    @room.save
    redirect_to @room
  end


  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:title, :text)
  end
end
