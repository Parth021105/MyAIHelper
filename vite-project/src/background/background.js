// background.js - Service worker that handles AI API calls via backend

console.log("AI Helper: Background service worker starting...");

chrome.runtime.onInstalled.addListener(() => {
  console.log("AI Helper Extension Installed!");
  // Set default backend URL
  chrome.storage.local.get(["backendUrl"], (result) => {
    if (!result.backendUrl) {
      chrome.storage.local.set({ backendUrl: "http://localhost:5000" }, () => {
        console.log("Default backend URL set to http://localhost:5000");
      });
    } else {
      console.log("Backend URL already configured:", result.backendUrl);
    }
  });
});

// Listen for messages from content script
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("Background: Received message:", request.action);
  
  if (request.action === "getAIAnswer") {
    console.log("Background: Processing AI request, text length:", request.text?.length);
    
    handleAIRequest(request.text)
      .then((answer) => {
        console.log("Background: Got answer from backend");
        sendResponse({ success: true, answer: answer });
      })
      .catch((error) => {
        console.error("Background: Error:", error);
        sendResponse({ success: false, error: error.message });
      });
    return true; // Keep message channel open for async response
  }
});

async function handleAIRequest(pageText) {
  console.log("Background: handleAIRequest called");
  
  // Get backend URL from storage
  const result = await chrome.storage.local.get(["backendUrl"]);
  const backendUrl = result.backendUrl || "http://localhost:5000";

  console.log("Background: Using backend URL:", backendUrl);

  try {
    console.log("Background: Sending request to backend...");
    
    const response = await fetch(`${backendUrl}/analyze`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        text: pageText,
        mode: "auto"
      })
    });

    console.log("Background: Backend response status:", response.status);

    if (!response.ok) {
      throw new Error(`Backend error: ${response.status} ${response.statusText}`);
    }

    const data = await response.json();
    console.log("Background: Backend response data:", data);

    if (data.success && data.answer) {
      return data.answer;
    } else {
      throw new Error(data.error || "Backend returned no answer");
    }
  } catch (error) {
    console.error("Background: API Error:", error);
    
    // Handle specific error types
    if (error.name === 'AbortError') {
      throw new Error("Request timed out. The page might be too large or backend is slow.");
    }
    
    if (error.message.includes("Failed to fetch")) {
      throw new Error("Cannot connect to backend. Make sure Python backend is running on " + backendUrl);
    }
    
    throw error;
  }
}
