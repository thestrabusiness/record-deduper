class User
  attr_reader :first_name, :last_name, :company, :email, :address1, :address2,
              :zip, :city, :state_long, :state, :phone

  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @company = args[:company]
    @email = args[:email]
    @address1 = args[:address1]
    @address2 = args[:address2]
    @zip = args[:zip]
    @city = args[:city]
    @state_long = args[:state_long]
    @state = args[:state]
    @phone = args[:phone]
  end

  def address
    "#{address1} #{address2}".strip
  end

  def details_summary
    [full_name, email, full_address].join(' ')
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_address
    "#{address}, #{city} #{state}, #{zip}"
  end
end
