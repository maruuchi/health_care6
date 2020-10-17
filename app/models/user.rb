class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

                    # destroy時に関連づけられたモデルに対してdestroyが実行される
  has_many :graphs, dependent: :destroy
end
