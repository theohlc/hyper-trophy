class User < ApplicationRecord
  has_many :workouts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    password = Devise.friendly_token
    create_with(password: password, uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def exercises
    exercises = []

    self.workouts.each do |workout|
        workout.exercises.each do |exercise|
          exercises << exercise
        end
    end
    exercises.uniq
  end

  def self.most_workouts
    users = User.all 
    user_with_most = users.first
    users.each do |user|
      if user.workouts.count > user_with_most.workouts.count
        user_with_most = user
      end
    end
    user_with_most
  end

end
