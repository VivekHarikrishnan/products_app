namespace :db do
	desc "Add sample data to db"

	task populate: :environment do
		make_books(3)
		make_cameras(2)
		make_songs(4)	
		make_books(1)
		make_cameras(3)
		make_songs(2)		
	end

	def make_books(number)
		number.times do |n|
			title = "Sample Book Title #{n+1}"
			author = Faker::Name.name
			description = Faker::Lorem.sentence(5)
			price = Random.rand(200..500)
			Book.create(title: title, author: author,
									description: description, price: price)
		end
	end

	def make_cameras(number)
		number.times do |n|
			model = "Model name #{n+1}"
			make = Faker::Company.name
			price = Random.rand(2000..5000)
			Camera.create(model: model, make: make, price: price)
		end
	end

	def make_songs(number)
		number.times do |n|
			name = Faker::Lorem.sentence(2)
			album = "Album #{n}"
			artist = Faker::Name.name
			Song.create(name: name, album: album, artist: artist)
		end		
	end
end