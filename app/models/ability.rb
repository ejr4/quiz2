class Ability
  include CanCan::Ability

  def initialize(user) 
      user ||= User.new # guest user (not logged in)
    

      can(:manage, Idea) do |idea|
        user == idea.user
      end
      can(:manage, Review) do |review|
        user == review.user 
      end   
  end
end
