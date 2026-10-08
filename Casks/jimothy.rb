cask "jimothy" do
  arch arm: "-arm64"

  version "0.5.0"
  sha256 arm:   "dc5f00b8162384de1e74eff11dd905616ea41c8dec65497778c6ede2bf2bbe6e",
         intel: "03d9bf74020b0349d696023e185296fc79988594394f650e7df8de20161ee486"

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
