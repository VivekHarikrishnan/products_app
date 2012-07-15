# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    author "MyString"
    description "MyText"
    price "9.99"
  end
end
