class Country < ActiveRecord::Base

  # t.string :name
  # t.string :code
  # t.timestamps
  # t.primary_key :code

  self.primary_key = :code
  attr_accessible :name, :code, :visited

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies
  has_many :country_users , :foreign_key => :country_code
  has_many :users, through: :country_users


  accepts_nested_attributes_for :currencies, :allow_destroy => true

  scope :visited, :conditions => { :visited => true }
  scope :not_visited, :conditions => { :visited => false }

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
