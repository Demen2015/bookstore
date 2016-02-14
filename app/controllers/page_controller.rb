class PageController < ApplicationController
  add_breadcrumb "Home", :root_path
  def home
    add_breadcrumb "", :root_path
    @product_recommend = Product.limit(12).order("RAND()")
    @product_newest = Product.last(12)
    # @product_search= Product.search(params[:search])
    # byebug

  end

  def shop
    add_breadcrumb "Shop", page_shop_path
    @products = Product.all.page(params[:page])
  end

  def contact
    add_breadcrumb "Contact", page_contact_path
  end

  def faqs
    add_breadcrumb "FAQs", page_faqs_path
  end

  def store
    add_breadcrumb "Store", page_store_path
  end

  def search
    add_breadcrumb "Search Result", search_path
    @productsearch = Product.where('title LIKE ?',"%#{params[:search]}%").page(params[:page])


  end
end
