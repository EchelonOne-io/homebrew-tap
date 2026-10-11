cask "jimothy" do
  arch arm: "-arm64"

  version "0.6.1"
  sha256 arm:   "12bd6627dd7eaf505f84ab66077fde680f6f6c16fa653d8dfa3acd2b2e30d1d7",
         intel: "12df5bc3ec0c5175b0313f774cfc51f5c439ccef46efd70064a1efb891608929"

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
