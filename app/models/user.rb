class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< Updated upstream
<<<<<<< Updated upstream
end
=======
end
>>>>>>> Stashed changes
=======
end
>>>>>>> Stashed changes
