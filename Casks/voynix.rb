cask "voynix" do
  version "0.35.6"
  sha256 "d20e749972196bd9274b478b13d127b78497d98e18cd3d09fbf8238872767602"

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
