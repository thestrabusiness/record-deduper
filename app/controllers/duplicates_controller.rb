class DuplicatesController < ApplicationController
  def create
    users = UserImporter.new(params[:file]).user_collection
    record_deduper = UserRecordDeduper.new(users)
    @duplicate_users = record_deduper.duplicate_records
    @non_duplicate_users = record_deduper.non_duplicate_records

    render 'duplicates_list'
  end
end
