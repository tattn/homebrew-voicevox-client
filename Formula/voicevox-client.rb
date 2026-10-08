class VoicevoxClient < Formula
  desc "Unofficial VOICEVOX CLI for macOS"
  homepage "https://github.com/tattn/voicevox-client"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tattn/voicevox-client/releases/download/1.3.0/voicevox-client-1.3.0-macos-arm64.tar.gz"
      sha256 "ac9b1f6f5155e4fd1d6e7dda11f9d71791e348ece08c76f901f5df5c65dd5eb8"
    end

    on_intel do
      url "https://github.com/tattn/voicevox-client/releases/download/1.3.0/voicevox-client-1.3.0-macos-x86_64.tar.gz"
      sha256 "d1c525972c4dfec9e8155e7697cb9085866b8864c944e2b44d6cf9bf6aa4bd13"
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
