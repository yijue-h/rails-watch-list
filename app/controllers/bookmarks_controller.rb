class BookmarksController < ApplicationController
  before_action

  def new
    @bookmarks = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to movie_path(@movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
