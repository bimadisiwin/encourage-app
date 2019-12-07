require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:board) { create(:board) }

  describe "GET #index" do
    before { get :index }
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      expect(response).to be_successful
    end
    # ２００レスポンスを返すこと
    it "return a 200 resence" do
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #new" do
    before { get :new }
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      expect(response).to be_successful
    end
    # ２００レスポンスを返すこと
    it "return a 200 resence" do
      expect(response).to have_http_status "200"
    end
  end


  describe "POST #create" do
    # 掲示板を追加できること
    it "adds a board" do
      board_params = FactoryBot.attributes_for(:board)
      expect {
        post :create, params: { board: board_params }
      }.to change(Board, :count).by(1)
    end
  end

  describe "GET #show" do
    before do
      @board = FactoryBot.create(:board)
    end
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :show, params: { id: @board.id }
      expect(response).to be_successful
    end
    # ２００レスポンスを返すこと
    it "return a 200 resence" do
      get :show, params: { id: @board.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #edit" do
    before do
      @board = FactoryBot.create(:board)
    end
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :edit, params: { id: @board.id }
      expect(response).to be_successful
    end
    # ２００レスポンスを返すこと
    it "return a 200 resence" do
      get :edit, params: { id: @board.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "POST #update" do
    before do
      @board = FactoryBot.create(:board)
    end
    # 掲示板を更新できること
    it "updates a board" do
      board_params = FactoryBot.attributes_for(:board, title: "New title")
      patch :update, params: { id: @board.id, board: board_params }
      expect(@board.reload.title).to eq "New title"
    end
  end

  describe "DELETE #destroy" do
    before do
      @board = FactoryBot.create(:board)
    end
    # 掲示板を削除できること
    it "deletes a board" do
      expect {
        delete :destroy, params: { id: @board.id }
      }.to change(Board, :count).by(-1)
    end
  end

end
