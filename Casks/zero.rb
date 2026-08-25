cask "zero" do
  version "0.24.1"
  sha256 "39634a961d46abf0831a93d05a3e24d88e803cce287908b22e2e57482bcdd7f0"

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
