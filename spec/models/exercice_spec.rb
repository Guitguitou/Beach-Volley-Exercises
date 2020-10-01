require 'rails_helper'

RSpec.describe Exercice, type: :model do
  it { should validate_presence_of(:nom) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:worked) }
  it { should validate_presence_of(:type) }
  it { should belong_to(:user) }
end
