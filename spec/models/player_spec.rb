require 'spec_helper'

describe "Player" do

  before do
    @player = Player.new(first_name: "Jordan", last_name: "Hamel",
              organizer: :true, email: "jordan@hamel.com",
              password: "foobar", password_confirmation: "foobar")
  end

  subject { @player }

  it { should be_valid }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:organizer) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }

  context "with invalid info" do

    describe "without a first name" do
      before { @player.first_name = '' }
      it { should_not be_valid }
    end

    describe "without a last name" do
      before { @player.last_name = '' }
      it { should_not be_valid }
    end

    describe "without an email" do
      before { @player.email = '' }
      it { should_not be_valid }
    end

    describe "without a password" do
      before { @player.password = '' }
      it { should_not be_valid }
    end

    describe "without a password confirmation" do
      before { @player.password_confirmation = '' }
      it { should_not be_valid }
    end

    describe "with a password that is too short" do
      before { @player.password = "abc"}
      it { should_not be_valid }
    end

    describe "with a password that is too long" do
      before { @player.password = "a" * 31 }
      it { should_not be_valid }
    end

    describe "with an invalid email format" do
      before { @player.email = "jordan.hamel.com" }
      it { should_not be_valid }
    end

    describe "with a first name that is too long" do
      before { @player.first_name = "a" * 31 }
      it { should_not be_valid }
    end

    describe "with a last name that is too long" do
      before { @player.last_name = "a" * 31 }
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @player.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
  end
end