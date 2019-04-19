class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.info "Subscribed to RoomChannel, roomId: #{params[:roomId]}"

    @room = Room.find(params[:roomId])

    stream_from "room_channel_#{@room.id}"
  end

  def unsubscribed
    logger.info "Unsubscribed to RoomChannel"
  end

  def speak(data)
    logger.info "RoomChannel, speak: #{data.inspect}"

    ActionCable.server.broadcast "room_channel_#{@room.id}", message: data['message']
  end
end
