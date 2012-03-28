#encoding:utf-8
class CreateStartData < ActiveRecord::Migration
  def up

    User.create(:email => "admin@black-sheep.ru",
                :password => "enlightenment",
                :role => 0)

    Welcome.create(
        :lang => "ru",
        :title => "Инновации в IT, облачные вычисления, создание мобильных и веб приложений, SMM - основные сферы развития и деятельности нашей команды.",
        :description => "Другими направлениями работ являются брендинг, дизайн, game Dev, Fuzzy Logic analysis system, PR, SEO, OutSourсe разработка, программы для газовой отрасли.",
        :phone => "+7 (495) 5-500-200",
        :email => "work@black-sheep.ru",
        :address => "Москва, ул. Большая Дорогомиловская д.14 офис 73",
        :user_id => 1
    )

    Welcome.create(
        :lang => "en",
        :title => "Black Sheep - Make the world a better",
        :description => "Evolution, progress, community, web development, ruby on rails, mobile platform development, Apple, Android, cloud computing, cloud storage, cloud services, media streaming, creative, branding, promotion, naming, SMM, seo optimization, viral marketing, viral video, peace love unity and respect community.",
        :phone => "+7 (495) 5-500-200",
        :email => "work@black-sheep.ru",
        :address => "Moscow, B. Dorogomilovskaya street, 14, office 75",
        :user_id => 1
    )

    TopLevel.create( :lang => "ru", :title => "Услуги", :user_id => 1, :short_url => "services" )
    TopLevel.create( :lang => "ru", :title => "Команда", :user_id => 1, :short_url => "team" )
    TopLevel.create( :lang => "ru", :title => "Клиенты", :user_id => 1, :short_url => "clients" )
    TopLevel.create( :lang => "ru", :title => "Блог", :user_id => 1, :short_url => "blog" )

    TopLevel.create( :lang => "en", :title => "Services", :user_id => 1, :short_url => "Services" )
    TopLevel.create( :lang => "en", :title => "Team", :user_id => 1, :short_url => "Team" )
    TopLevel.create( :lang => "en", :title => "Clients", :user_id => 1, :short_url => "Clients" )
    TopLevel.create( :lang => "en", :title => "Blog", :user_id => 1, :short_url => "Blog" )
  end

  def down
    User.delete_all
    Welcome.delete_all
    TopLevel.delete_all
  end
end
