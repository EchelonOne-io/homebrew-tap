cask "jimothy" do
  arch arm: "-arm64"

  version "0.7.1"
  sha256 arm:   "dd649e26a53ffc7bb1a2548f1fdeafc4db1e4ad2d52c52f9c1720c98f76da989",
         intel: "7352d3cd36ec45dbedb5716c6e114563f76d2bee08c43b8e210c5fb369bd51c1"

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
