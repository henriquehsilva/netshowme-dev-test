User.create!(
  [
    { email: "john@mvmanor.co.uk", password: "secretpassword", password_confirmation: "secretpassword" },
    { email: "david@mvmanor.co.uk", password: "secretpassword", password_confirmation: "secretpassword" }
  ]
)

john = User.first
david = User.last

10.times.each do
    Movie.create(
    [
      {
        name: 'Singapore/Malaysia (Ch 8)',
        url: 'https://d34e90s3s13i7n.cloudfront.net/hls/ch8ctv/master02.m3u8',
        poster: 'https://video.toggle.sg/image/5166818/16x9/236/133/a6eec7dcb1648300cfbaa9a076b4fce8/jV/channel-8.png',
        user_id: john.id
      },
      {
        name: 'Singapore/Malaysia (Ch U)',
        url: 'https://d3inlz9elsutjl.cloudfront.net/hls/chuctv/master02.m3u8',
        poster: 'https://video.toggle.sg/image/5308024/16x9/236/133/38aa7e2b749478c4bba097b540b93720/TN/channel-u.png',
        user_id: david.id
      }
    ]
  )
end
