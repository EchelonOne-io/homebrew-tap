cask "jimothy" do
  arch arm: "-arm64"

  version "0.4.1"
  sha256 arm:   "afdf356f37d9afcb22be9b078c3ce789287c37e5d8105ef3b38a2ddd8bef63ef",
         intel: "69a6c5616008ec5d36bce89b4db97656f87466a6254da73c674851de49fce89a"

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
