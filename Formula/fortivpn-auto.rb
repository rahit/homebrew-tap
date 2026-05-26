class FortivpnAuto < Formula
  desc "Auto-connect a SAML FortiGate SSL-VPN on macOS by Wi-Fi SSID"
  homepage "https://github.com/rahit/fortivpn-auto"
  url "https://github.com/rahit/fortivpn-auto/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "48c5fa34148ffed0cf589b17896f4c991a76cb8526901ec9c7a014160dcd5d4a"
  license "MIT"

  depends_on "openfortivpn"
  # Hammerspoon is a cask and can't be a formula dependency; `fortivpn-auto
  # install` runs `brew install --cask hammerspoon` if it's not already present.

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fortivpn-auto"
  end

  def caveats
    <<~EOS
      One more step — finish setup on this Mac (installs Hammerspoon if needed,
      writes your openfortivpn config + the Spoon, a scoped sudoers grant, and a
      LaunchAgent):

        fortivpn-auto install --preset ucalgary       # UCalgary
        fortivpn-auto install --config ~/vpn.conf     # any FortiGate SAML gateway

      Then grant Hammerspoon Location Services (required on macOS 14+ to read the
      Wi-Fi SSID), and verify with:

        fortivpn-auto doctor
    EOS
  end

  test do
    assert_match "fortivpn-auto", shell_output("#{bin}/fortivpn-auto version")
  end
end
