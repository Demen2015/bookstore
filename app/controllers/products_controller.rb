class ProductsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb "Detail", products_show_path(id: params[:id])

  end

  def add
  end

  def update
  end

  def destroy
  end
end
