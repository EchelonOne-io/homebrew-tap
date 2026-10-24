cask "jimothy" do
  arch arm: "-arm64"

  version "0.10.0"
  sha256 arm:   "a3f9d7e3f3d25efab3bb75ee14f6b03e29847113df2f41c8160332faa95f70a5",
         intel: "82bda6e048329431d7fe0a03bacff747928e1c1dfdeebeba582eb4ce5516bcd9"

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
