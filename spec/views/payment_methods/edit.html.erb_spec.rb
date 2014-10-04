require 'spec_helper'

describe "payment_methods/edit" do
  before(:each) do
    @payment_method = assign(:payment_method, stub_model(PaymentMethod,
      :user_id => 1,
      :nickname => "MyString",
      :token => "MyString"
    ))
  end

  it "renders the edit payment_method form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payment_method_path(@payment_method), "post" do
      assert_select "input#payment_method_user_id[name=?]", "payment_method[user_id]"
      assert_select "input#payment_method_nickname[name=?]", "payment_method[nickname]"
      assert_select "input#payment_method_token[name=?]", "payment_method[token]"
    end
  end
end
