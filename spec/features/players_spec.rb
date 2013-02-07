require 'spec_helper'

describe 'create a new player' do

  def fill_out_form
    visit '/players/new'
    fill_in "First name", :with => "Test"
    fill_in "Last name", :with => "Player"
    fill_in "Email", :with => "test@player.net"
    fill_in "Password", :with => "foobar"
    fill_in "Confirmation", :with => "foobar"
    click_button "I'm ready!"
  end

  context "with valid info" do
    it "should add new user to the database" do
      expect { fill_out_form }.to change(Player, :count).by(1)
    end

    it "should redirect to the user's profile" do
      fill_out_form
      current_path.should =~ Regexp.new('players/\d+')
    end
  end

  context "with invalid info" do
    it "should not add a new user to the database" do
      expect do
        visit '/players/new'
        click_button "I'm ready!"
      end.to_not change(Player, :count)
    end
  end
end