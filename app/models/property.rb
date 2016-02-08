class Property < ActiveRecord::Base
  belongs_to :user
  has_many :wish_lists, :dependent => :destroy

  has_attached_file :image, styles: {large: '1024x768>', medium: "300x300>", thumb: "100x100>"},
                    default_url: "/assets/missing.png"

  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'


  validates :user, :title, :description, :country, :city, :street1, :listing_type, :price, :presence => true
  validates :price, numericality: true

  scope :for_rent, -> { where(listing_type: 'For Rent') }
  scope :for_sale, -> { where(listing_type: 'For Sale') }

  ransacker :location, formatter: proc { |v| v.mb_chars.downcase.to_s } do |parent|
    Arel::Nodes::InfixOperation.new('||',
                                    Arel::Nodes::InfixOperation.new('||', parent.table[:city], Arel::Nodes.build_quoted(', ')),
                                    parent.table[:country])
  end



  def self.locations
    Property.order(:city).pluck(:city, :country).uniq
  end

  def location
    "#{self.city}, #{self.country}"
  end

  def wished_by?(usr_id)
    self.wish_lists.where(user_id: usr_id).present?
  end

end
