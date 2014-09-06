FactoryGirl.define do
  factory(:user) do
    name "moof"
    email "moof@moof.com"
    password "password"
    password_confirmation "password"
  end
end
