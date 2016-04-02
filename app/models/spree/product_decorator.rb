Spree::Product.class_eval do

  has_many :suppliers, through: :master
  has_many :artists, through: :master

  def add_supplier!(supplier_or_id)
    supplier = supplier_or_id.is_a?(Spree::Supplier) ? supplier_or_id : Spree::Supplier.find(supplier_or_id)
    populate_for_supplier! supplier if supplier
  end

  def add_artist!(artist_or_id)
    artist = artist_or_id.is_a?(Spree::Artist) ? artist_or_id : Spree::Artist.find(artist_or_id)
    populate_for_artist! artist if artist
  end 
  
  def add_suppliers!(supplier_ids)
    Spree::Supplier.where(id: supplier_ids).each do |supplier|
      populate_for_supplier! supplier
    end
  end
  
  def add_artists!(artist_ids)
    Spree::Artist.where(id: artist_ids).each do |artist|
      populate_for_artist! artist
    end
  end

  # Returns true if the product has a drop shipping supplier.
  def supplier?
    suppliers.present?
  end
  
  def artist?
    artists.present?
  end
  
  private

  def populate_for_supplier!(supplier)
    variants_including_master.each do |variant|
      unless variant.suppliers.pluck(:id).include?(supplier.id)
        variant.suppliers << supplier
        supplier.stock_locations.each { |location| location.propagate_variant(variant) }
      end
    end
  end
  
  def populate_for_artist!(artist)
    variants_including_master.each do |variant|
      unless variant.artists.pluck(:id).include?(artist.id)
        variant.artists << artist
        artist.stock_locations.each { |location| location.propagate_variant(variant) }
      end
    end
  end

end
