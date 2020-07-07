class FavoritesController < ApplicationController
  before_action :set_book

  def create
    @favorite = current_user.favorites.new(:book_id=>params[:book_id])
    @favorite.save
    @favorites = Favorite.where(book_id: params[:book_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    favorite.destroy
    @favorites = Favorite.where(book_id: params[:book_id])
  end
  private

  def set_book
    @book = Book.find(params[:book_id])
  end


end
