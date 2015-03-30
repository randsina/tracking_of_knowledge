class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @technologies = []
      @tags = []
      @themes = []
    else
      @technologies = Technology.search params[:q]
      @tags = Tag.search params[:q]
      @themes = Theme.search params[:q]
    end
  end
end
