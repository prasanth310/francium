9.times do |guide|
    Guide.create!(
        tittle: "ifdjn#{guide}",
        body: 'ufd'
    )
end
puts "9 guide"
9.times do |matrimony|
    Matrimony.create!(
        name: "ifdjn#{matrimony}",
        age: 32,
        spa: 3000000,
        main_image: "http://placehold.it/600x400",
        thumb_image: "http://placehold.it/350x200"
    )
end
puts "9 mat"
