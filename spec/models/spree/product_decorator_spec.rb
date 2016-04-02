require 'spec_helper'

describe Spree::Product do

  let(:product) { create :product }

  it '#supplier?' do
    product.supplier?.should eq false
    product.add_supplier! create(:supplier)
    product.reload.supplier?.should eq true
  end

  it '#artist?' do
    product.artist?.should eq false
    product.add_artist! create(:artist)
    product.reload.artist?.should eq true
  end
  
end
