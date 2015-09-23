# This file is part of MXE.
# See index.html for further information.

PKG             := enet
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5f476546edabdf37509cd3448d1a616f5eca535d
$(PKG)_CHECKSUM := 865c43c3777a216fff241e8f0098555ebed2f019
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_GITHUB   := https://github.com//lsalzman/enet
$(PKG)_URL      := $($(PKG)_GITHUB)/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD

    # configure
    mkdir '$(1).build'
    cd '$(1).build' && cmake \
      -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
      '$(1)'

    # build
    $(MAKE) -C '$(1).build' -j '$(JOBS)'

    # install include files
    $(INSTALL) -D '$(1)/include/enet/callbacks.h' '$(PREFIX)/$(TARGET)/include/enet/callbacks.h'
    $(INSTALL) -D '$(1)/include/enet/enet.h'      '$(PREFIX)/$(TARGET)/include/enet/enet.h'
    $(INSTALL) -D '$(1)/include/enet/list.h'      '$(PREFIX)/$(TARGET)/include/enet/list.h'
    $(INSTALL) -D '$(1)/include/enet/protocol.h'  '$(PREFIX)/$(TARGET)/include/enet/protocol.h'
    $(INSTALL) -D '$(1)/include/enet/time.h'      '$(PREFIX)/$(TARGET)/include/enet/time.h'
    $(INSTALL) -D '$(1)/include/enet/types.h'     '$(PREFIX)/$(TARGET)/include/enet/types.h'
    $(INSTALL) -D '$(1)/include/enet/unix.h'      '$(PREFIX)/$(TARGET)/include/enet/unix.h'
    $(INSTALL) -D '$(1)/include/enet/utility.h'   '$(PREFIX)/$(TARGET)/include/enet/utility.h'
    $(INSTALL) -D '$(1)/include/enet/win32.h'     '$(PREFIX)/$(TARGET)/include/enet/win32.h'

endef
