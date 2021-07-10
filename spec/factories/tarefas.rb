# spec/factories/items.rb
FactoryBot.define do
    factory :tarefa do
      nome { Faker::StarWars.character }
      concluida {false}
      grupo_id nil
    end
  end