require 'spec_helper'

describe 'Game' do

  before do
    @game = Game.new(organizer_id: 1, rules: "Here are the rules.")
  end

  subject { @game }

  it { should be_valid }

  context "with invalid info" do
    describe "when the rules are blank" do
      before { @game.rules = '' }
      it { should_not be_valid }
    end

    describe "when the rules are too long" do
      before { @game.rules = 'a' * 5001 }
      it { should_not be_valid }
    end

    describe "when there is no organizer_id" do
      before { @game.organizer_id = '' }
      it { should_not be_valid }
    end
  end
end

