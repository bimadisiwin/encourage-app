# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :board do
    name { "MyString" }
    title { "MyString" }
    body { "MyText" }
  end
end
