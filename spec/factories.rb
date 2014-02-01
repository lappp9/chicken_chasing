FactoryGirl.define do 

  factory :user do
    name                  "Luke Parham"
    email                 "lappp9@gmail.com"
    password              "riley123"
    password_confirmation "riley123"
    profile_type          "farmer"
    profile_id            10
  end

  factory :farmer do 
    id                  10
    favorite_quotes     "hello"
    role_models         "roles"
    personal_philosophy "philo"
  end

end
