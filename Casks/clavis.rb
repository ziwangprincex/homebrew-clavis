cask "clavis" do
  version "1.3.1"
  sha256 "6e327ff4ee263f5fd65fd675e23e5c370c5b99fc95026e35d7b72343278747c2"

  url "https://github.com/ziwangprincex/Clavis/releases/download/v#{version}/Clavis_#{version}_aarch64.dmg"
  name "Clavis"
  desc "Markdown / LaTeX / Typst editor with live preview"
  homepage "https://github.com/ziwangprincex/Clavis"

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Clavis.app"

  zap trash: [
    "~/Library/Application Support/clavis",
    "~/Library/Caches/com.clavis.app",
    "~/Library/Preferences/com.clavis.app.plist",
    "~/Library/Saved Application State/com.clavis.app.savedState",
  ]

  caveats <<~EOS
    Clavis is ad-hoc signed but NOT notarized by Apple, so macOS may
    report it as "damaged". Clear the quarantine flag once:

      xattr -cr /Applications/Clavis.app
  EOS
end
