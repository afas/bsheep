#encoding:utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :about, :role, :avatar

  has_attached_file :avatar,
                    :styles => {
                        :list => '233x233#'
                    },
                    :default_url => '/user/avatar/default.png',
                    :url => '/user/avatar/:id/:style_:basename.:extension'

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'], :message => I18n.t("paperclip.bad_file_format")

  def admin?
    return false if self.role.nil?

    if self.role == 0
      return true
    else
      return false
    end
  end

end
