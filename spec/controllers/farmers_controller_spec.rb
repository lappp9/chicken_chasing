
require 'spec_helper'
include SessionsHelper

describe FarmersController do


  describe "viewing farmers account page" do

    let(:user)   { FactoryGirl.create(:user) } 
    let(:farmer) { FactoryGirl.create(:farmer) }

    context " a user who isnt logged in" do
      it "should only be viewable by that farmer" do
        
        get :show, { id: 1 }

        expect(response).to redirect_to root_path

      end
    end

    context "a logged in user who isn't a farmer" do
      before (:each) do 
        @user = User.create(name: "luke", email: "lapp@l.com", password:"riley123", password_confirmation: "riley123")
        sign_in @user
      end
      after(:each) do
        sign_out 
      end
      it "should redirect them to their account page" do 
        get :show, { id: 1 }

        expect(response).to redirect_to user_path(@user.id)

      end
    end

    context "a farmer who is currently logged in" do
      before(:each) do
        @good_user = User.create(name: "luke", email: "lapp@l.com", password:"riley123", password_confirmation: "riley123")
        @good_farmer = Farmer.create(favorite_quotes: "quote", role_models: "roels", personal_philosophy: "philo")
        @good_farmer.user = @good_user
        sign_in @good_user
      end
      after(:each) { sign_out } 

      #let(:farmer) { Farmer.find_by id: 10 }
      #let(:user)   { User.find_by email: "lappp9@gmail.com" }

      it "should require that farmer to be logged in" do
        get :show, { id: @good_farmer.id }
        expect(response).to render_template("show")
      end
    end

  end

end
