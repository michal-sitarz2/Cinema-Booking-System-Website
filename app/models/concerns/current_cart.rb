module CurrentCart

  private
    # Sets the cart for the user
    def set_cart
      # Checks if there is a cart, uses a cart_id saved in the session
      @cart = Cart.find(session[:cart_id])
    # If not found the following will be executed
    rescue ActiveRecord::RecordNotFound
      # Firstly, checks if user is signed in (if not we don't need a cart)
      if user_signed_in?
        # Before making a new cart, it destroys the previous cart that the user had
        # And in turn all the items that were in the cart (if any)
        cart = Cart.find_by(user_id: current_user.id)
        cart.destroy if cart

        # Then a cart is created, and assigned to a user
        @cart = Cart.create(user_id: current_user.id)
        # Cart_id set in the session
        session[:cart_id] = @cart.id
      end
    end

end
