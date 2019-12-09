# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # 名前、コメントがあれば有効な状態であること
  it "is vailid with a name, title, and body" do
    board = Board.create(
      name: "名前",
      title: " タイトル ",
      body: " 本文 ",
    )
    comment = Comment.create(
      board_id: board.id,
      name: "名前",
      comment: "コメント",
    )
    expect(comment).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    comment = FactoryBot.build(:comment, name: nil)
    comment.valid?
    expect(comment.errors.full_messages).to include("名前を入力してください")
  end

  # コメントがなければ無効な状態であること
  it "is invalid without a comment" do
  comment = FactoryBot.build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors.full_messages).to include("コメントを入力してください")
  end
end
