Spree.user_class.class_eval do

  belongs_to :supplier, class_name: 'Spree::Supplier'
  
  belongs_to :artist, class_name: 'Spree::Artist'

  has_many :variants, through: :supplier
  
  has_many :variants, through: :artist
  
  def supplier?
    supplier.present?
  end
  
  def artist?
    artist.present?
  end
  
end
