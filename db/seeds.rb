# frozen_string_literal: true

FactoryBot.create(
  :user,
  role: :admin,
  name: 'My Admin',
  email: 'admin@admin.com',
  password: 'admin-password',
  password_confirmation: 'admin-password'
)

FactoryBot.create(
  :user,
  role: :employee,
  email: 'employee@admin.com',
  name: 'My Employee',
  password: 'empoyee-password',
  password_confirmation: 'empoyee-password'
)

4.times do
  FactoryBot.create(
    :user,
    role: :employee
  )
end
