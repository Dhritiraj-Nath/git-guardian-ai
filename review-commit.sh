#!/usr/bin/env bash
set -euo pipefail

# review-commit.sh

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <commit>" >&2
  exit 1
fi

COMMIT="$1"

# Verify commit exists to avoid cryptic git error in pipe
if ! git cat-file -e "$COMMIT^{commit}" 2>/dev/null; then
  echo "Error: Commit '$COMMIT' not found." >&2
  exit 1
fi

git show --no-color "$COMMIT" | cline -y "Review this commit for:
1. Potential bugs
2. Security issues
3. Code quality improvements
4. Best practice violations
Provide specific, actionable feedback."