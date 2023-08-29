class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dog_params
    params.require(:dog).permit(
      :name, :breed, :age, :energy, :playfulness, :good_with_strangers,
      :good_with_others_dogs, :good_with_chidren, :size, :neutered,
      :good_with_water, :shadow_level, :sexe, :photo
    )
  end
end
