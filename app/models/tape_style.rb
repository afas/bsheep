# encoding: utf-8
class TapeStyle
  attr_accessor :name
  attr_accessor :cut
  attr_accessor :class

  def self.collection
    [
        TapeStyle.new(:name => 'Бе-е-елый', :cut => '0', :class => ""),
        TapeStyle.new(:name => 'Желтый', :cut => '1', :class => "special")
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
    self.class = hash[:class]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.class if value.cut.to_i == id
    end
    false
  end


end