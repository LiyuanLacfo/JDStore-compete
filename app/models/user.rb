class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_product_relationships
  has_many :favorites, :through => :user_product_relationships, :source => :product
  has_many :reviews

  def favor!(product)
  	favorites.push(product)
  end

  def unfavor!(product)
  	favorites.delete(product)
  end

  def favorites_include?(product)
    favorites.include?(product)
  end
  
end
