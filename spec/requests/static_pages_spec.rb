require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "the home page" do
    before { visit home_path }

    it { should have_content 'Welcome to Chicken Chasing!' }
  end
end
