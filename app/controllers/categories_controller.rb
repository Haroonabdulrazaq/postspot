class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  def index
    @categories = Category.all.order('created_at ASC')
  end

  def show; end

  def edit; end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
