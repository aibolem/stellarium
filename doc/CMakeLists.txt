
# to generate manual page:
# pod2man --section=1 -r ${VERSION} --center=" " stellarium.pod stellarium.1

IF(UNIX AND NOT WIN32 AND NOT APPLE)
     ADD_CUSTOM_TARGET(ManPages ALL)

     CONFIGURE_FILE(
          ${PROJECT_SOURCE_DIR}/cmake/stellarium.pod.cmake
          ${CMAKE_CURRENT_BINARY_DIR}/stellarium.pod
     )

     ADD_CUSTOM_COMMAND(
          TARGET ManPages
          COMMAND pod2man
          ARGS -s 1 -r ${VERSION} -center=" " ${CMAKE_CURRENT_BINARY_DIR}/stellarium.pod ${CMAKE_CURRENT_BINARY_DIR}/stellarium.1
          OUTPUTS ${CMAKE_CURRENT_BINARY_DIR}/stellarium.1
     )

     ADD_CUSTOM_COMMAND(
          TARGET ManPages
          DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/stellarium.1
     )

     IF(${CMAKE_SYSTEM_NAME} MATCHES "(DragonFly|FreeBSD|NetBSD|OpenBSD)" AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "kFreeBSD")
          INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/stellarium.1 DESTINATION man/man1)
     ELSE(${CMAKE_SYSTEM_NAME} MATCHES "(DragonFly|FreeBSD|NetBSD|OpenBSD)" AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "kFreeBSD")
          INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/stellarium.1 DESTINATION share/man/man1)
     ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "(DragonFly|FreeBSD|NetBSD|OpenBSD)" AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "kFreeBSD")
ENDIF(UNIX AND NOT WIN32 AND NOT APPLE)


