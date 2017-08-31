FactoryGirl.define do
  factory :course do
    code "MA2115"
    department "Departamento de Matematicas Puras y Aplicadas"

    association(:term)
    association(:post)
  end
end
