class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    room = Room.find(params[:room_id])
    p room
    p data['message']
    room.messages.create!(content: data['message'])
    #m.update!(content: data['message'])
    #Message.create! content: data['message']
  end
end
