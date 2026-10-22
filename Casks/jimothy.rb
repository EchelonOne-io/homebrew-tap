cask "jimothy" do
  arch arm: "-arm64"

  version "0.8.0"
  sha256 arm:   "1dff6fb6d16f8f4b800b1a89e95f8f912acc1979233d2510e9a0d43a196e9483",
         intel: "3ec1dd54d275939c56ac800fb0788108ee979f38083216310d484abdc2290e32"

  url "https://downloads.jimothy.dev/releases/v#{version}/Jimothy-#{version}#{arch}.dmg"
  name "Jimothy"
  desc "Turns Jira, Linear and GitHub issues into shipped code through agent pipelines"
  homepage "https://jimothy.dev/"

  livecheck do
    url "https://downloads.jimothy.dev/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :monterey

  app "Jimothy.app"

  zap trash: [
    "~/Library/Application Support/Jimothy",
    "~/Library/Logs/Jimothy",
    "~/Library/Preferences/dev.jimothy.app.plist",
    "~/Library/Saved Application State/dev.jimothy.app.savedState",
  ]
end
