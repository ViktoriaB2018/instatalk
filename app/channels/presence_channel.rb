class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence_channel"

    current_user.update_attribute(:online, true)

    ActionCable.server.broadcast "presence_channel", users: User.online.as_json
  end

  def unsubscribed
    stream_from "presence_channel"

    current_user.update_attribute(:online, false)

    ActionCable.server.broadcast "presence_channel", users: User.online.as_json
  end
end
