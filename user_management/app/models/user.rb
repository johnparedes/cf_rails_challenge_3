class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :first_name, :last_name, presence: true

  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end

  def form_validation
    errors.add(:first_name, "First name missing.")
    errors.add(:last_name, "Last name missing.")
  end

end
