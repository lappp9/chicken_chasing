require 'spec_helper'

describe "AuthenticationPages" do
  describe "the login page" do
    it "should have a login h1" do
      visit login_path
      expect(page).to have_content "Login"
    end
  end
end
