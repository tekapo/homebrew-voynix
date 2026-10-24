cask "voynix" do
  version "0.26.2"
  sha256 "4b86e7fe7c487f1f36b559ae7b4d3d49495a5af985d64fd9a0bdc199bcb3f395"

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
