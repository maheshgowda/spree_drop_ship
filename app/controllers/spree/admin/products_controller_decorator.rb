Spree::Admin::ProductsController.class_eval do

  before_filter :get_suppliers, only: [:edit, :update]
  before_filter :supplier_collection, only: [:index]
  
  before_filter :get_artists, only: [:edit, :update]
  before_filter :artist_collection, only: [:index]

  private

  def get_suppliers
    @suppliers = Spree::Supplier.order(:name)
  end
  
   def get_artists
    @artists = Spree::Artist.order(:name)
   end
  

  # Scopes the collection to the Supplier.
  def supplier_collection
    if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
      @collection = @collection.joins(:suppliers).where('spree_suppliers.id = ?', try_spree_current_user.supplier_id)
    end
  end
  
  def artist_collection
    if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.artist?
      @collection = @collection.joins(:artists).where('spree_artists.id = ?', try_spree_current_user.artist_id)
    end
  end
  
end
