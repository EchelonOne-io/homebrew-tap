cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.6"
  sha256 arm:   "ac4efa5ecbf4ee915a60036ae8aece3fe978d7582088dd3a5161e4b06e2ecd6f",
         intel: "1fb5e79045a0a48c58ffb8f27ee4d813283242fca0a4ff98a1c7af9dcbc12111"

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
