require 'spec_helper'

describe 'Game' do

  let( :game ) { Game.new(organizer_id: 1, rules: "Here are the rules.") }

  it { should be_valid }

  context "with invalid info" do
    describe "when the rules are blank" do
      before { game.rules = '' }
      it { should_not be_valid }
    end

    describe "when the rules are too long" do
      before { game.rules = 'a' * 5001 }
      it { should_not be_valid }
    end

    describe "when the start time is in the past" do
      pending
    end

    describe "when the end time is before the start time" do
      pending
    end
  end
end

