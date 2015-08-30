FactoryGirl.define do
  factory :user do
    first_name 'Max'
    surname 'Maximo'
    watchbug_id '100'
    email 'max@user.com'
    encrypted_password "$2a$10$tIS6qr14WPgRvhbpEhOrIuSGO7iiBKXw8KLPWQb0qBqXkpIVATpSG"
    password{'massimo'}
    username 'massimo'
    onboarded true
  end

end

