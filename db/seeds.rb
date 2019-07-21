5.times do
  Comment.create!(text: Faker::Lorem.sentence, user_id: 1, product_id: 1)
end