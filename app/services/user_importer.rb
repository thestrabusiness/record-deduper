class UserImporter
  require 'csv'

  attr_reader :user_collection

  def initialize(csv)
    @user_collection = []

    CSV.foreach(csv.path, headers: true, header_converters: :symbol) do |row|
      @user_collection << User.new(row.to_h)
    end
  end
end
