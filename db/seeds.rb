puts 'Cleaning database...'
Review.destroy_all
Reservation.destroy_all
Restaurant.destroy_all
User.destroy_all

puts 'Creating users...'
user1 = User.create!(email: "email1@example.com", password: 'azerty')
user2 = User.create!(email: "email2@example.com", password: 'azerty')
user3 = User.create!(email: "email3@example.com", password: 'azerty')


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
    user:           user1
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
    user:           user1
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
    user:           user2
  })

puts 'Finished restuarant!'

puts 'Creating reviews...'
reviews_attributes = [
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '2',
    chef:                'true',
    reviewable:          resto_fr,
    sender:              user2
  },
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '4',
    chef:                'true',
    reviewable:          resto_fr,
    sender:              user3
  },
  {
    description:         'très bon restaurant avec une équipe sympas',
    stars:               '3',
    chef:                'true',
    reviewable:          resto_be,
    sender:              user1
  },
]
Review.create!(reviews_attributes)
puts 'Finished reviews!'

puts 'Creating reservations...'
reservations_attributes = [
{
    date: "2018-11-14",
    user_id: user1.id,
    restaurant_id: resto_fr.id
},
{
    date: "2018-11-12",
    user_id: user2.id,
    restaurant_id: resto_fr.id
},
{
    date: "2018-11-14",
    user_id: user3.id,
    restaurant_id: resto_ch.id
},
{
    date: "2018-11-11",
    user_id: user3.id,
    restaurant_id: resto_fr.id
},
{
    date: "2018-11-14",
    user_id: user2.id,
    restaurant_id: resto_fr.id
},
{
    date: "2018-11-14",
    user_id: user3.id,
    restaurant_id: resto_ch.id
}
]
Reservation.create!(reservations_attributes)
puts 'Finished reservations!'





