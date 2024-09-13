# frozen_string_literal: true

# guard :shell, all_on_start: true do
#   watch(/^*\.js/) do |m|
#     `osascript -e 'display notification "#{m[0]} File changed" with title "Testing again Frontend"'` +
#       `npm run test`
#   end
# end

# BACKEND
guard :shell, all_on_start: true do
  watch(/^*\.rb/) do |m|
    `osascript -e 'display notification "#{m[0]} File changed" with title "Testing Backend"' ` +
      `rubocop -A` +
      `rspec spec/`
  end
end
