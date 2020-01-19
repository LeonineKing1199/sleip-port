include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LeonineKing1199/sleip
    REF v1.0.0
    SHA512 012679ae00027d0baf8955441c97201c459a88d2850355ae4c937212c4533ac72fccf58a1e29b5ab2f6bbcfc0ffb74e6644b45fbeafc512a44ed490bfb12819b
    HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
    -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/sleip-1.0.0 TARGET_PATH share/sleip-1.0.0)

file(
  INSTALL
    ${SOURCE_PATH}/LICENSE_1_0.txt

  DESTINATION
    ${CURRENT_PACKAGES_DIR}/share/${PORT}

  RENAME
    copyright
)


file(
  REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug
    ${CURRENT_PACKAGES_DIR}/lib
)
