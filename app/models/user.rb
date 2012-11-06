class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :orders
  has_many :addresses, :dependent => :destroy

  def self.find_or_create_by_auth(auth_data)

    user = find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"],   :name => auth_data["info"]["name"])
    unless user.name == auth_data["info"]["name"]
      user.update_attributes(:name => auth_data["info"]["name"])
    end
    return user
  end
end
