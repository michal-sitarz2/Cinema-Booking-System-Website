class AddUserToCart < ActiveRecord::Migration[5.2]
  def up
    add_reference :carts, :user, index: true
    Cart.reset_column_information
    user = User.first

    Cart.all.each do |cart|
      cart.user_id = user.id
      cart.save!
    end

    add_foreign_key :carts, :users
  end

  def down
    remove_foreign_key :carts, :users
    remove_reference :carts, :user, index: true
  end
end
