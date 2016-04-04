Spree::Admin::StockLocationsController.class_eval do

  create.after :set_supplier
  create.after :set_artist

  private

  def set_supplier
    if try_spree_current_user.supplier?
      @object.supplier = try_spree_current_user.supplier
      @object.save
    end
  end
  
   def set_artist
    if try_spree_current_user.artist?
      @object.artist = try_spree_current_user.artist
      @object.save
    end
   end

end
