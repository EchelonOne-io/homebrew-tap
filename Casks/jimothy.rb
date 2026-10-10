cask "jimothy" do
  arch arm: "-arm64"

  version "0.5.1"
  sha256 arm:   "fbdb68584ad8bac0f4e44672ea601ff33d33c133a0c71f33581de5c48fb361dd",
         intel: "de2b247a29636330ce95ee44d9129dc02d848f3dd661a8db706e031bbbf28ce5"

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
