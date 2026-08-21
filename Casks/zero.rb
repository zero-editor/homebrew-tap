cask "zero" do
  version "0.17.6"
  sha256 "bc6e815935af9260587c3db2c1f03036b71b1d61349eafbbdb72f51b369b9ebd"

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
