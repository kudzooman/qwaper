class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new

  end

  def edit
  end
end
