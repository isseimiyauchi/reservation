class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @room.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @room.save
    redirect_to root_path
  end

  def posts
    @rooms = current_user.rooms.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :user_id, :image)
  end
end
