require 'spec_helper'

describe "payment_methods/index" do
  before(:each) do
    assign(:payment_methods, [
      stub_model(PaymentMethod,
        :user_id => 1,
        :nickname => "Nickname",
        :token => "Token"
      ),
      stub_model(PaymentMethod,
        :user_id => 1,
        :nickname => "Nickname",
        :token => "Token"
      )
    ])
  end

  it "renders a list of payment_methods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
