require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:nom) }
  it { should validate_presence_of(:prenom) }
  it { should have_many(:exercices)}
end
