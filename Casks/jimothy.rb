cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.1"
  sha256 arm:   "b10b01481919d5a2907e5c26a71083dc851e24573a1b67f88a747e7f2f5ffb98",
         intel: "5e5a0356442eb3db21a82a6731de092e8f28d5656badfab173983694c072024e"

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
