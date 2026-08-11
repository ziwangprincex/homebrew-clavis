cask "clavis" do
  version "1.0.9"
  sha256 "93e3b1418293f7796e664a968f0302b1ad19ef1d6333d8f450b693184cd1463b"

  url "https://github.com/ziwangprincex/Clavis/releases/download/v#{version}/Clavis_#{version}_aarch64.dmg"
  name "Clavis"
  desc "Markdown / LaTeX / Typst editor with live preview"
  homepage "https://github.com/ziwangprincex/Clavis"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  auto_updates true

  app "Clavis.app"

  caveats <<~EOS
    Clavis is ad-hoc signed but NOT notarized by Apple, so macOS may
    report it as "damaged". Clear the quarantine flag once:

      xattr -cr /Applications/Clavis.app
  EOS

  zap trash: [
    "~/Library/Application Support/clavis",
    "~/Library/Caches/com.clavis.app",
    "~/Library/Preferences/com.clavis.app.plist",
    "~/Library/Saved Application State/com.clavis.app.savedState",
  ]
end
