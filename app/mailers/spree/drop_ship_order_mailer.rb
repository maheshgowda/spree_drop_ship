module Spree
  class DropShipOrderMailer < Spree::BaseMailer

    default from: Spree::Store.current.mail_from_address

    def supplier_order(shipment_id)
      @shipment = Shipment.find shipment_id
      @supplier = @shipment.supplier
      mail to: @supplier.email, subject: Spree.t('drop_ship_order_mailer.supplier_order.subject', name: Spree::Store.current.name, number: @shipment.number)
    end
    
    def artist_order(shipment_id)
      @shipment = Shipment.find shipment_id
      @artist = @shipment.artist
      mail to: @artist.email, subject: Spree.t('drop_ship_order_mailer.artist_order.subject', name: Spree::Store.current.name, number: @shipment.number)
    end
  end
end
