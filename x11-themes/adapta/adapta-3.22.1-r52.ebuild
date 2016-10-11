# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools eutils ${GIT_ECLASS}

DESCRIPTION="An adaptive Gtk+ theme based on Material Design Guidelines"
HOMEPAGE="https://github.com/tista500/Adapta"
SRC_URI="${HOMEPAGE}/archive/${PV}.${PR:1}.tar.gz"
KEYWORDS="~*"
S="${WORKDIR}/Adapta-${PV}.${PR:1}"
ECONF_SOURCE="${S}"
RESTRICT="mirror"
LICENSE="GPL-2 CC-BY-SA-3.0"
SLOT="0"
IUSE="gtk_next chrome plank cinnamon flashback unity xfce parallel"

DEPEND="
  media-gfx/inkscape
  >=dev-ruby/bundler-1.11
  >=dev-ruby/sass-3.4.21
  >=dev-libs/glib-2.48.0
  dev-libs/libxml2
  parallel? ( sys-process/parallel )
"

RDEPEND="
  >=x11-libs/gtk+-2.24.30:2
  >=x11-libs/gtk+-3.20.1:3
  >=x11-libs/gdk-pixbuf-2.24.30
  >=x11-themes/gtk-engines-murrine-0.98.2
  >=x11-themes/gnome-themes-standard-3.14[gtk]
"

src_prepare() {
  eautoreconf
  eapply_user
}

src_configure() {
    econf \
    $(use_enable gtk_next) \
    $(use_enable chrome) \
    $(use_enable plank) \
    $(use_enable cinnamon) \
    $(use_enable flashback) \
    $(use_enable unity) \
    $(use_enable xfce) \
	$(use_enable parallel)
}

src_install() {
    emake \
    prefix=${ED}/usr \
    datadir=${ED}/usr/share \
    install
}
