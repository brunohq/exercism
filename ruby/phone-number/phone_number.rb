# frozen_string_literal: true

class PhoneNumber
  PHONE_PATTERN = /^\d{10}$/.freeze

  def self.clean(phone)
    phone.tr!('\(\)\-\. ', '')
    phone = strip_country_code(phone)
    valid?(phone) ? phone : nil
  end

  def self.strip_country_code(phone)
    if phone[0] == '+' && phone[1] == '1'
      phone = phone[2..-1]
    elsif phone[0] == '1'
      phone = phone[1..-1]
    end
    phone
  end

  def self.valid?(phone)
    valid_length?(phone) &&
      valid_area_code?(phone)
  end

  def self.valid_length?(phone)
    PHONE_PATTERN =~ phone
  end

  def self.valid_area_code?(phone)
    phone[0].to_i >= 2 && phone[3].to_i >= 2
  end
end
