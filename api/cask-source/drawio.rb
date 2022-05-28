cask "drawio" do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"

  version "18.1.3"

  if Hardware::CPU.intel?
    sha256 "56184512ce9b33cbdd7f373a4935c23a406a950ea27517a1b9a9be467d456300"
  else
    sha256 "0fc2e2ce7cea4c727b8942b69b2e9e08dd09cf105af2ea186417f08531ff8c84"
  end

  url "https://github.com/jgraph/drawio-desktop/releases/download/v#{version}/draw.io-#{arch}-#{version}.dmg",
      verified: "github.com/jgraph/drawio-desktop/"
  name "draw.io Desktop"
  desc "Draw.io is free online diagram software"
  homepage "https://www.diagrams.net/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "draw.io.app"

  zap trash: [
    "~/Library/Application Support/draw.io",
    "~/Library/Caches/com.jgraph.drawio.desktop",
    "~/Library/Logs/draw.io",
    "~/Library/Preferences/com.jgraph.drawio.desktop.helper.plist",
    "~/Library/Preferences/com.jgraph.drawio.desktop.plist",
    "~/Library/Saved Application State/com.jgraph.drawio.desktop.savedState",
    "~/Library/WebKit/com.jgraph.drawio.desktop",
  ]
end
