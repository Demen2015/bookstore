class ShoppingcartsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    add_breadcrumb "View Cart", cart_path
    if session[:cart] then
       @cart = session[:cart]
    else
       @cart = {}
    end

  end

  def add

      id = params[:id]
      @product_id = Lineitem.find_by(id: id)

       if session[:cart] then
          cart = session[:cart]
       else
          session[:cart] = {}
          cart = session[:cart]
       end
       # byebug

       if cart[id] then
          cart[id] = cart[id] + 1

        else
          cart[id] = 1
       end
       # byebug
      redirect_to :action => :index

  end

  def confirm
    add_breadcrumb "View Cart", cart_path
    add_breadcrumb "Confirm", confirm_path
    @cart = session[:cart]

  end

  # clear 1 items
  def clearItem
    id = params[:id]
    @cart = session[:cart]
    @cart.delete(id);
    redirect_to :action => :index
  end

  # clear all cart
  def delete
    add_breadcrumb "Your Cart", cart_path
     session[:cart] ={}
     @cart ={}
     render 'index'
  end

  def update
    @cart = session[:cart]
    if @cart.update(cart_params)
        redirect_to @cart
    else
        render 'edit'
    end

  end

  def complete
    add_breadcrumb "Complete",complete_path
    session[:cart] ={}
     @cart ={}
  end

end
