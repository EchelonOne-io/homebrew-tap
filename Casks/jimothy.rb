cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.3"
  sha256 arm:   "ad08a64b099995ebe6fbd594b039ca9663a54d06420f5fff8307f605fa537170",
         intel: "077631e7cfd2c385aa4779c79bbf3395e9263eedfd658320e603f132730fbab3"

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
