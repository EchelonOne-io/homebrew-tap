cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.4"
  sha256 arm:   "385f727113736c357d2920a765bbbff22fa8f43e6b56327211180c47ac4ac0a3",
         intel: "f0795d3ca80b1c27091b777c32014c309d1cc7d06164e34bfaad583d1560691e"

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
