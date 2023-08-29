# il faut créer un user et associer le chien au user
User.destroy_all

p "Création d'un user "
user1 = User.new(username: "Chonchax", email: "test@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user1.save
  p "user créé"
else
  p "Soucis avec la création du user"
end


dog = Dog.new(name: "Rex", breed: "Berger Australien", age: 4,
              energy: 3, playfulness: 5, good_with_strangers: 5,
              good_with_others_dogs: 5, good_with_chidren: 4,
              size: "Grand", neutered: true, good_with_water: 3,
              shadow_level: 3, sexe: "Male", user_id: user1.id)
if dog.save
  p "Chien créé"
else
  p "Soucis avec la création du chien"
end
