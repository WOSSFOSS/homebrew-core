class Supmover < Formula
  desc "Shift timings and Screen Area of PGS/Sup subtitle"
  homepage "https://github.com/MonoS/SupMover"
  url "https://github.com/MonoS/SupMover/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "0b55492ec9697e51ddb97fd6b1d96c64a213b9a89d8656bf3f95ed930c133a99"
  license "AGPL-3.0"

  depends_on "ffmpeg" => :test

  def install
    system ENV.cxx, "-Wall", "-fexceptions", "-O2", "-Wall", "-Wextra", "-std=c++17", "main.cpp", "-o", "SupMover"

    bin.install "SupMover"
  end

    test do
    resource "testdata" do
      url "https://github.com/Homebrew/brew/raw/e3de7d5ae3221dc78f1372f8fa5fc71f073cbcd5/Library/Homebrew/test/support/fixtures/helloworld.sup"
      sha256 "8ba7a15178253fb708ca776a2914a27e90f5719c511bf403be2d448df7e7756b"
    end

    resource("testdata").stage do
      assert_match "PTS: 0:00:01.000", shell_output("#{bin}/SupMover helloworld.sup --trace")
    end
  end
end
