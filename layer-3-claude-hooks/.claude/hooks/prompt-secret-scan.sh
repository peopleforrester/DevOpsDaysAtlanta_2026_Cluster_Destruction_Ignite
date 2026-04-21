#!/usr/bin/env bash
# ABOUTME: Layer 3 UserPromptSubmit hook - scan the user's prompt for accidentally-pasted secrets.
# ABOUTME: Deny the submission rather than let the secret into the transcript.
set -euo pipefail
INPUT="$(cat)"
PROMPT="$(jq -r '.prompt // empty' <<<"${INPUT}")"

SECRET_PATTERNS=(
    'AKIA[0-9A-Z]{16}'
    'ASIA[0-9A-Z]{16}'
    '-----BEGIN (RSA|OPENSSH|DSA|EC|PGP) PRIVATE KEY-----'
    'ghp_[A-Za-z0-9]{36,}'
    'github_pat_[A-Za-z0-9_]{22,}'
    'xox[baprs]-[A-Za-z0-9-]{10,}'
    'sk-[A-Za-z0-9]{32,}'
    'AIza[0-9A-Za-z_-]{35}'
)

for pat in "${SECRET_PATTERNS[@]}"; do
    if echo "${PROMPT}" | grep -Eq "${pat}"; then
        jq -n --arg r "Your prompt contains what looks like a secret matching /${pat}/. The prompt has NOT been submitted. Redact it and try again." '{
          hookSpecificOutput: {
            hookEventName: "UserPromptSubmit",
            permissionDecision: "deny",
            permissionDecisionReason: $r
          }
        }'
        exit 0
    fi
done

exit 0
