# Configuration #
# ============= #
JINJA_DIR = jinja
STATIC_DIR = static
VENV_DIR = .venv
BUILD_DIR = build

# Derived Configuration #
# ===================== #
JINJA_BUILD = ${JINJA_DIR}/build.py
JINJA_TEMPLATES = ${JINJA_DIR}/templates
JINJA_FILES = ${JINJA_BUILD} $(wildcard ${JINJA_TEMPLATES}/*.html)

STATIC_FILES = $(wildcard ${STATIC_DIR}/*.html ${STATIC_DIR}/*.css \
			   ${STATIC_DIR}/*.png)

# bin directory within the venv
VENV_BIN = ${VENV_DIR}/bin
# pip executable within the venv
VENV_PIP = ${VENV_BIN}/pip
# python executable within the venv
VENV_PYTHON = ${VENV_BIN}/python

# release build output dir
RELEASE_DIR = ${BUILD_DIR}/release
# debug build output dir
DEBUG_DIR = ${BUILD_DIR}/debug

# Rules #
# ===== #
${BUILD_DIR}: ${RELEASE_DIR} ${DEBUG_DIR}

${RELEASE_DIR}: ${RELEASE_DIR}/final
${DEBUG_DIR}: ${DEBUG_DIR}/final

${VENV_DIR}:
	python3 -m venv .venv
	${VENV_PIP} install --upgrade pip Jinja2

${RELEASE_DIR}/final: ${RELEASE_DIR}/jinja ${RELEASE_DIR}/static
	rm -rf $@
	mkdir -p $@
	for src in $^; do \
		cp -R "$$src/." $@; \
	done
${DEBUG_DIR}/final: ${DEBUG_DIR}/jinja ${DEBUG_DIR}/static
	rm -rf $@
	mkdir -p $@
	for src in $^; do \
		cp -R "$$src/." $@; \
	done

${RELEASE_DIR}/jinja: ${VENV_DIR} ${JINJA_FILES}
	rm -rf $@
	${VENV_PYTHON} ${JINJA_BUILD} ${JINJA_TEMPLATES} -o $@
${DEBUG_DIR}/jinja: ${VENV_DIR} ${JINJA_FILES}
	rm -rf $@
	${VENV_PYTHON} ${JINJA_BUILD} ${JINJA_TEMPLATES} -o $@

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

.PHONY: deepclean
deepclean: clean
	rm -rf ${VENV_DIR}
