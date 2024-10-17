# GenAI Daily Report Generator
================

## Overview
This project utilizes the Gemini AI API to generate content based on a given prompt. The API request is made using the `gemini-ai` Ruby gem, and the response is processed to extract the generated content.

## Requirements
- Ruby installed on your system
- `gemini-ai` gem installed (version ~> 4.2.0)
- `dotenv` gem installed
- A Google Gemini Token set as an environment variable (`GOOGLE_GEMINI_TOKEN`)
## Usage
1. Clone the repository and navigate to the project directory.
2. Install the required gems by running `bundle install`.
3. Set your Google Gemini Token as an environment variable. You can do this by creating a `.env` file in the project root with the following content:
```
GOOGLE_GEMINI_TOKEN=your_token_here
```

Replace `your_token_here` with your actual token.
4. Put the files you want to use as input in the `/input` folder.
5. Run the project using the run.sh script:

```bash
sh run.sh
```
This will execute the `lib/main.rb` script and save the generated content to `result/out.txt`.

## Notes

- The project uses the `gemini-pro` model for content generation.
- The API request is made with the `server_sent_events` option set to `true`.
- The generated content is extracted from the API response and saved to a file.
