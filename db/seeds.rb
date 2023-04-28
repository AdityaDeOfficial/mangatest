# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create 5 dummy users

require 'faker'

# Create some users
5.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

# Create some mangas for each user
User.all.each do |user|
  3.times do
    manga = Manga.create(
      manga_title: Faker::Book.title,
      author: Faker::Book.author,
      description: Faker::Lorem.paragraph,
      genre_tag: Faker::Book.genre,
      user: user
    )

    # Attach cover image to the manga
    manga.cover_image.attach(io: File.open(Rails.root.join('public', 'sample_cover_image.jpg')), filename: 'sample_cover_image.jpg')

    # Create some chapters for each manga
    5.times do |n|
      chapter = manga.chapters.create(
        chapter_title: "Chapter #{n+1}",
        chapter_number: n+1
      )

      # Attach PDF file to the chapter
      chapter.pdf_upload.attach(io: File.open(Rails.root.join('public', 'sample_pdf_file.pdf')), filename: 'sample_pdf_file.pdf')
    end
  end
end
