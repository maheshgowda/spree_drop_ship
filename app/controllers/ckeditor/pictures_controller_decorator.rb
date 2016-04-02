if defined?(Ckeditor::PicturesController)
  Ckeditor::PicturesController.class_eval do
    load_and_authorize_resource :class => 'Ckeditor::Picture'
    after_filter :set_supplier, only: [:create]
	after_filter :set_artist, only: [:create]

    def index
    end

    private
    def set_supplier
      if spree_current_user.supplier? and @picture
        @picture.supplier = spree_current_user.supplier
        @picture.save
      end
    end
	
	 def set_artist
      if spree_current_user.artist? and @picture
        @picture.artist = spree_current_user.artist
        @picture.save
      end
    end
  end
end
