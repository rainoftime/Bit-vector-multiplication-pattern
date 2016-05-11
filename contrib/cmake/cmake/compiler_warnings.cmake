set(GCC_AND_CLANG_WARNINGS
    "-Wall"
)
set(GCC_ONLY_WARNINGS "")
set(CLANG_ONLY_WARNINGS "")
set(MSVC_WARNINGS "/W3")

set(WARNING_FLAGS_TO_CHECK "")
if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU")
  list(APPEND WARNING_FLAGS_TO_CHECK ${GCC_AND_CLANG_WARNINGS})
  list(APPEND WARNING_FLAGS_TO_CHECK ${GCC_ONLY_WARNINGS})
elseif ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  list(APPEND WARNING_FLAGS_TO_CHECK ${GCC_AND_CLANG_WARNINGS})
  list(APPEND WARNING_FLAGS_TO_CHECK ${CLANG_ONLY_WARNINGS})
  # FIXME: Remove "x.." when CMP0054 is set to NEW
elseif ("x${CMAKE_CXX_COMPILER_ID}" STREQUAL "xMSVC")
  list(APPEND WARNING_FLAGS_TO_CHECK ${MSVC_WARNINGS})
else()
  message(AUTHOR_WARNING "Unknown compiler")
endif()

# Loop through flags and use the ones which the compiler supports
foreach (flag ${WARNING_FLAGS_TO_CHECK})
  z3_add_cxx_flag("${flag}")
endforeach()

option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" OFF)
if (WARNINGS_AS_ERRORS)
  if (("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang") OR ("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU"))
    list(APPEND Z3_COMPONENT_CXX_FLAGS "-Werror")
    # FIXME: Remove "x.." when CMP0054 is set to NEW
  elseif ("x${CMAKE_CXX_COMPILER_ID}" STREQUAL "xMSVC")
    list(APPEND Z3_COMPONENT_CXX_FLAGS "/WX")
  else()
    message(AUTHOR_WARNING "Unknown compiler")
  endif()
  message(STATUS "Treating compiler warnings as errors")
else()
  message(STATUS "Not treating compiler warnings as errors")
endif()
