cask "jimothy" do
  arch arm: "-arm64"

  version "0.6.2"
  sha256 arm:   "5871a63fa65397d36f42323c6a3d7b8f3dcb5246d792e44c015a0a6976160d2e",
         intel: "c73bc97e76a80909058bf42cb482abd4e822afbbd0b25a304037d925361b4864"

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
