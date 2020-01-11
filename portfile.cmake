include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO LeonineKing1199/sleip
    REF 694ed4930d3c28e5de01c3826084584d61ca8ada
    SHA512 47815e08fa740b39e0a368a2ea8e3a1c451531ff69534ff4133ee5c8bfa8ffde708053e0ebdc2f8c8138ba5c93a18cfcc118b577461577506c1cfcc6d9f2f519
    HEAD_REF develop
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
