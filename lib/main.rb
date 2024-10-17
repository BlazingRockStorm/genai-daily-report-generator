# frozen_string_literal: true

require 'dotenv/load'
require 'gemini-ai'

# With an API key
client = Gemini.new(
  credentials: {
    service: 'generative-language-api',
    api_key: ENV['GOOGLE_GEMINI_TOKEN']
  },
  options: { model: 'gemini-pro', server_sent_events: true }
)

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

result = client.stream_generate_content({
  contents: { role: 'user', parts: { text: text_request } }
})

mail_template = result
              .map { |response| response.dig('candidates', 0, 'content', 'parts') }
              .map { |parts| parts.map { |part| part['text'] }.join }
              .join

puts mail_template
