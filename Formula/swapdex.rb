class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.167.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.7/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "1933e05fcf236abecfde7c8853453e818bcf9fcc42e07448729148d92ca04065"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.7/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "4831f97688c0ac34083f6adcded4348c01b7a27de9da9e2ccbc925196a351b15"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.7/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "65b8ee460aeb2f2b200a0fdf85343702385672ccacf096f6e9c4378b9eb5835e"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.167.7/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d706a862e1ce276b19aca76cfa83fabf3705769d34ce5d39513c07e6b44b8bd1"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.167.7", shell_output("#{bin}/swapdex --version")
  end
end
