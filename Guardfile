# frozen_string_literal: true

guard :shell, all_on_start: true do
  watch(/^*\.rb/) do |m|
    # `osascript -e 'display notification "#{m[0]} File changed" with title "Testing again"' && rspec `

    `osascript -e 'display notification "#{m[0]} File changed" with title "Testing again"' && rubocop -A && rspec spec/`
  end
end
