User.destroy_all
Idea.destroy_all
Review.destroy_all


12.times.each do
    
    name = Faker::Name.last_name
  
    User.create(
      name: name,
      email: "#{name.downcase}@nasa.gov",
      password: "pass"
    )
end
  
  users = User.all

50.times.each do
    idea =Idea.create(
        title: Faker::SiliconValley.invention,
        description: Faker::Lebowski.quote,
        user: users.sample
    )
    if idea.valid?
        rand(0..4).times.each do
            review = Review.create(
            body: Faker::Dune.quote,
            idea: idea, 
            user: users.sample
            )
        end
    end
end

