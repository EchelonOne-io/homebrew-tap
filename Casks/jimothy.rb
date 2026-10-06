cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.5"
  sha256 arm:   "f09fbf74d38c1da3b3613f6c0d26f95f6bc5fd6d8ef34d336f823e1671c8171e",
         intel: "48f7cce6847b25c24718b9392c864473fa685f3a208da9e533e9e715c902dbff"

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
