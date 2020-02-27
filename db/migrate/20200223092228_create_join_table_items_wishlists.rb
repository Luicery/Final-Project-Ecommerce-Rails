class CreateJoinTableItemsWishlists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :items, :wishlists do |t|
      # t.index [:item_id, :wishlist_id]
      # t.index [:wishlist_id, :item_id]
    end
  end
end
