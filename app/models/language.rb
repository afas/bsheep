#encoding: utf-8
class Language
  attr_accessor :name
  attr_accessor :cut

  def self.collection(with_all_regions = false)
    list = [
        Language.new(:name => 'En', :cut => 'en'),
        Language.new(:name => 'Ru', :cut => 'ru')
    ]
    list = [Language.new(:name => 'All regions', :cut => '')] + list if with_all_regions
    list
  end

  def self.include?(lang_cut)
    collection.each do |lang|
      return true if lang.cut == lang_cut
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.cut = hash[:cut]
  end

end