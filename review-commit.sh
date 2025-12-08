#!/usr/bin/env bash
set -euo pipefail

# review-commit.sh

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <commit>" >&2
  exit 1
fi

COMMIT="$1"

# Validate commit hash format
if ! [[ "$COMMIT" =~ ^[0-9a-f]{40}$ ]]; then
  echo "Error: Invalid commit hash format. Must be a 40-character hexadecimal string." >&2
  exit 1
fi

# Check for cline dependency
if ! command -v cline >/dev/null 2>&1; then
  echo "Error: 'cline' command not found. Please install it first." >&2
  exit 1
fi

# Verify commit exists to avoid cryptic git error in pipe
if ! git cat-file -e "$COMMIT^{commit}" 2>/dev/null; then
  echo "Error: Commit '$COMMIT' not found." >&2
  exit 1
fi

git show --no-color --no-pager "$COMMIT" | cline -y "Review this commit for:
1. Potential bugs
2. Security issues
3. Code quality improvements
4. Best practice violations
Provide specific, actionable feedback."