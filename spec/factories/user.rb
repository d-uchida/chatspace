FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    name                   Faker::Name.name
    email                  Faker::Internet.email
    password              pass
    password_confirmation pass

    # after(:create) do |user|
    #   temp_group = create(:group)
    #   create(:message, user: user, group: temp_group)
    #   create(:user_group, user: user, group: temp_group)
    # end

    # after(:create) do |user|
    #   create(:user_group, user: user, group: create(:group))
    # end
  end
end
