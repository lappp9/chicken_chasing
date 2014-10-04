require 'spec_helper'

describe "payment_methods/show" do
  before(:each) do
    @payment_method = assign(:payment_method, stub_model(PaymentMethod,
      :user_id => 1,
      :nickname => "Nickname",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Nickname/)
    rendered.should match(/Token/)
  end
end
