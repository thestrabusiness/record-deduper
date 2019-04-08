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

      potential_duplicates = unchecked_users.select { |user| DuplicateCheck.perform(user, current_user) }

      if potential_duplicates.present?
        potential_duplicates << current_user
        duplicates << potential_duplicates
        unchecked_users -= potential_duplicates
      else
        non_duplicates << current_user
      end

      dedupe(unchecked_users, non_duplicates, duplicates)
    end
  end
end
