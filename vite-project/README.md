# 🤖 AI Quiz Helper - Chrome Extension

Get instant AI-powered answers from any webpage! Perfect for quizzes, tests, research, or quick summaries.

## ✨ Features

- 🎯 **Floating Button**: A beautiful floating button appears on every webpage
- 🤖 **AI-Powered**: Uses Google's Gemini AI for intelligent answers
- ⚡ **Instant Results**: Get answers without leaving the page
- 🔒 **Privacy First**: Your API key stays local, never shared
- 🎨 **Beautiful UI**: Clean, modern interface with smooth animations

## 📦 Installation

### Step 1: Prepare the Extension

1. Download or clone this project
2. Navigate to the `public` folder in your terminal:
   ```powershell
   cd C:\projects\cheat\vite-project\public
   ```

3. Copy the required JavaScript files:
   ```powershell
   Copy-Item ..\src\content\content.js .
   Copy-Item ..\src\background\background.js .
   ```

4. **Create Icon Files** (temporary placeholder method):
   - Go to [favicon.io](https://favicon.io/favicon-generator/)
   - Generate icons with the 🤖 emoji or any design you like
   - Download and rename them as `icon16.png`, `icon48.png`, `icon128.png`
   - Place them in the `public` folder
   
   **OR** use any 3 PNG images of sizes 16x16, 48x48, and 128x128 pixels

### Step 2: Load Extension in Chrome

1. Open Chrome and go to `chrome://extensions/`
2. Enable **"Developer mode"** (toggle in top-right corner)
3. Click **"Load unpacked"**
4. Select the `public` folder: `C:\projects\cheat\vite-project\public`
5. The extension should now appear in your extensions list! 🎉

### Step 3: Get Your FREE API Key

1. Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Sign in with your Google account
3. Click **"Get API Key"** or **"Create API Key"**
4. Copy the API key

### Step 4: Configure the Extension

1. Click the extension icon in Chrome toolbar (puzzle piece icon → AI Quiz Helper)
2. Paste your API key in the input field
3. Click **"Save API Key"**
4. You're all set! ✅

## 🚀 Usage

1. **Visit any webpage** with text, questions, or content
2. **Click the floating "🤖 AI" button** (bottom-right corner)
3. **Wait a moment** while the AI analyzes the page
4. **Read the answer** in the beautiful overlay that appears!

### Perfect For:

- 📝 Online quizzes and tests
- 📚 Research and reading comprehension
- 🔍 Quick summaries of long articles
- 💡 Understanding complex topics
- ❓ Getting explanations for difficult questions

## 🛠️ How It Works

1. **Content Script** (`content.js`) injects a floating button on every page
2. When clicked, it **extracts all text** from the webpage
3. The text is sent to the **Background Service Worker** (`background.js`)
4. The background worker **calls Google Gemini API** with your key
5. The AI response is displayed in a **beautiful overlay** on the page

## 📁 File Structure

```
public/
├── manifest.json       # Extension configuration
├── popup.html          # Settings popup UI
├── popup.js           # Settings popup logic
├── content.js         # Injected into webpages (extracts text, shows UI)
├── background.js      # Background worker (handles API calls)
├── icon16.png         # Extension icon (16x16)
├── icon48.png         # Extension icon (48x48)
└── icon128.png        # Extension icon (128x128)
```

## 🔧 Development

### Making Changes

If you modify any files:
1. Go to `chrome://extensions/`
2. Click the **refresh icon** on your extension
3. Reload any webpage to see changes

### Copy Files from src to public

```powershell
cd C:\projects\cheat\vite-project
Copy-Item src\content\content.js public\
Copy-Item src\background\background.js public\
```

## ⚠️ Important Notes

- **API Key Security**: Your API key is stored locally in Chrome's storage and is never transmitted anywhere except to Google's API
- **Free Tier**: Google Gemini has a generous free tier, but be mindful of usage limits
- **Page Compatibility**: Works on most websites; some sites with special restrictions may limit text extraction
- **Rate Limits**: If you get errors, you might be hitting API rate limits - wait a moment and try again

## 🐛 Troubleshooting

### "API key not configured" error
- Click the extension icon and make sure you've entered and saved your API key

### Button doesn't appear
- Check if the extension is enabled in `chrome://extensions/`
- Try refreshing the webpage
- Check browser console for errors (F12)

### "Could not extract text" error
- Some websites have copy protection or minimal text content
- Try on a different page with more readable text

### API errors
- Verify your API key is correct
- Check your Google AI Studio quota/limits
- Ensure you have internet connection

## 📝 License

Free to use and modify for personal or educational purposes.

## 🤝 Contributing

Feel free to improve this extension! Some ideas:
- Better icon designs
- Support for more AI providers
- Custom prompts/modes
- Save favorite answers
- Keyboard shortcuts

---

**Happy quizzing! 🎓✨**
