require 'spec_helper'

describe "About page" do
  before { visit about_path }

  subject { page }

  describe "should have the right content" do
    it { should have_content("About") }
  end

end
