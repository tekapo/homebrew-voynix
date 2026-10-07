# homebrew-voynix

Homebrew tap for [Voynix](https://github.com/tekapo/voynix), a local-first music player for Mac and Android.

```
brew install --cask tekapo/voynix/voynix
```

Apple Silicon only. Voynix is not notarized by Apple, so the cask removes the quarantine flag after installing.
Upgrade with `brew upgrade --cask voynix`. The cask is updated by `npm run release` in the Voynix repository.
