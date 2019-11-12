class Populate::Users
  def populate
    create_users
  end

  private

  def create_users
    password = 'user123'

    10.times do |index|
      User.create!(
        name: Faker::Name.name,
        email: "user#{index}@gmail.com",
        password: password,
        password_confirmation: password
      )
    end
  end
end
