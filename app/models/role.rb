class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    actors = []
    self.auditions.each do |audition|
      actors << audition.actor
    end
    actors
  end

  def locations
    locations = []
    self.auditions.each do |audition|
      locations << audition.location
    end
    locations
  end

  def all_hired
    self.auditions.filter{|audition| audition.hired == true}
  end

  def lead
    self.all_hired.count > 0 ? self.all_hired.first : "no actor has been hired for this role"
  end
  
  def understudy
    self.all_hired.count > 1 ? self.all_hired.second : "no actor has been hired for understudy for this role"
  end
end