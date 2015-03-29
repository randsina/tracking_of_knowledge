class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @technologies = Technology.tagged_with(@tag.name)
  end
end
