FactoryGirl.define do
    factory :user do
        sequence(:first_name) { |n| "Person #{n}" }
        sequence(:last_name) { |n| "Person #{n}" }
        sequence(:email) { |n| "person_#{n}@example.com" }
        password "foobar"
        password_confirmation "foobar"

        factory :admin do
            admin true
        end
    end
    factory :micropost do
        content "Lorem ipsum"
        user
    end
end
