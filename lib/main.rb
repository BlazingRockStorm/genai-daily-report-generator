# frozen_string_literal: true

require 'gen_ai'
require 'dotenv'

model = GenAI::Language.new(:gemini, ENV['GOOGLE_GEMINI_TOKEN'])

text_request = <<-TEXT
この日報フォーマットに情報を追加てください。

"A様

お疲れ様です。ホアンクアンです。

本日の業務内容を報告していたします。

業務内容：
  1. プロジェクト１
    - タスク１：
      進捗状況: %

課題

明日の予定
  1. プロジェクト１
    プロジェクト１の予定

以上、本日の報告とさせていただきます。"
TEXT

Dir.glob('./input/*.txt').each do |file_name|
  text_request += File.read(file_name)
end

model.chat(text_request)
