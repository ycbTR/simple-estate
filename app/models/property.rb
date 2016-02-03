class Property < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: {large: '1024x768>', medium: "300x300>", thumb: "100x100>"},
                    default_url: "/assets/missing.png"

  do_not_validate_attachment_file_type :image

  validates :title, :description, :country, :city, :street1, :listing_type, :price, :presence => true
  validates :price, numericality: true

  scope :for_rent, -> { where(listing_type: 'For Rent') }
  scope :for_sale, -> { where(listing_type: 'For Sale') }

end
