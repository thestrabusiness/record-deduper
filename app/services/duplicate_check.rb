class DuplicateCheck
  attr_reader :user1, :user2

  def initialize(user1, user2)
    @user1 = user1
    @user2 = user2
  end

  def self.perform(user1, user2)
    new(user1, user2).perform
  end

  def perform
    any_levenshtein_distance_matches? && user_name_metaphones_match?
  end

  private

  def any_levenshtein_distance_matches?
    Text::Levenshtein.distance(user1.email, user2.email) <= 1 ||
      Text::Levenshtein.distance(user1.last_name, user2.last_name) <= 1 ||
      Text::Levenshtein.distance(user1.first_name, user2.first_name) <= 1
  end

  def user_name_metaphones_match?
    Text::Metaphone.metaphone(user1.full_name) == Text::Metaphone.metaphone(user2.full_name)
  end
end
