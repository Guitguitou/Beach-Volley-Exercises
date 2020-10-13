FactoryBot.define do
    factory :exercice do
      nom { 'Exercice1' }
      description { 'Description1' }
      fonction { 'Technique1' }
      worked { 'Réception1' }
      user
    end
  end