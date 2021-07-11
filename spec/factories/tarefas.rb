# spec/factories/items.rb
FactoryBot.define do
    factory :tarefa do
      nome { Faker::Movies::StarWars.character }
      concluido {false}
    end
  end