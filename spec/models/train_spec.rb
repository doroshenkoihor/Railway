require 'rails_helper'

RSpec.describe Train, type: :model do
  it { is_expected.to have_many(:stations).through(:train_stations) }
  it { is_expected.to have_many(:train_stations) }

  it { is_expected.to validate_presence_of(:name) }
end
