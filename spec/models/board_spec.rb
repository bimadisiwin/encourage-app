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
    # 名前、タイトル、本文があれば有効な状態であること
    it "is vailid with a name, title, and body" do
      board = Board.new(
        name: "名前",
        title: " タイトル ",
        body: " 本文 ",
      )
      expect(board).to be_valid
    end

    # 名前がなければ無効な状態であること
    it "is invalid without a name" do
      board = FactoryBot.build(:board, name: nil)
      board.valid?
      expect(board.errors.full_messages).to include("名前を入力してください")
    end

    # タイトルがなければ無効な状態であること
    it "is invalid without a title" do
    board = FactoryBot.build(:board, title: nil)
      board.valid?
      expect(board.errors.full_messages).to include("タイトルを入力してください")
    end
    # 本文がなければ無効な状態であること
    it "is invalid without a body" do
      board = FactoryBot.build(:board, body: nil)
      board.valid?
      expect(board.errors.full_messages).to include("本文を入力してください")
    end
end
