require 'spec_helper'

describe "Signup page" do
  before { visit signup_path }

  subject { page }

  describe "should have the right content" do
    it { should have_content("Sign up") }
  end
end
