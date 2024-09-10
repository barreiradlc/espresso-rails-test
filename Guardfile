# frozen_string_literal: true

guard :shell, all_on_start: true do
  watch(/^*\.rb/) do
    `say testing over again && rubocop -A && rspec spec/`
  end
end
