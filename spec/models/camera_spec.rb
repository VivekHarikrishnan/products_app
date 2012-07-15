require 'spec_helper'

describe Camera do
  before { @camera = FactoryGirl.create(:camera) }

  subject { @camera }

  it { should respond_to :model }
  it { should respond_to :make }
  it { should respond_to :price }
end
