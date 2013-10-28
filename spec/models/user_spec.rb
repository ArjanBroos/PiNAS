require 'spec_helper'

describe User do
  before { @user = User.new(name: "Arjan", password: "Smurf123", password_confirmation: "Smurf123") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should be_invalid}
  end

  describe "when password is not present" do
    before { @user = User.new(name: "Arjan2", password: " ", password_confirmation: " ") }
    it { should be_invalid }
  end

  describe "when password confirmation does not match" do
    before { @user.password_confirmation = "Aboee" }
    it { should be_invalid }
  end

  describe "when name is already taken" do
    before do
      same_name = @user.dup
      same_name.name = @user.name.upcase
      same_name.save
    end

    it { should be_invalid }
  end

  describe "with a password that is too short" do
    before { @user.password = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(name: @user.name) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let (:invalid_pw_user) { found_user.authenticate("invalid") }
      it { should_not eq invalid_pw_user }
      specify { expect(invalid_pw_user).to be_false }
    end
  end
end
