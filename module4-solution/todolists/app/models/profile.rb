class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_and_last_name_not_null
  validate :male_first_name_not_sue
  validates :gender, :inclusion => %w(male female)

  def first_name_and_last_name_not_null
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "first_name or last_name can be null but not both")
    end
  end

  def male_first_name_not_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:first_name, "male with first_name Sue not allowed")
    end
  end

  def self.get_all_profiles min_year, max_year
    self.where("birth_year BETWEEN :min_year AND :max_year", min_year: min_year, max_year: max_year).order(:birth_year)
  end
end
