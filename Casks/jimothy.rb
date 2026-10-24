cask "jimothy" do
  arch arm: "-arm64"

  version "0.9.0"
  sha256 arm:   "113a47be140ec62c7c4c73fd0a0a3b8974895612260518a9edbcb9f962134dfd",
         intel: "624b695b4ed714580f2f79e37df58246937adf0a3bc4fa93e4a1b3938e495f9c"

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
