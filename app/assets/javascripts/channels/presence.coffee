App.presence = App.cable.subscriptions.create "PresenceChannel",
  connected: ->
    console.log('PresenceChannel connected')

  disconnected: ->
    console.log('PresenceChannel disconnected')

  received: (data) ->
    console.log('PresenceChannel received')

    App.presence.drawOnlineUsers(data.users)

  drawOnlineUsers: (users) ->
    console.log(users)
    console.log(users.length)
    if (users.length > 0)
      text = 'Online: '
      text += users.map((user) -> user.nickname).join(', ')

      $('.js-online-users').text(text)
