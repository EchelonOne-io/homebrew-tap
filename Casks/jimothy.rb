cask "jimothy" do
  arch arm: "-arm64"

  version "0.3.0"
  sha256 arm:   "6ce534c5286af68204135579becfc87aac2597078a1161e8569b2e4c364c2aef",
         intel: "a6faf39bf8d2025ca48dc52029501b407dc4c8457c10aab44e7c441df11905ef"

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
