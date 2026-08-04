cask "clavis" do
  version "1.0.5"
  sha256 "d37b532a353d590096d3ea8348a723ab2531755cdc089d5559eebd223d4c9752"

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
