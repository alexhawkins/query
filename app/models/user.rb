class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_votes, dependent: :destroy
  has_many :question_votes, dependent: :destroy
  def role?(base_role)
    role == base_role.to_s
  end
end
