class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :company_name, :email
  has_many :notes

  def self.merge(winner, loser)
    winner.notes << loser.notes
    winner.email = loser.email if winner.email == nil || ""
    loser.delete
    winner
  end

  def duplicates?(person)
    if person == nil
      false
    else
      p1 = [self.email, self.first_name, self.last_name]
      p2 = [person.email, person.first_name, person.last_name]
      person == self || p1 == p2
    end
  end

end
