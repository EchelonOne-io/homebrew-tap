cask "jimothy" do
  arch arm: "-arm64"

  version "0.10.1"
  sha256 arm:   "7929d48e1338c2f536b634c6415fd558891d8684a8fbc5419154474ef998eb14",
         intel: "00eaf0b30ee9bb451a49830ff6862ec13a6e56c607d7123ef9551a5a5476114c"

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
