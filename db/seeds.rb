puts 'Cleaning database...'
Review.destroy_all
Reservation.destroy_all
Restaurant.destroy_all
User.destroy_all

puts 'Creating users...'
description_user1 = "Bénéficiant de plus de sept ans d'expérience professionnelle en restauration collective puis en restauration hôtelière, je recherche aujourd'hui une nouvelle mission me permettant de mettre à profit mon sens créatif et mes connaissances en cuisine gastronomique."
description_user2 = "Titulaire du BTS Hôtellerie-restauration, j'ai pu mettre oeuvre mes acquis techniques et ma polyvalence à travers divers emplois dans la restauration. Actuellement chef adjoint dans la brigade du Chef **** du restaurant *****, je suis convaincu d'avoir développer l'ensemble des compétences requises pour prendre en charge les responsabilités liées au fonction de chef de cuisine."
description_user3 = "Ce mois ci, on cuisine les courges en version sucrée et salée. Avez-vous entendu parler de la lactofermentation ? Notre article vous explique ses bienfaits et comment préparer des aliments lactofermentés.
Nous vous souhaitons de bonnes dégustations."
user1 = User.create!(email: "email1@example.com", password: 'azerty', phone_number: "+336666262", description: description_user1, firstname: "Jean-Valjean", lastname: "Misérables")
user2 = User.create!(email: "email2@example.com", password: 'azerty', phone_number: "+336676262", description: description_user2, firstname: "toto", lastname: "tata")
user3 = User.create!(email: "email3@example.com", password: 'azerty', phone_number: "+3365676262", description: description_user3, firstname: "titi", lastname: "tutu")

puts 'Creating restaurants...'
resto_fr = Restaurant.create!(
  {
    name:           'le français',
    capicity:       '3',
    category:       'french',
    address:        '51 rue genri gorjus',
    longitude:      '4.850000',
    latitude:       '45.750000',
    priceperday:    '45',
    monday:         'true',
    tuesday:        'true',
    wednesday:      'false',
    thursday:       'false',
    friday:         'false',
    saturday:       'false',
    sunday:         'false',
    user:            user1
  })

resto_be = Restaurant.create!(
  {
    name:           'le chinois',
    capicity:       '5',
    category:       'chinois',
    address:        '54 rue genri gorjus',
    longitude:      '4.850000',
    latitude:       '45.750000',
    priceperday:    '46',
    monday:         'true',
    tuesday:        'true',
    wednesday:      'false',
    thursday:       'false',
    friday:         'true',
    saturday:       'false',
    sunday:         'false',
    user:            user1
  })

resto_ch = Restaurant.create!(
  {
    name:           'le belge',
    capicity:       '4',
    category:       'french',
    address:        '52 rue de belgique',
    longitude:      '4.850000',
    latitude:       '45.750000',
    priceperday:    '45',
    monday:         'true',
    tuesday:        'true',
    wednesday:      'true',
    thursday:       'false',
    friday:         'false',
    saturday:       'false',
    sunday:         'false',
    user:            user2
  })

puts 'Finished restuarant!'

puts 'Creating reviews...'
reviews_attributes = [
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '2',
    writter:             user1,
    restaurant:          resto_fr
  },
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '4',
    writter:             user2,
    restaurant:          resto_ch
  },
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '3',
    writter:             user3,
    restaurant:          resto_fr
  },
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '3',
    writter:             user3,
    restaurant:          resto_be
  }
]
Review.create!(reviews_attributes)
puts 'Finished reviews!'

puts 'Creating reservations...'
reservations_attributes = [
{
    date: "2018-11-14",
    chef: user1,
    restaurant: resto_fr
},
{
    date: "2018-11-12",
    chef: user2,
    restaurant: resto_fr
},
{
    date: "2018-11-14",
    chef: user3,
    restaurant: resto_ch
},
{
    date: "2018-11-11",
    chef: user3,
    restaurant: resto_fr
},
{
    date: "2018-11-14",
    chef: user2,
    restaurant: resto_fr
},
{
    date: "2018-11-14",
    chef: user3,
    restaurant: resto_ch
}
]
Reservation.create!(reservations_attributes)
puts 'Finished reservations!'





