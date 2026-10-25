cask "jimothy" do
  arch arm: "-arm64"

  version "0.10.2"
  sha256 arm:   "8c1a28c4c112506c86f7704d590c7b5c357f06be7328e1e65d4a226c9a909527",
         intel: "30471a45c243704d0b02470b3b711493b4a464244909e1e5d4a84fd1a96c3699"

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
