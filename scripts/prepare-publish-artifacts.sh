#!/usr/bin/env bash
set -euo pipefail

# Materialize repository-owned files that published workspace packages expect.
# Keep source installs and normal releases on the same preparation path.
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

bash "$REPO_ROOT/scripts/prepare-server-ui-dist.sh"

for package_dir in server packages/adapters/claude-local packages/adapters/codex-local; do
  rm -rf "$REPO_ROOT/$package_dir/skills"
  cp -R "$REPO_ROOT/skills" "$REPO_ROOT/$package_dir/skills"
done
