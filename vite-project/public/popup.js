// popup.js - Handles the settings popup

const backendUrlInput = document.getElementById("backendUrl");
const saveBtn = document.getElementById("saveBtn");
const statusDiv = document.getElementById("status");

// Load saved backend URL on popup open
chrome.storage.local.get(["backendUrl"], (result) => {
  if (result.backendUrl) {
    backendUrlInput.value = result.backendUrl;
    showStatus("Backend URL configured ✓", "success");
  }
});

// Save backend URL
saveBtn.addEventListener("click", () => {
  const backendUrl = backendUrlInput.value.trim();

  if (!backendUrl) {
    showStatus("Please enter backend URL", "error");
    return;
  }

  // Basic validation
  if (!backendUrl.startsWith("http")) {
    showStatus("URL must start with http:// or https://", "error");
    return;
  }

  chrome.storage.local.set({ backendUrl: backendUrl }, () => {
    showStatus("Settings saved! Make sure backend is running ✓", "success");
    
    // Clear the status after 3 seconds
    setTimeout(() => {
      hideStatus();
    }, 3000);
  });
});

// Handle Enter key in input
backendUrlInput.addEventListener("keypress", (e) => {
  if (e.key === "Enter") {
    saveBtn.click();
  }
});

function showStatus(message, type) {
  statusDiv.textContent = message;
  statusDiv.className = `status ${type}`;
  statusDiv.style.display = "block";
}

function hideStatus() {
  statusDiv.style.display = "none";
}