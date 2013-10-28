require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "Signin page" do
    before { visit signin_path }

    it { should have_content("Sign in") }
  end
end
