cask "jimothy" do
  arch arm: "-arm64"

  version "0.7.0"
  sha256 arm:   "e014315a73ff2f8698ed7b70c6a33a8630dfa944ba5ecd5985aebb2727b13fdd",
         intel: "ff01fdbe82a95fb47cca42fe95b0f50256808dd71e56db1cd5072f5de2131012"

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
