cask "jimothy" do
  arch arm: "-arm64"

  version "0.4.0"
  sha256 arm:   "b1b3e8be3697cab5c156e4df74be3b02990ee7ccf5e4e0ce640a0e7dc6097701",
         intel: "31ae40de008675365ba2c9d3c644ea7495f373be14163daba4d409bb813971d7"

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
