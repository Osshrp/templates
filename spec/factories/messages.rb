FactoryGirl.define do
  factory :message do
    title "MyString"
    text "MyText"
  end

  factory :invalid_message, class: 'Message' do
    title nil
    text nil
  end
end
