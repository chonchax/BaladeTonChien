class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.save
  end

  private 

  def dog_params
  params.require(:dog).permit(:name,:breed,:age,:energy,:playfulness,:good_with_strangers,:good_with_others_dogs:good_with_chidren,:size,:neutered,:good_with_water,:shadow_level,:sexe)
  end
  
end
