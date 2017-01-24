namespace :utils do
  desc "Task para popular o banco de produtos."
  task popular_produto: :environment do

  puts "Criando produtos AAA..."
  20.times do
    Product.create!(
        name: Faker::Ancient.god,
        version: Faker::Number.decimal(2),
        link: Faker::Internet.url,
        category: "AAA"
      )
  end
  puts "Criando produtos AAA...(OK)"

  puts "Criando produtos DEMO..."
  20.times do
    Product.create!(
        name: Faker::Ancient.god,
        version: Faker::Number.decimal(2),
        link: Faker::Internet.url,
        category: "DEMO"
      )
  end
  puts "Criando produtos DEMO...(OK)"

  puts "Criando produtos BBB..."
  20.times do
    Product.create!(
        name: Faker::Ancient.god,
        version: Faker::Number.decimal(2),
        link: Faker::Internet.url,
        category: "BBB"
      )
  end
  puts "Criando produtos BBB...(OK)"

  puts "Criando produtos CCC..."
  20.times do
    Product.create!(
        name: Faker::Ancient.god,
        version: Faker::Number.decimal(2),
        link: Faker::Internet.url,
        category: "CCC"
      )
  end
  puts "Criando produtos CCC...(OK)"

  puts "Criando produtos ZZZ..."
  40.times do
    Product.create!(
        name: Faker::Ancient.god,
        version: Faker::Number.decimal(2),
        link: Faker::Internet.url,
        category: "ZZZ"
      )
  end
  puts "Criando produtos ZZZ...(OK)"

  end

  desc "Task para popular o banco de administradores."
  task popular_admin: :environment do

  puts "Cadastrando o ADMINISTRADOR FAKES..."
  10.times do
    Admin.create!(
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0, 1].sample
                  )
  end
  puts "Cadastrando o ADMINISTRADOR FAKES... (OK)"

  end

end
