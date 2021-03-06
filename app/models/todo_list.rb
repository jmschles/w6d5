class TodoList < ActiveRecord::Base
  attr_accessible :title, :item_ids, :items_attributes

  validates :title, :presence => true

  has_many :items,
  	:class_name => "TodoItem",
  	:foreign_key => "list_id",
  	:inverse_of => :list,
  	:dependent => :destroy

  def as_json (options = {})
  	super(options.merge({:include => :items}))
  end

  accepts_nested_attributes_for :items
end
