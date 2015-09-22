# This file is part of MXE.
# See index.html for further information.

PKG             := libenet
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
    cd '$(1)' && autoreconf -fi -I'$(PREFIX)/$(TARGET)/share/aclocal'
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_CRUFT)
endef
