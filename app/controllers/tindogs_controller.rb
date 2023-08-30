class TindogsController < ApplicationController

  def show
    dogs_id = Dog.all.to_a.map{|dog|dog.id if dog.id != current_user.dog.id}
    @dog = Dog.find(dogs_id.sample)
    # a gerer par la suite : enlever l'id du chien que t'as deja swipé 
  end
end
