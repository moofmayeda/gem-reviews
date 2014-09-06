FactoryGirl.define do
  factory(:user) do
    name "moof"
    email "moof@moof.com"
    password "password"
    password_confirmation "password"
  end

  factory(:gem) do
    name "gemgem"
    url "gem.com"
  end
end
