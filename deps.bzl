load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

BATS_SHELLMOCK_BUILD="""
sh_library(
    name = "shellmock",
    srcs = ["src/shellmock.bash"],
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
        version = "cd5555d36f65b651343d092de5fb0e6e9aecbfd6",
        sha256 = "7d59efcc2d09e7bc0995499b61f44efcc5a2364d0ed6260410e3d1b38f374cfd"):
    http_archive(
        name = "bats_shellmock",
        build_file_content = BATS_SHELLMOCK_BUILD,
        urls = [
            "https://github.com/duanemay/bats-shellmock/archive/%s.tar.gz" % version,
        ],
        strip_prefix = "bats-shellmock-%s" % version,
        sha256 = sha256,
    )
