cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.2"
  sha256 arm:   "374321809ebe69714dff977cf4b4a34b439bf1d9ce4cb2762eabe6af3517105b",
         intel: "9bc85ae8a0951713389b0eeef187c0acb6395e3faaf362176cd4affef7a4d681"

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
