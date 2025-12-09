# Commit Sentry 🛡️: AI-Powered Code Auditor

**An essential terminal tool that uses Gemini to audit Git commits for bugs and security flaws *before* they are pushed.**

## 🌟 Project Origin
This tool was engineered during the **WeMakeDevs AI Agents Hackathon** to demonstrate practical application of Large Language Models (LLMs) in a crucial DevOps automation task: enforcing a secure development lifecycle (SDLC).

## 🚀 Features at a Glance
* **Instant Analysis:** Audits code changes in under 5 seconds.
* **Security Focused:** Specifically scans for common vulnerabilities, exposed secrets, and logic flaws.
* **Zero-Config Input:** Automatically finds and processes the latest commit (`HEAD`).
* **High Efficiency:** Utilizes the fast, low-cost Gemini 1.5/2.0 Flash model for rapid feedback.

---

## ⚙️ Installation & Setup (3 Steps)

### Prerequisites
You need the following installed:
1.  **Git** (for version control)
2.  **Node.js 20+** (required by Cline)

### 1. Install Cline CLI
Clone the repository and install the required tool globally:

```bash
git clone https://github.com/Dhritiraj-Nath/samplerepo.git
cd samplerepo
npm install -g @cline/cli
```

### 2. Configure Gemini Key
Run the tool once to set up your API key:
```bash
./review-commit.sh HEAD
```
*(Follow the prompts to configure **Google Gemini** and set the Model ID to **`gemini-1.5-flash`**)*

### 3. Usage
Run the auditor on your most recent commit:
```bash
./review-commit.sh HEAD
```

---

## 🛠️ How I Built It: The Architecture

This project is a great example of **DevOps Integration Engineering**. The value lies in the seamless pipeline that connects specialized tools:

1.  **Code Extraction (Bash & Git Plumbing):** The script first uses the robust Bash language and `git rev-parse` to cleanly extract the ID for `HEAD`. It then uses `git show` to get the raw code changes.
2.  **Data Cleansing:** The command `GIT_PAGER=cat` is used to ensure the raw Git output is stripped of any formatting codes (like ANSI colors) that could confuse the AI.
3.  **AI Integration & Analysis:** The cleaned code is piped (`|`) directly into the **Cline CLI**. Cline acts as the secure, persistent bridge to the **Google Gemini API**, feeding the code to the `gemini-1.5-flash` model for analysis.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
