load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BATS_SHELLMOCK_BUILD="""
sh_library(
    name = "shellmock",
    srcs = ["load.bash"] + glob(["src/*"]),
    visibility = ["//visibility:public"],
)

sh_library(
    name = "test_helper",
    srcs = ["test/test_helper.bash"],
    visibility = ["//visibility:public"],
    data = [
        "@bazel_shellmock_deps//bats-support",
        "@bazel_shellmock_deps//bats-assert",
        "@bazel_shellmock_deps//bats-file",
    ],
)

sh_library(
    name = "test_lib",
    srcs = ["test/shellmock.bats"],
    visibility = ["//visibility:public"],
    deps = [
        ":test_helper",
    ],
)
exports_files(glob(["test/**"]))
"""

def bazel_shellmock_dependencies(
        version = "4c009bf2461147d9522781d99c4cf2d520e712c2",
        sha256 = "ca212f2705b683f820134bc737ce0d398c7e9f37be198e15f64d24c72bf4bbc5",
    ):
    # Maybe load to allow override.
    http_archive(
        name = "bats_shellmock",
        build_file_content = BATS_SHELLMOCK_BUILD,
        urls = [
            "https://github.com/duanemay/bats-shellmock/archive/%s.tar.gz" % version,
        ],
        strip_prefix = "bats-shellmock-%s" % version,
        sha256 = sha256,
    )
