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

require 'rails_helper'

RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
