cask "zero" do
  version "0.52.0"
  sha256 "f3503647d996256fda4748b5b6c3c43468b57bbafbabf7d3835579169b6b9804"

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
