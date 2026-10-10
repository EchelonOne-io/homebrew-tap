cask "jimothy" do
  arch arm: "-arm64"

  version "0.6.0"
  sha256 arm:   "70e9f56e7c791a6d89a2c98714c150e882b30213258261c67be67b60721e910f",
         intel: "5ac8cf87f28946028ad1c55dc43055de1aea244552cbba08f8df03fba72d291e"

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
