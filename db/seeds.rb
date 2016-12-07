# Clear database
UserSong.destroy_all
JamSessionUser.destroy_all
Playlist.destroy_all
Song.destroy_all
User.destroy_all
JamSession.destroy_all


# Songs (3)
songs = [

  {
    title: "Jimmy",
    author: "Moriarty",
    lyrics: "Jimmy won't you please come home
              Where the grass is green and the buffaloes roam
              Come see Jimmy your uncle Jim
              And your auntie Jimmie and your cousin Jim
              Come home Jimmy 'cause you need a bath
              And your grandpa Jimmy is still gone daft

              Now there's buffalo Jim and buffalo Jim
              And Jim buffalo now didn't you know
              Jim Jim Jimmy it's your last cigarette
              But there's buffalo piss and it's all kind of wet
              Jambo Jimmy you'd better hold your nose
              All roads lead to roam with the buffaloes

              And the buffaloes used to say be proud of your name
              The buffaloes used to say be what you are
              The buffaloes used to say roam where you roam
              Buffaloes used to say do what you do

              Hey you've gotta have a wash but you can't clean your name
              You're now called Jimmy, you'll be Jimmy just the same
              The keys are in a bag in a chest by the door
              One of Jimmy's friends has taken the floor

              Jimmy won't you please come home
              Where the grass is green and the buffaloes roam
              Dear old Jimmy you've forgotten you're young
              But you can't ignore the buffalo song

              And the buffaloes used to say be proud of your name
              The buffaloes used to say be what you are
              The buffaloes used to say roam where you roam
              Buffaloes used to say do what you do
              If you remember you're unknown
              Buffaloland will be your home
              If you remember you're a gnome
              Buffaloland will be your home
              If you remember you're a Noam
              Buffaloland will be your home
              If you remember you're unknown
              Buffaloland will be your home"
  },
  {
    title: "Stand by me",
    author: "Ben.E.King",
    lyrics: "When the night has come
            And the land is dark
            And the moon is the only light we'll see
            No I won't be afraid
            Oh, I won't be afraid
            Just as long as you stand, stand by me

            So darling, darling
            Stand by me, oh stand by me
            Oh stand, stand by me
            Stand by me

            If the sky that we look upon
            Should tumble and fall
            Or the mountain should crumble to the sea
            I won't cry, I won't cry
            No, I won't shed a tear
            Just as long as you stand, stand by me

            And darling, darling
            Stand by me, oh stand by me
            Oh stand now, stand by me
            Stand by me

            So darling, darling
            Stand by me, oh stand by me
            Oh stand now, stand by me, stand by me
            Whenever you're in trouble won't you stand by me
            Oh stand by me, won't you stand now, oh, stand
            Stand by me"
  },
  {
    title: "Falling Slowly",
    author: "Glen Hansard",
    lyrics: "I don't know you
              But I want you
              All the more for that
              Words fall through me
              And always fool me
              And I can't react
              And games that never amount
              To more than they're meant
              Will play themselves out

              Take this sinking boat and point it home
              We've still got time
              Raise your hopeful voice you have a choice
              You'll make it now

              Falling slowly, eyes that know me
              And I can't go back
              Moods that take me and erase me
              And I'm painted black
              You have suffered enough
              And warred with yourself
              It's time that you won

              Take this sinking boat and point it home
              We've still got time
              Raise your hopeful voice you have a choice
              You'll make it now

              Falling slowly sing your melody
              I'll sing along"
  },
]

songs.each do |song|
  Song.create!(song)
end

# User (1)

users = [
  {
    email: "cantoine85@gmail.com",
    password: "password"
  },
]

users.each do |user|
  User.create!(user)
end

# User Songs

user_songs = [
  {
    user: {
      email: "cantoine85@gmail.com"
    },
    songs:[
      { title: "Jimmy" },
      { title: "Stand by me" },
      { title: "Falling Slowly" }
    ]
  }
]

user_songs.each do |user_song|
  user = User.find_by(user_song[:user])
  user_song[:songs].each do |song|
    song = Song.find_by(song)
    user_song = UserSong.new
    user_song.song = song
    user_song.user = user
    puts "Add #{song.title} to #{user.email}" if user_song.save
  end
end

# Jam sessions (2)

jam_sessions = [
  {
    title: "Beatles Moment",
    description: "Have a nice moment together",
    date: Date.new(2016, 12, 24),
    location: "15 avenue Julien, Clermont-Ferrand"
  },
  {
    title: "Folk Night",
    description: "Play music together",
    date: Date.new(2016, 12, 26),
    location: "15 avenue Julien, Clermont-Ferrand"
  },
]

jam_sessions.each do |jam_session|
  jam_session = JamSession.new(jam_session)
  puts "Added jam session #{jam_session.title}" if jam_session.save
end

# Jam Session Users (2)

jam_session_users = [
  {
    user: {
      email: "cantoine85@gmail.com"
    },
    jam_sessions:[
      { title: "Folk Night" },
      { title: "Beatles Moment" },
    ]
  }
]

jam_session_users.each do |jam_session_user|
  user = User.find_by(jam_session_user[:user])
  jam_session_user[:jam_sessions].each do |jam_session|
    jam_session_user = JamSessionUser.new
    jam_session_user.user = user
    jam_session = JamSession.find_by(jam_session)
    jam_session_user.jam_session = jam_session
    puts "Add Jam Session #{jam_session.title} to #{user.email}" if jam_session_user.save
  end
end

# Jam_Session_Song

jam_session_songs = [
  {
    jam_session: {
      title: "Folk Night"
    },
    songs:[
      { title: "Jimmy" },
      { title: "Stand by me" },
      { title: "Falling Slowly" }
    ]
  }
]

jam_session_songs.each do |jam_session_song|
  jam_session = JamSession.find_by(jam_session_song[:jam_session])
  jam_session_song[:songs].each do |song|
    jam_session_song = Playlist.new()
    jam_session_song.jam_session = jam_session
    song = Song.find_by(song)
    jam_session_song.song = song
    puts "Add song #{song.title} to jam session #{jam_session.title}" if jam_session_song.save
  end
end









