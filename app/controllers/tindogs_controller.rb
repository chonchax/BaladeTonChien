class TindogsController < ApplicationController
  @swiped_no = []

  def index
    @dogs = Dog.where.not(id: current_user.dog.id)
    if dogs_to_swipe.empty?
      redirect_to no_swipe_path
    else
      @dog = Dog.find(dogs_to_swipe.sample)
      @tindog = Tindog.new
    end
  end

  def next
    # Dog.find(tindog_params)
    # @swiped_no << @dog_id
  end

  def create
    @tindog = Tindog.new(tindog_params)
    @tindog.sender_id = current_user.dog.id
    @tindog.save
    if match(@tindog)
      # rediriger vers chatroom
      @tindog.status = "match"
      redirect_to tindogs_path
    end
  end

  def noswipe
  end

  def match(tindog)
    Tindog.where(
      receiver_id: current_user.dog.id,
      sender_id: tindog.receiver_id
    ).any?
  end

  def dogs_to_swipe
    # récupère tout les ids de chiens
    dogs_id = Dog.all.to_a.map(&:id)
    # supprime l'id de ton chien
    dogs_id.delete(current_user.dog.id)
    # supprime l'id de tout les chiens que t'as déjà swipé positif (pending et match)
    Tindog.all.each do |tindog|
      dogs_id.delete(tindog.receiver_id) if tindog.sender_id == current_user.dog.id
    end

    return dogs_id
  end

  private

  def tindog_params
    params.require(:tindog).permit(:receiver_id)
  end
end
