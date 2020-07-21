cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
include(ExternalProject)

ExternalProject_Add(
  tensorflow_base
  URL https://github.com/tensorflow/tensorflow/archive/${TENSORFLOW_TAG}.tar.gz
  TMP_DIR "/tmp"
  STAMP_DIR "tensorflow-stamp"
  DOWNLOAD_DIR "tensorflow"
  SOURCE_DIR "tensorflow"
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND perl -i.bak -plne "print \"    *protobuf*$<SEMICOLON>\" if(/local:/)$<SEMICOLON>" tensorflow/tf_version_script.lds
  BUILD_COMMAND "${CMAKE_CURRENT_BINARY_DIR}/build_tensorflow.sh"
  INSTALL_COMMAND "${CMAKE_CURRENT_SOURCE_DIR}/cmake/copy_links.sh" bazel-bin
)
