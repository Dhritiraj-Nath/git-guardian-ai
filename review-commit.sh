#!/usr/bin/env bash
set -euo pipefail

# review-commit.sh

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <commit_ref>" >&2
  exit 1
fi

INPUT="$1"

# 1. AUTO-RESOLVE: Translate HEAD, tag, or short hash into full 40-char ID
# This allows you to run: ./review-commit.sh HEAD
if ! COMMIT=$(git rev-parse --verify "$INPUT" 2>/dev/null); then
  echo "Error: Commit '$INPUT' not found." >&2
  exit 1
fi

# Check for cline dependency
if ! command -v cline >/dev/null 2>&1; then
  echo "Error: 'cline' command not found. Please install it first." >&2
  exit 1
fi

# 2. SAFE EXECUTION: Uses GIT_PAGER=cat to prevent "unrecognized argument" errors
GIT_PAGER=cat git show --no-color "$COMMIT" | cline -y "Review this commit for:
1. Potential bugs
2. Security issues
3. Code quality improvements
4. Best practice violations
Provide specific, actionable feedback."
