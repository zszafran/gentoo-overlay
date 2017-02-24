# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit gnome2 autotools eutils ${GIT_ECLASS}

DESCRIPTION="An adaptive Gtk+ theme based on Material Design Guidelines"
HOMEPAGE="https://github.com/adapta-project/adapta-gtk-theme"
SRC_URI="${HOMEPAGE}/archive/${PV}.${PR:1}.tar.gz"
KEYWORDS="~*"
S="${WORKDIR}/adapta-gtk-theme-${PV}.${PR:1}"
ECONF_SOURCE="${S}"
RESTRICT="mirror"
LICENSE="GPL-2 CC-BY-SA-3.0"
SLOT="0"
IUSE="gtk_next chrome plank cinnamon flashback unity xfce parallel mate openbox"

DEPEND="
  media-gfx/inkscape
  >=dev-lang/sassc-3.4.2
  >=dev-libs/glib-2.48.0
  dev-libs/libxml2
  parallel? ( sys-process/parallel )
"

RDEPEND="
  >=x11-libs/gtk+-2.24.30:2
  >=x11-libs/gtk+-3.20.1:3
  >=x11-libs/gdk-pixbuf-2.24.30
  >=x11-themes/gtk-engines-murrine-0.98.2
  >=x11-themes/gnome-themes-standard-3.14
"

src_prepare() {
  eautoreconf
  gnome2_src_prepare
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
	$(use_enable mate) \
	$(use_enable openbox) \
	$(use_enable parallel)
}

src_compile(){
	emake DESTDIR="${D}" || die
}

src_install(){
	emake DESTDIR="${D}" install || die
}
