cask "zero" do
  version "0.41.0"
  sha256 "5df244440fd4fdef8d6dbe71d0e5af8d5f0a2001e51ff7ddcd264214d00850d0"

  url "https://github.com/zero-editor/zero/releases/download/v#{version}/zero_aarch64.dmg"
  name "zero"
  desc "Minimal code editor built around running coding agents"
  homepage "https://github.com/zero-editor/zero"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apple Silicon only, and Apple Silicon starts at Big Sur. The Info.plist
  # still carries Tauri's default 10.13; the Mach-O's own minos is 11.0.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "zero.app"

  # zero writes ~/.local/bin/zero on every launch, which is how the `zero`
  # shell command installs itself — so it's the app's to remove
  zap trash: [
    "~/.local/bin/zero",
    "~/Library/Application Support/com.vidtopolovec.zero",
    "~/Library/Caches/com.vidtopolovec.zero",
    "~/Library/Saved Application State/com.vidtopolovec.zero.savedState",
    "~/Library/WebKit/com.vidtopolovec.zero",
  ]
end
