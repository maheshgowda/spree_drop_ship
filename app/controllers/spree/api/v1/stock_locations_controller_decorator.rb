Spree::Api::V1::StockLocationsController.class_eval do

  before_filter :supplier_locations, only: [:index]
  before_filter :supplier_transfers, only: [:index]
  
  before_filter :artist_locations, only: [:index]
  before_filter :artist_transfers, only: [:index]

  private

  def supplier_locations
    params[:q] ||= {}
    params[:q][:supplier_id_eq] = spree_current_user.supplier_id
  end

  def supplier_transfers
    params[:q] ||= {}
    params[:q][:supplier_id_eq] = spree_current_user.supplier_id
  end
  
  def artist_locations
    params[:q] ||= {}
    params[:q][:artist_id_eq] = spree_current_user.artist_id
  end

  def artist_transfers
    params[:q] ||= {}
    params[:q][:artist_id_eq] = spree_current_user.artist_id
  end


end
