json.array!(@payment_methods) do |payment_method|
  json.extract! payment_method, :user_id, :nickname, :token
  json.url payment_method_url(payment_method, format: :json)
end