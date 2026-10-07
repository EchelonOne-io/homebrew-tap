cask "jimothy" do
  arch arm: "-arm64"

  version "0.3.1"
  sha256 arm:   "4bafb4a18193aa15834882de21a5cd4f599b76e7eeba1125a5e46d832882cbbe",
         intel: "b4af630a15c3dd796f0032dce8ddebbfb9a8cbce661cab013a1a197a474fdf7a"

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
