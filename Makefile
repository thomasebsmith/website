# Configuration #
# ============= #
BUILD_DIR = build
RELEASE_DIR = ${BUILD_DIR}/release
DEBUG_DIR = ${BUILD_DIR}/debug
STATIC_DIR = static

# Static dependencies #
# =================== #
STATIC_FILES = $(wildcard ${STATIC_DIR}/*.html ${STATIC_DIR}/*.css \
			   ${STATIC_DIR}/*.png)

# Rules #
# ===== #
${BUILD_DIR}: ${RELEASE_DIR} ${DEBUG_DIR}

${RELEASE_DIR}: ${RELEASE_DIR}/final
${DEBUG_DIR}: ${DEBUG_DIR}/final

${RELEASE_DIR}/final: ${RELEASE_DIR}/static
	rm -rf $@
	mkdir -p $@
	for src in $^; do \
		cp -R "$$src/." $@; \
	done
${DEBUG_DIR}/final: ${DEBUG_DIR}/static
	rm -rf $@
	mkdir -p $@
	for src in $^; do \
		cp -R "$$src/." $@; \
	done

${RELEASE_DIR}/static: ${STATIC_FILES}
	rm -rf $@
	mkdir -p $@
	cp -R ${STATIC_DIR}/. $@
${DEBUG_DIR}/static: ${STATIC_FILES}
	rm -rf $@
	mkdir -p $@
	cp -R ${STATIC_DIR}/. $@

.PHONY: clean
clean:
	rm -rf ${BUILD_DIR}
