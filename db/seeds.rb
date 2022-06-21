# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([{name: 'Cookie'}, {name: 'Cupcake'}])
Product.create([{
                  name: 'Veal - Ground',
                  description: 'Athscl autologous vein bypass graft(s) of the extremities',
                  price: 80.04,
                  active: true,
                  category_id: 1
                }, {
                  name: 'Chinese Foods - Pepper Beef',
                  description: 'Barton\'s fracture of r radius, init for opn fx type 3A/B/C',
                  price: 142.79,
                  active: true,
                  category_id: 1
                }, {
                  name: 'Foam Tray S2',
                  description: 'Contusion of scalp, sequela',
                  price: 186.66,
                  active: true,
                  category_id: 2
                }, {
                  name: 'Beer - Rickards Red',
                  description: 'Poisoning by unsp topical agent, undetermined, init encntr',
                  price: 76.2,
                  active: true,
                  category_id: 3
                }, {
                  name: 'Spice - Pepper Portions',
                  description: 'Military operations involving unsp dest arcrft, civilian',
                  price: 109.16,
                  active: true,
                  category_id: 3
                }, {
                  name: 'Veal - Eye Of Round',
                  description: 'Cont preg aft elctv fetl rdct of 1 fts or more,1st tri, fts3',
                  price: 78.32,
                  active: true,
                  category_id: 3
                }, {
                  name: 'Veal - Bones',
                  description: 'Single liveborn infant, born in hospital',
                  price: 114.09,
                  active: true,
                  category_id: 2
                }, {
                  name: 'Cheese - Provolone',
                  description: 'Contact with sharp glass, subsequent encounter',
                  price: 168.59,
                  active: true,
                  category_id: 2
                }, {
                  name: 'Wine - Magnotta - Pinot Gris Sr',
                  description: 'Opioid dependence, uncomplicated',
                  price: 76.55,
                  active: true,
                  category_id: 1
                }, {
                  name: 'Chicken - Soup Base',
                  description: 'Ascariasis',
                  price: 84.38,
                  active: true,
                  category_id: 1
                }])
