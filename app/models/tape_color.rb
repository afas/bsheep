# encoding: utf-8
class TapeColor
  attr_accessor :name
  attr_accessor :cut
  attr_accessor :code

  def self.collection
    [
        TapeColor.new(:name => 'Бе-е-елый', :cut => '0', :code => "#FFFFFF"),
        TapeColor.new(:name => 'Желтый', :cut => '1', :code => "#FFE639")
    ]
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
    self.code = hash[:code]
  end

  def self.by_id(id)
    collection.each do |value|
      return value.code if value.cut.to_i == id
    end
    false
  end


end