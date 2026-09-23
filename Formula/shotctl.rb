class Shotctl < Formula
  desc "Change macOS screenshot format, location, shadow and filename prefix"
  homepage "https://github.com/sleipner01/shotctl"
  url "https://github.com/sleipner01/shotctl/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "b7914c8c30dbc73011fab9894fde67232188c8f479db58a79b893a28072583ce"
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
