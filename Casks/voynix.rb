cask "voynix" do
  version "0.27.3"
  sha256 "f4fee53e9ecf9d654b62c8d28cf1bd154d395850c4ac96c380ebf7ac1667a3f6"

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
