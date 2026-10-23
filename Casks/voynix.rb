cask "voynix" do
  version "0.24.4"
  sha256 "c19d218310f36d678591b4e826fde9cb22a9b5a2e21e2879c58d6dcd2a126a5f"

  url "https://github.com/tekapo/voynix/releases/download/v#{version}/Voynix_#{version}_aarch64.dmg"
  name "Voynix"
  desc "Local-first music player"
  homepage "https://tekapo.github.io/voynix/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Voynix.app"

  # The app is not notarized by Apple, so drop the quarantine flag to avoid the Gatekeeper block.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Voynix.app"],
        writable_paths: ["{{appdir}}/Voynix.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.tekapo.voynix",
    "~/Library/Caches/com.tekapo.voynix",
    "~/Library/WebKit/com.tekapo.voynix",
  ]
end
