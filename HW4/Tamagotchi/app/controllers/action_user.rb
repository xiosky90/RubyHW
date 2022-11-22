# frozen_string_literal: true

# Handler action user from frontend
module ActionUser
  class << self
    def action_user(action, game_methods)
      action = action.delete_prefix('/')
      @game_methods = game_methods

      !action.empty? ? action_reducer(action) : (puts '▼ Empty action, please type anything from there ▼▼▼! ▼')
    end

    def action_reducer(action)
      action = action.to_sym

      action_helper(action) ? action : (puts "Unknown resourse or page --- #{action.upcase} ---! ▼")
    end

    def action_helper(action)
      @game_methods.detect { |method| method == action }
    end
  end
end
