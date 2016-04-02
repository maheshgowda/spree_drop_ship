if defined?(Ckeditor::AttachmentFilesController)
  Ckeditor::AttachmentFilesController.class_eval do

    load_and_authorize_resource :class => 'Ckeditor::AttachmentFile'
    after_filter :set_supplier, only: [:create]
	after_filter :set_artist, only: [:create]

    def index
    end

    private

    def set_supplier
      if try_spree_current_user.supplier? and @attachment
        @attachment.supplier = try_spree_current_user.supplier
        @attachment.save
      end
	  
	   def set_artist
      if try_spree_current_user.artist? and @attachment
        @attachment.artist = try_spree_current_user.artist
        @attachment.save
      end
    end

  end
end
