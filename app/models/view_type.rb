# encoding: utf-8
class ViewType
  attr_accessor :name
  attr_accessor :cut
  attr_accessor :class_name

  def self.collection
    [
        ViewType.new(:name => 'none', :cut => 0, :class_name => ""),
        ViewType.new(:name => 'iPhone', :cut => 1, :class_name => "iphone"),
        ViewType.new(:name => 'iPad', :cut => 2, :class_name => "ipad"),
        ViewType.new(:name => 'Safari', :cut => 3, :class_name => "safari"),
        ViewType.new(:name => 'Mac Book Air', :cut => 4, :class_name => "air"),
        ViewType.new(:name => 'Mac', :cut => 5, :class_name => "mac"),
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
    self.class_name = hash[:class_name]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.class_name if value.cut == id
    end
    false
  end


end