workspace(
    name = "bazel_shellmock",
    managed_directories = {"@bazel_shellmock_deps": ["node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_shellmock//:deps.bzl", "bats_shellmock_dependencies")
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "cfc289523cf1594598215901154a6c2515e8bf3671fd708264a6f6aefe02bf39",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/4.4.6/rules_nodejs-4.4.6.tar.gz"],
)
load("@build_bazel_rules_nodejs//:index.bzl", "npm_install")

npm_install(
    name = "bazel_shellmock_deps",
    package_json = "@bats_shellmock//:package.json",
    package_lock_json = "@bats_shellmock//:package-lock.json",
)

bats_shellmock_dependencies()

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
