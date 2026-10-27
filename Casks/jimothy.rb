cask "jimothy" do
  arch arm: "-arm64"

  version "0.11.0"
  sha256 arm:   "38d21ea8eeb695673230c46817cd6c202b05c08dc371c2ecbd46940e0b5703db",
         intel: "2fc2a59eb3fdbb10e5ec1e1fb345a50bff2a24470c58e52cc3fb8bf5511e57dd"

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
