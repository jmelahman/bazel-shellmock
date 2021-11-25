workspace(name = "bazel_shellmock")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BAZEL_BATS_VERSION = "05902c66e7aba5bca0816109e9f34e2dbebe19f6"

http_archive(
    name = "bazel_bats",
    sha256 = "0be1795d8052c54e1068b3b0a648d67de0b9bf43cd15fd7bef73b6460b73b78f",
    strip_prefix = "bazel-bats-%s" % BAZEL_BATS_VERSION,
    urls = [
        "https://github.com/filmil/bazel-bats/archive/%s.tar.gz" % BAZEL_BATS_VERSION,
    ],
)

load("@bazel_bats//:deps.bzl", "bazel_bats_dependencies")

bazel_bats_dependencies()
