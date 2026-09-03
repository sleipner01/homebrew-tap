class Shotctl < Formula
  desc "Change macOS screenshot format, location, shadow and filename prefix"
  homepage "https://github.com/sleipner01/shotctl"
  url "https://github.com/sleipner01/shotctl/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "4442278649295a4e68b6dd72ae29f074ce1583cbccaf7afb297cf49122ec2cd1"
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
