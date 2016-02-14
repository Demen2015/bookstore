class CategoriesController < ApplicationController

  add_breadcrumb "Home", :root_path
  def show
    @categories = Category.find(params[:id])
    @products = @categories.products.page(params[:page])
    add_breadcrumb @categories.categoryname, category_path
    # respond_to do |format|
    # format.html
    # format.js
    #end

  end

  def add
  end

  def update
  end

  def destroy
  end
end
