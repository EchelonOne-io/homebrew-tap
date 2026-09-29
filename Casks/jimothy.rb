cask "jimothy" do
  arch arm: "-arm64"

  version "0.2.0"
  sha256 arm:   "8c58e159f6e5fea715608c4390af21efd4cbcea8223d65efa2d318385d9d3936",
         intel: "4522f93bc519b7d2fcc4f3fed5177fe116345eef4bb3643c04fc9a7f3940751a"

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
