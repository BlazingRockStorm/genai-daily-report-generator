# frozen_string_literal: true

require 'gen_ai'

model = GenAI::Language.new(:gemini, ENV['GOOGLE_GEMINI_TOKEN'])
model.chat("日報例文を書いてください")
