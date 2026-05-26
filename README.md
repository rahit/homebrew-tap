# homebrew-tap

Homebrew formulae by [@rahit](https://github.com/rahit).

## fortivpn-auto

Auto-connect a SAML FortiGate SSL-VPN on macOS by Wi-Fi SSID.
([source](https://github.com/rahit/fortivpn-auto))

```bash
brew install rahit/tap/fortivpn-auto
fortivpn-auto install --preset ucalgary
```

`brew install` pulls `openfortivpn` and the `hammerspoon` cask automatically. The
`fortivpn-auto install` step does the per-Mac wiring (config, Spoon, scoped
sudoers, LaunchAgent) that a formula can't — it needs `sudo` and your gateway
details. Then grant Hammerspoon Location Services and run `fortivpn-auto doctor`.
