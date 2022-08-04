# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cats = [
    {
        name: 'Simba',
        age: 30,
        enjoys: 'being the King',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShK8um0bB5-P_fyTAzeJ38K05slk_-woI0Zg&usqp=CAU'
        
    },
    {
        name: 'Nala',
        age: 29,
        enjoys: 'sneaking up on her friends',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlkYRK8lvGz8UJ3dUadsZAjaPkUbjsNXih7g&usqp=CAU'
    },
    {
        name: 'Rafiki',
        age: 45,
        enjoys: 'predicting the future ',
        image: 'https://images.unsplash.com/photo-1618661057302-8b01d93bd898?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1162&q=80'
    }
]

cats.each do |attributes|
    Cat.create attributes
    puts "Created #{attributes}"
end