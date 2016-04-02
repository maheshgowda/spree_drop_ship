require 'spec_helper'

describe Spree.user_class do

  it { should belong_to(:supplier) }

  it { should have_many(:variants).through(:supplier) }

  let(:user) { build :user }

  it '#supplier?' do
    user.supplier?.should be false
    user.supplier = build :supplier
    user.supplier?.should be true
  end

  
   it { should belong_to(:artist) }

  it { should have_many(:variants).through(:artist) }

  let(:user) { build :user }

  it '#artist?' do
    user.artist?.should be false
    user.artist = build :artist
    user.artist?.should be true
  end
  
  
end
