class VoicevoxClient < Formula
  desc "Unofficial VOICEVOX CLI for macOS"
  homepage "https://github.com/tattn/voicevox-client"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.0/voicevox-client-1.2.0-macos-arm64.tar.gz"
      sha256 "1f6931a652e9404289e22e257571da0d37b7eaaba2bd336e574e5dcbf2b406c7"
    end

    on_intel do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.0/voicevox-client-1.2.0-macos-x86_64.tar.gz"
      sha256 "7c374f3a3d4430a6ba7d5e94684b89c34d7c51cf0f80c783110ba9ad877470eb"
    end
  end

  def install
    bin.install "voicevox-client"
    bin.install "libvoicevox_core.dylib"
    bin.install "libvoicevox_onnxruntime.1.17.3.dylib"
  end

  test do
    output = shell_output("#{bin}/voicevox-client --help")
    assert_match "VOICEVOX text-to-speech CLI tool", output
    assert_match "setup", output
  end
end
