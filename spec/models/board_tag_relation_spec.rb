# == Schema Information
#
# Table name: board_tag_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_board_tag_relations_on_board_id  (board_id)
#  index_board_tag_relations_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (tag_id => tags.id)
#

require 'rails_helper'

RSpec.describe BoardTagRelation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
