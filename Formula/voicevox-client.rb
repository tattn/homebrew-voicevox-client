class VoicevoxClient < Formula
  desc "Unofficial VOICEVOX CLI for macOS"
  homepage "https://github.com/tattn/voicevox-client"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.1/voicevox-client-1.2.1-macos-arm64.tar.gz"
      sha256 "5377da5f638329d7d53cae255ce550913ab0fd95692b151959644fed0f7fbf48"
    end

    on_intel do
      url "https://github.com/tattn/voicevox-client/releases/download/1.2.1/voicevox-client-1.2.1-macos-x86_64.tar.gz"
      sha256 "4a9db357d64037ef2527af3f10c9602754d0e7d859a06dc2583c92efcfb60cfd"
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
