require 'rails_helper'

RSpec.describe TrainStation, type: :model do
  it { is_expected.to belong_to(:station) }
  it { is_expected.to belong_to(:train) }
end
