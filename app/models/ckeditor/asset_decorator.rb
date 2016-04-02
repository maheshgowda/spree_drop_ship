if defined?(Ckeditor)
  Ckeditor::Asset.class_eval do
    belongs_to :supplier, class_name: 'Spree::Supplier'
    belongs_to :artist, class_name: 'Spree::Artist'
  end
end
