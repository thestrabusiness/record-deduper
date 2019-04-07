class UserRecordDeduper
  attr_reader :duplicate_records, :non_duplicate_records

  def initialize(unchecked_users)
    @non_duplicate_records, @duplicate_records = dedupe(unchecked_users)
  end

  private

  def dedupe(unchecked_users, non_duplicates = [], duplicates =[])
    if unchecked_users.length < 1
      return non_duplicates, duplicates
    elsif unchecked_users.length == 1
      non_duplicates << unchecked_users.pop
      return non_duplicates, duplicates
    else
      current_user = unchecked_users.delete_at(0)

      potential_duplicates = unchecked_users.select do |user|
        Text::Levenshtein.distance(user.email, current_user.email) <= 1 ||
          Text::Levenshtein.distance(user.last_name, current_user.last_name) <= 1 ||
          Text::Levenshtein.distance(user.first_name, current_user.first_name) <= 1
      end

      if potential_duplicates.present?
        duplicates << current_user
        duplicates << potential_duplicates
        unchecked_users -= potential_duplicates
        dedupe(unchecked_users, non_duplicates, duplicates.flatten)
      else
        non_duplicates << current_user
        dedupe(unchecked_users, non_duplicates, duplicates.flatten)
      end
    end
  end
end
