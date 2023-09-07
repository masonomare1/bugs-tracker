# frozen_string_literal: true

ActiveRecord::Base.transaction do
  30.times do |i|
    User.create(
      name: Faker::Name.first_name,
      email: Faker::Internet.email,
      user_type: User::User_role.sample,
      password: 'password'
    )

    Rails.logger.debug { "User #{i + 1} has been created" }
  end
end
