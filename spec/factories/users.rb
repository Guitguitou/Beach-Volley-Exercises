FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "email#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
      nom { 'Chou' }
      prenom { 'Guitou' }
      club { 'SSA' }
      pays { 'France' }
    end
  end