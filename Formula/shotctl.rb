class Shotctl < Formula
  desc "Change macOS screenshot format, location, shadow and filename prefix"
  homepage "https://github.com/sleipner01/shotctl"
  url "https://github.com/sleipner01/shotctl/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "7b4a83ed2d8f1b1cef2a2a036f0d1e46073a8098eafcecf6248c6c40da59ed3c"
  license "MIT"

  depends_on :macos

  def install
    inreplace "bin/shotctl", 'VERSION="dev"', "VERSION=\"#{version}\""
    bin.install "bin/shotctl"
    zsh_completion.install "completions/_shotctl"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/shotctl --help")
    assert_match version.to_s, shell_output("#{bin}/shotctl --version")
    assert_match "format", shell_output("#{bin}/shotctl status")
  end
end
