---
description: Update a Homebrew formula to a new upstream release
argument-hint: "<formula> [version]"
---
Update `Formula/$1.rb` in this tap to ${2:-the latest stable upstream release}.

If no formula name was supplied, ask for one before making changes.
Confirm the formula exists and inspect its current URL, version, checksum, dependencies, build steps, and tests.
Check the upstream release and its source archive; if the requested version is unavailable or ambiguous, ask before proceeding.
Preserve the formula's existing URL style (tag or commit archive) when appropriate, and update the explicit `version` field only when needed.
Download the exact archive referenced by the new URL and calculate its SHA-256; never guess the checksum.
Adjust dependencies, build steps, or tests only if the new release requires it. Keep unrelated formulae unchanged.

Run `brew style Formula/$1.rb`, `brew audit --strict eulegang/tap/$1`, and `brew test eulegang/tap/$1` when available.
Report the version and URL chosen, checksum source, changes made, and which checks passed, failed, or could not run.
Do not claim a check passed unless it ran.
