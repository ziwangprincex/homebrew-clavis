cask "clavis" do
  version "1.7.0"
  sha256 "9d68548d68777434ea0cf3d5799390896005d7030cd11f0f204e468a8af456d6"

  url "https://github.com/ziwangprincex/Clavis/releases/download/v#{version}/Clavis_#{version}_aarch64.dmg"
  name "Clavis"
  desc "Markdown / LaTeX / Typst editor with live preview"
  homepage "https://github.com/ziwangprincex/Clavis"

  depends_on arch: :arm64
  depends_on macos: ">= 11.0"

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
