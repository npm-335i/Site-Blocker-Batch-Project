A simple Windows batch script that allows users to block or unblock access to specific websites by editing the system's `hosts` file. Useful for staying focused, preventing distractions, or controlling access.

> ⚠️ Must be run as Administrator.

---

## 📦 Features

- 🔒 Block any domain (e.g., `facebook.com`)
- 🔓 Unblock previously blocked domains
- 🚀 Instantly applies changes using DNS flush
- 💡 Smart input (prevents using full URLs like `https://`)
- 🧠 Lightweight, no installation needed
---

## 💻 How It Works

The script redirects specified domains to `127.0.0.1` in the `hosts` file, making the website unreachable. Unblocking removes the entries.

---
