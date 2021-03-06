class Category < ActiveRecord::Base
# attr_accessible :title, :body, :refactored_title
  attr_accessible :name, :position, :refactored_name, :show_in_menu
  has_many :other_pages
  validates_presence_of :name, :position
  validates :position, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 100}
  validates_uniqueness_of :refactored_name, :position
  
  def self.getPageCategoryMap
    map = {}
    cats = Category.all
    cats.each do |cat|
      map[cat.id] = OtherPage.where(:category_id => cat.id)
    end
    return map
  end
end
