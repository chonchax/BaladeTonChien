class TindogsController < ApplicationController

  def index
    if dogs_to_swipe.empty?
      redirect_to no_swipe_path
    else
      @dog = Dog.find(dogs_to_swipe.sample)
      @tindog = Tindog.new
    end
  end

  def create
    @tindog = Tindog.new(tindog_params)
    @tindog.sender_id = current_user.dog.id
    @tindog.save
    if match(@tindog)
      # rediriger vers chatroom
      @match = Match.create
      @message = Message.create(user: current_user, content: "", match: @match)
      @message = Message.create(user: Dog.find(@tindog.receiver_id).user, content: "", match: @match)
      redirect_to tindogs_path
    else
      redirect_to tindogs_path
    end
  end

  def noswipe
  end

  def match(tindog)
    Tindog.where(
      receiver_id: current_user.dog.id,
      sender_id: tindog.receiver_id
    ).empty?
  end

  def dogs_to_swipe
    # récupère tout les ids de chiens
    dogs_id = Dog.all.to_a.map(&:id)
    # supprime l'id de ton chien
    dogs_id.delete(current_user.dog.id)
    # supprime l'id de tout les chiens que t'as déjà swipé (pending et match)
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
