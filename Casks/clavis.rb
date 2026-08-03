cask "clavis" do
  version "1.0.4"
  sha256 "2633f5dc5982224c9ad41ceb8d0dceba14f0c79c38311f7f582c1d3818088af0"

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
