class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.110.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.110.0/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "2d80fd787c1e361410af4fef73c65e6830fada3aff5affd572d77ff80a297f22"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.110.0/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "08e149a0b3a62aab7e5b0b2df56eed6b2163f5f90ea5eefa1a7a17b32ed9a75b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.110.0/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2a182e2139f2446d654ffd6808dd7372537eada904ec72374cfe85e2e3bb45df"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.110.0/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "39c0593bca81fa3ef8b4e30ecf7efcb488a55840d7dd603b2b62605f363111f3"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.110.0", shell_output("#{bin}/swapdex --version")
  end
end
