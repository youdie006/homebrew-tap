class Swapdex < Formula
  desc "Switch between multiple Claude Code, Codex, Gemini, and Antigravity login accounts, locally and safely"
  homepage "https://github.com/youdie006/swapdex"
  version "0.38.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.1/swapdex-aarch64-apple-darwin.tar.gz"
      sha256 "32e4c5b9ddeff68f492b7deb925b0d6de6953bec8ce4e11697df48f9af464eae"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.1/swapdex-x86_64-apple-darwin.tar.gz"
      sha256 "8d209d78f5c1bd192d3e801e651c0fab374f65cbe9a212917fd0958ba57709f8"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.1/swapdex-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d66951e8f34a24a84720e47603b0ff728d51cb06f293beb839c59ba54ec3207f"
    else
      url "https://github.com/youdie006/swapdex/releases/download/v0.38.1/swapdex-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d79271639236747534077de4233213a54c61caf1796b103f54655542d1e51e07"
    end
  end
  def install
    bin.install "swapdex"
    generate_completions_from_executable(bin/"swapdex", "completions")
    (buildpath/"swapdex.1").write Utils.safe_popen_read(bin/"swapdex", "manpage")
    man1.install "swapdex.1"
  end
  test do
    assert_match "swapdex 0.38.1", shell_output("#{bin}/swapdex --version")
  end
end
