FactoryGirl.define do

  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(8)}
    password_confirmation {password}

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
