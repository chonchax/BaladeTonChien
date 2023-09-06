require 'open-uri'
require 'json'
# il faut créer un user et associer le chien au user
Tindog.destroy_all
User.destroy_all
Walk.destroy_all
Message.destroy_all
Match.destroy_all

file1 = URI.open("https://img.freepik.com/free-photo/cute-sweet-puppy-australian-shepherd-pet-posing-isolated-white-wall_155003-36677.jpg?w=996&t=st=1693843042~exp=1693843642~hmac=b53178c2e84b47060efaeffb9a3389c35a4ae985fdd6b62ff3fe1d8ca6ca4615")
puts "image fonctionne"
file2 = URI.open("https://images.pexels.com/photos/2409503/pexels-photo-2409503.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
puts "image fonctionne"
file3 = URI.open("https://www.chien.fr/assets/img/000/107/og-image/teckel.jpg")
puts "image fonctionne"
file4 = URI.open("https://www.eleveurs-online.com/data/eleveur/140/1600-139061.253.jpg")
puts "image fonctionne"
file5 = URI.open("https://animalaxy.fr/wp-content/uploads/2018/02/iStock-1197663442-758x505.jpg")
puts "image fonctionne"
file6 = URI.open("https://global-uploads.webflow.com/62b2d13ccd148d1bccca591c/64b589b868c9cf057cbaec8f_Taille%20Dalmatien.jpg")
puts "image fonctionne"
file7 = URI.open("https://www.santevet.com/upload/admin/images/article/Chien%202/races_de_chiens/siberian-husky.jpg")
puts "image fonctionne"
file8 = URI.open("https://www.empruntemontoutou.com/wp-content/uploads/2020/02/LEONBERG.jpg")
puts "image fonctionne"

p "Création d'un user "
user1 = User.new(username: "Chonchax", email: "test@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user1.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog1 = Dog.new(name: "Rex", breed: "Berger Australien", age: 4,
              energy: 3, playfulness: 5, good_with_strangers: 5,
              good_with_others_dogs: 2, good_with_chidren: 4,
              size: "Grand", neutered: true, good_with_water: 3,
              shadow_level: 3, sexe: "Mâle", user_id: user1.id)
              dog1.photo.attach(io: file1, filename: "toto.jpg", content_type: "image/jpg")
if dog1.save
  p "Chien créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user2 = User.new(username: "AnneFlorette", email: "toto@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user2.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog2 = Dog.new(name: "Ostia", breed: "Golden retriever", age: 7,
              energy: 2, playfulness: 4, good_with_strangers: 4,
              good_with_others_dogs: 3, good_with_chidren: 1,
              size: "Grand", neutered: true, good_with_water: 5,
              shadow_level: 5, sexe: "Femelle", user_id: user2.id)
              dog2.photo.attach(io: file2, filename: "titi.jpg", content_type: "image/jpg")
if dog2.save
  p "Chien 2 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user3 = User.new(username: "Camelito", email: "caca@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user3.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog3 = Dog.new(name: "Buddy", breed: "Teckel", age: 2,
              energy: 5, playfulness: 5, good_with_strangers: 5,
              good_with_others_dogs: 5, good_with_chidren: 5,
              size: "Petit", neutered: true, good_with_water: 5,
              shadow_level: 3, sexe: "Femelle", user_id: user3.id)
              dog3.photo.attach(io: file3, filename: "tata.jpg", content_type: "image/jpg")
if dog3.save
  p "Chien 3 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user4 = User.new(username: "Alexandros", email: "alex@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user4.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog4 = Dog.new(name: "Ren", breed: "Berger Australien", age: 3,
              energy: 5, playfulness: 5, good_with_strangers: 5,
              good_with_others_dogs: 4, good_with_chidren: 5,
              size: "Moyen", neutered: true, good_with_water: 5,
              shadow_level: 3, sexe: "Mâle", user_id: user4.id)
              dog4.photo.attach(io: file4, filename: "tete.jpg", content_type: "image/jpg")
if dog4.save
  p "Chien 4 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user5 = User.new(username: "Yannos", email: "yannos@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user5.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog5 = Dog.new(name: "Zak", breed: "Berger des Shetland", age: 5,
              energy: 5, playfulness: 4, good_with_strangers: 5,
              good_with_others_dogs: 5, good_with_chidren: 5,
              size: "Grand", neutered: false, good_with_water: 3,
              shadow_level: 1, sexe: "Mâle", user_id: user5.id)
              dog5.photo.attach(io: file5, filename: "tyty.jpg", content_type: "image/jpg")
if dog5.save
  p "Chien 5 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user6 = User.new(username: "Youky", email: "Youky@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user6.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog6 = Dog.new(name: "Indra", breed: "Dalmatien", age: 1,
              energy: 5, playfulness: 4, good_with_strangers: 3,
              good_with_others_dogs: 2, good_with_chidren: 2,
              size: "Grand", neutered: false, good_with_water: 3,
              shadow_level: 5, sexe: "Femelle", user_id: user6.id)
              dog6.photo.attach(io: file6, filename: "tootoo.jpg", content_type: "image/jpg")
if dog6.save
  p "Chien 6 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user7 = User.new(username: "bgdu69", email: "bgdu69@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user7.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog7 = Dog.new(name: "Yuna", breed: "Husky", age: 7,
              energy: 5, playfulness: 5, good_with_strangers: 3,
              good_with_others_dogs: 1, good_with_chidren: 3,
              size: "Moyen", neutered: false, good_with_water: 3,
              shadow_level: 5, sexe: "Femelle", user_id: user7.id)
              dog7.photo.attach(io: file7, filename: "teetee.jpg", content_type: "image/jpg")
if dog7.save
  p "Chien 7 créé"
else
  p "Soucis avec la création du chien"
end

p "Création d'un user "
user8 = User.new(username: "anne-flower", email: "flowerpower@gmail.com", password: "azerty", address: "20 Rue des Capucins, Lyon")
if user8.save
  p "user créé"
else
  p "Soucis avec la création du user"
end

dog8 = Dog.new(name: "Pirouette", breed: "Leonberg", age: 1,
              energy: 2, playfulness: 5, good_with_strangers: 3,
              good_with_others_dogs: 1, good_with_chidren: 3,
              size: "Moyen", neutered: false, good_with_water: 3,
              shadow_level: 5, sexe: "Femelle", user_id: user8.id)
              dog8.photo.attach(io: file8, filename: "taataa.jpg", content_type: "image/jpg")
if dog8.save
  p "Chien 8 créé"
else
  p "Soucis avec la création du chien"
end

url = "https://data.grandlyon.com/geoserver/metropole-de-lyon/ows?SERVICE=WFS&VERSION=2.0.0&request=GetFeature&typename=metropole-de-lyon:evg_esp_veg.envpdiprboucle&outputFormat=application/json&SRSNAME=EPSG:4171&startIndex=0&sortBy=gid&count=100"

puts "Je choppe la balade"
file = URI.open(url)
walks = JSON.parse(file.read)
walks['features'].each do |walk|
  Walk.create(
    city: walk['properties']['commune_depart'],
    title: walk['properties']['nom'],
    distance: walk['properties']['longueur'],
    difficulty: walk['properties']['difficulte'],
    duration: walk['properties']['temps_parcours'].to_i,
    description: walk['properties']['descriptif'],
    start_address_longitude: walk['properties']['xdepart'],
    start_address_latitude: walk['properties']['ydepart'],
    geometry: walk['geometry']
  )
end
puts "jai fini de chopper, je fix les bugs"
bug_one = Walk.where(title: "Jeu de Regards sur Méginand")
Walk.destroy(bug_one.ids)
bug_two = Walk.where(title: "Petit sentier du Bois du Fort")
Walk.destroy(bug_two.ids)
bug_three = Walk.where(title: "Champ Blanc")
Walk.destroy(bug_three.ids)

puts "bug destroy"

geojsons_file_names = Dir.children("db/geojson")
geojsons_file_names.each do |geojson_file_name|
  file = File.read("db/geojson/#{geojson_file_name}")
  json = JSON.parse(file)
  Walk.create(
    city: json['features'].last['properties']['city'],
    title: json['features'].last['properties']['title'],
    distance: json['features'].last['properties']['distance'],
    difficulty: json['features'].last['properties']['difficulty'],
    duration: json['features'].last['properties']['duration'].to_i,
    description: json['features'].last['properties']['description'],
    start_address_longitude: json['features'].last['properties']['start_address_longitude'],
    start_address_latitude: json['features'].last['properties']['start_address_latitude'],
    geometry: json['features'].last['geometry']
  )
end

puts "balades dans lyon OK"
