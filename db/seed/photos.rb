user1 = User.first
user2 = User.last

photo1 = Photo.create!(user: user1, file: File.open(File.join(Rails.root, "db", "seed", "photos", "1.png")))
photo2 = Photo.create!(user: user1, file: File.open(File.join(Rails.root, "db", "seed", "photos", "2.jpg")))
photo3 = Photo.create!(user: user1, file: File.open(File.join(Rails.root, "db", "seed", "photos", "3.jpg")))
photo4 = Photo.create!(user: user1, file: File.open(File.join(Rails.root, "db", "seed", "photos", "4.jpg")))
photo5 = Photo.create!(user: user2, file: File.open(File.join(Rails.root, "db", "seed", "photos", "5.jpg")))

album1 = Album.create!(title: "My photo", description: "Trololo", user: user1)
AlbumPhotoSetting.create!(album: album1, photo: photo2)
AlbumPhotoSetting.create!(album: album1, photo: photo3)
temp = AlbumPhotoSetting.create!(album: album1, photo: photo4)
album1.top = temp
album1.save!
album2 = Album.create!(title: "Empty", user: user1)

album3 = Album.create!(title: "TES", description: "Oblivion", user: user2)
AlbumPhotoSetting.create!(album: album3, photo: photo5)