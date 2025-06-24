module UserHelper
  def phone_no(user)
    number_to_phone(user.phone_no) if user.phone_no.present?
  end
end
