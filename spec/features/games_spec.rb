require 'spec_helper'

describe "add a new game" do

  def make_new_game
    visit new_game_path
    fill_in 'Organizer id', :with => 1
    fill_in 'Rules', :with => "These are the rules for the game."
    click_button 'Create Game!'
  end

  context "with valid info" do
    it "should increase game count by one" do
      expect { make_new_game }.to change(Game, :count).by(1)
    end

    it "should redirect to the game page" do
      make_new_game
      current_path.should =~ Regexp.new('games/\d+')
    end
  end

  context "with invalid info" do
    it "should not increase game count" do
      expect do
        visit new_game_path
        click_button 'Create Game!'
      end.to_not change(Game, :count)
    end
  end
end