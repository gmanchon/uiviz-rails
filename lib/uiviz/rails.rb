# frozen_string_literal: true

require 'uiviz/rails/version'

require 'rouge'

module Uiviz
  module Rails
    class Error < StandardError; end

    # hello
    class UivizBuilder
      def initialize
        @formatter = Rouge::Formatters::HTML.new
        @erb_lexer = Rouge::Lexers::ERB.new
        @html_lexer = Rouge::Lexers::HTML.new
      end

      def build
        Dir.glob('*')

        # <% css = Rouge::Themes::Github.render(scope: '.highlight') %>
        # <style><%= css.html_safe %></style>

        # html = ActionController::Base.new().render_to_string partial: "shared/cards",
        # locals: {
        #   card_background: 'activite.jpg',
        #   card_title: 'Title here',
        #   card_description: 'Description here!',
        #   card_price: '20€'
        #   }
      end

      TEST_ERB = <<~ERB
        <%= render "shared/accordion",
              data: [{
                title: 'math',
                sub: [{
                    item: 'math',
                    ref: '#'
                  },{
                    item: 'calculus',
                    ref: '#'
                  },{
                    item: 'algebra',
                    ref: '#'
                  },{
                    item: 'statistics',
                    ref: '#'
                  }]
              },{
                title: 'ruby',
                sub: [{
                    item: 'ruby',
                    ref: '#'
                  },{
                    item: 'bundler',
                    ref: '#'
                  },{
                    item: 'rubygems',
                    ref: '#'
                  },{
                    item: 'rake',
                    ref: '#'
                  }]
              }] %
      ERB

      def render
        erb = TEST_ERB.strip << '>'

        raw_html = ActionController::Base.new.render_to_string inline: erb

        red_erb = @formatter.format(@erb_lexer.lex(erb))
        red_html = @formatter.format(@html_lexer.lex(raw_html))

        {
          html: raw_html,
          colorized_erb: red_erb,
          colorized_html: red_html
        }
      end
    end
  end
end
