Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8cWr3xy1zDqBP
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 11:47:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iEnq9GnD; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id g132so3471723pfb.3
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 18:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WL8K4LV1pbggpWtf0zQ9S0YLkDkRUncyike1mno+vOk=;
 b=iEnq9GnDB/mvr4yNYBaN1eNkiWprupE3MiNlIb0OguZ3Kc/FHg4W9CSN6zHraqXoB7
 Kxiz8hnQWdwLUbUBDSCklHgHFNegslboZRUnvPnH7EXZXX/QVVvVmNJsszNghC9Xc8bl
 OqdkmwxTIPqHsL2db5SVldf7jCDBrnHLD8W/dvzNeX0VLlYD8pLD389jptYuhTvozpKZ
 0INmj1DiUTXlWV7BhmBu80Gu2Xo1XslFE0faTODJSFbLV20lkOIz0t4a8yt7IIQN2a7I
 NMdIP3PuabEt10Kcsxb8BxJpBvNDfD0CpcaDUVSBk1XWH2fynYDeTulWCzl+o+syotR3
 4NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WL8K4LV1pbggpWtf0zQ9S0YLkDkRUncyike1mno+vOk=;
 b=cLeHf79OKQZWhUQXAvbKP4t1Ngal0P25Ux57CwjY6DoO36yXpsH13D165COuXSphD9
 hEdRKzqGWZF3CaMo+OeIDd6At4en8spENJhT/Y+BVGWvl8Y0nRvULKZY+7j9LgAZLEDy
 xb/P+T8HmkBCkZD8HjQ9Qx0o7pjrw1IjrxaHeYHft+YobbGm/2LKGh8pPHvKXSdx99v0
 5CzoRc9FviNLw2L2wASHKwy68xQlxPLxIHdcZhFBSoLQs0io17ZkQoWBZsxM22yGQ/wY
 RlhUex67OoluP38nngK4ViQmZqWgJ+Io1W5zFsaM1P6ohy9cLCMP1P/eHY3ZNk3XB/5c
 RuuA==
X-Gm-Message-State: AOPr4FUnQSoTWzTOIDAk9uNx0gDqvYZIshAHvLVxDjU4sFmvX9BORhHR9DLvpYMW9KPZ6A==
X-Received: by 10.98.3.135 with SMTP id 129mr6729411pfd.42.1463536038793;
 Tue, 17 May 2016 18:47:18 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y2sm7595909pfi.39.2016.05.17.18.47.16
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 17 May 2016 18:47:18 -0700 (PDT)
Date: Wed, 18 May 2016 11:47:10 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Add pflash to SDK
Message-ID: <20160518114710.15ba0fac@camb691>
In-Reply-To: <E341EB3A-EC7A-4246-A5BA-0D95371F127D@fuzziesquirrel.com>
References: <1463495436-27711-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463495436-27711-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160518113020.21dd30af@camb691>
 <E341EB3A-EC7A-4246-A5BA-0D95371F127D@fuzziesquirrel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 01:47:21 -0000

On Tue, 17 May 2016 21:32:41 -0400
Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

> Thanks for the review Cyril.
>=20
> > On May 17, 2016, at 9:30 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> >=20
> > On Tue, 17 May 2016 09:30:36 -0500
> > OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
> >=20
> >> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >>=20
> >> Make use of the skiboot external/shared support for dynamic so/bin.
> >> This allows us to completely remove pflash from skeleton.
> >>=20
> >=20
> > Hey Brad, this looks great!
> >=20
> > This is a pet hate of mine, getting roped into extra work - so I'm tota=
lly
> > prepared to do it but we should consider upstreaming the pflash patch. =
I'm not
> > sure it can be upstreamed as is but the end product is definitely right=
 for
> > upstream.
> >=20
>=20
> Actually I submitted this upstream also:  https://patchwork.ozlabs.org/pa=
tch/623309/ <https://patchwork.ozlabs.org/patch/623309/>
>=20

*falls of chair* You did too. Perfect!

> Let me know if it needs any work=E2=80=A6.
>=20
> > Do you or does anyone have any thoughts as to how to integrate into ups=
tream?
> > `make shared` target just as an idea off the top of my head.
> >=20
> >> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >=20
> > Reviewed-by: Cyril Bur <cyrilbur@gmail.com>
> >=20
> >> ---
> >> .../common/recipes-bsp/pflash/pflash.bb            |   8 +-
> >> .../pflash/pflash/0001-pflash-Build-solib.patch    | 119 +++++++++++++=
++++++++
> >> .../common/recipes-phosphor/skeleton/skeleton.bb   |   7 +-
> >> 3 files changed, 127 insertions(+), 7 deletions(-)
> >> create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes=
-bsp/pflash/pflash/0001-pflash-Build-solib.patch
> >>=20
> >> diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/p=
flash/pflash.bb b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/p=
flash/pflash.bb
> >> index 5c0cfa4..862f4fb 100644
> >> --- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/p=
flash.bb
> >> +++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/p=
flash.bb
> >> @@ -8,15 +8,19 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENCE;md5=3D3b83=
ef96387f14655fc854ddc3c6bd57"
> >>=20
> >> SRCREV =3D "skiboot-5.2.1"
> >> PV =3D "5.2.1"
> >> +SRC_URI +=3D "file://0001-pflash-Build-solib.patch"
> >>=20
> >> S =3D "${WORKDIR}/git"
> >>=20
> >> EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} PFLASH_VERSION=3D${=
PV} V=3D1'
> >> +CFLAGS_append =3D ' -fPIC'
> >>=20
> >> do_compile () {
> >> -        oe_runmake -C external/pflash all
> >> +        oe_runmake -C external/shared all
> >> }
> >>=20
> >> do_install () {
> >> -        oe_runmake -C external/pflash install DESTDIR=3D${D}
> >> +        oe_runmake -C external/shared install DESTDIR=3D${D}
> >> }
> >> +
> >> +BBCLASSEXTEND =3D "nativesdk"
> >> diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/p=
flash/pflash/0001-pflash-Build-solib.patch b/meta-openbmc-machines/meta-ope=
npower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch
> >> new file mode 100644
> >> index 0000000..59f2ebc
> >> --- /dev/null
> >> +++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/p=
flash/0001-pflash-Build-solib.patch
> >> @@ -0,0 +1,119 @@
> >> +diff --git a/external/pflash/rules.mk b/external/pflash/rules.mk
> >> +index aa426b5..c0199e3 100644
> >> +--- a/external/pflash/rules.mk
> >> ++++ b/external/pflash/rules.mk
> >> +@@ -1,12 +1,12 @@
> >> + .DEFAULT_GOAL :=3D all
> >> +=20
> >> + override CFLAGS  +=3D -O2 -Wall -I.
> >> +-OBJS    =3D pflash.o progress.o version.o
> >> ++PFLASH_OBJS    =3D pflash.o progress.o version.o common-arch_flash.o
> >> + LIBFLASH_FILES :=3D libflash.c libffs.c ecc.c blocklevel.c file.c
> >> + LIBFLASH_OBJS :=3D $(addprefix libflash-, $(LIBFLASH_FILES:.c=3D.o))
> >> + LIBFLASH_SRC :=3D $(addprefix libflash/,$(LIBFLASH_FILES))
> >> ++OBJS	+=3D $(PFLASH_OBJS)
> >> + OBJS	+=3D $(LIBFLASH_OBJS)
> >> +-OBJS	+=3D common-arch_flash.o
> >> + EXE     =3D pflash
> >> +=20
> >> + PFLASH_VERSION ?=3D $(shell ../../make_version.sh $(EXE))
> >> +diff --git a/external/shared/.gitignore b/external/shared/.gitignore
> >> +new file mode 100644
> >> +index 0000000..541d2a2
> >> +--- /dev/null
> >> ++++ b/external/shared/.gitignore
> >> +@@ -0,0 +1,2 @@
> >> ++pflash-dynamic
> >> ++libflash.so*
> >> +diff --git a/external/shared/Makefile b/external/shared/Makefile
> >> +index 4c31657..aa1d881 100644
> >> +--- a/external/shared/Makefile
> >> ++++ b/external/shared/Makefile
> >> +@@ -1,56 +1,44 @@
> >> +-.DEFAULT_GOAL :=3D all
> >> + GET_ARCH =3D ../../external/common/get_arch.sh
> >> ++include ../../external/pflash/rules.mk
> >> + include ../../external/common/rules.mk
> >> +=20
> >> +-PREFIX ?=3D /usr/local/
> >> +-LIBDIR =3D $(PREFIX)/lib
> >> +-INCDIR =3D $(PREFIX)/include/libflash
> >> ++libdir=3D/usr/lib
> >> ++incdir=3D/usr/include
> >> ++sbindir=3D/usr/sbin
> >> +=20
> >> +-VERSION =3D $(shell ../../make_version.sh)
> >> ++PFLASH_DIR=3D../pflash/
> >> ++EXE=3Dpflash-dynamic
> >> ++LIB=3Dlibflash.so
> >> ++SONAME=3D$(LIB).1
> >> ++VERSION =3D $(shell ../../make_version.sh "$(SONAME)")
> >> ++OBJS=3D$(addprefix $(PFLASH_DIR), $(LIBFLASH_OBJS))
> >> ++OBJS+=3D$(addprefix $(PFLASH_DIR), $(ARCH_OBJS))
> >> ++DYN_OBJS=3D$(addprefix $(PFLASH_DIR), $(PFLASH_OBJS))
> >> +=20
> >> +-CFLAGS +=3D -m64 -Werror -Wall -g2 -ggdb -I. -fPIC
> >> ++LIBFLASH_HEADERS=3Dlibffs.h libflash.h blocklevel.h errors.h ffs.h
> >> ++ARCHFLASH_HEADERS=3Darch_flash.h io.h
> >> +=20
> >> +-.PHONY: links
> >> +-links: libflash ccan common
> >> ++all: $(EXE)
> >> +=20
> >> +-libflash:
> >> +-	ln -sf ../../libflash .
> >> ++$(LIB):
> >> ++	$(MAKE) -C $(PFLASH_DIR)
> >> ++	$(Q_CC)$(CC) -shared -fPIC -Wl,-soname,$(SONAME) $(OBJS) -o $(VERSI=
ON)
> >> +=20
> >> +-common:
> >> +-	ln -sf ../common .
> >> ++$(EXE): $(LIB)
> >> ++	$(Q_CC)$(CC) $(CFLAGS) $(DYN_OBJS) $(VERSION) -lrt -o $(EXE)
> >> +=20
> >> +-ccan:
> >> +-	ln -sf ../../ccan .
> >> ++install: install-bins install-headers
> >> +=20
> >> +-LIBFLASH_OBJS =3D libflash-file.o libflash-libflash.o libflash-libff=
s.o libflash-ecc.o libflash-blocklevel.o
> >> +-ARCHFLASH_OBJS =3D common-arch_flash.o
> >> +-OBJS =3D $(LIBFLASH_OBJS) $(ARCHFLASH_OBJS)
> >> ++install-headers:
> >> ++	$(Q_MKDIR)mkdir -p $(DESTDIR)$(incdir)/libflash $(DESTDIR)$(incdir)=
/common
> >> ++	install -m644 $(addprefix $(PFLASH_DIR)libflash/, $(LIBFLASH_HEADER=
S)) $(DESTDIR)$(incdir)/libflash
> >> ++	install -m644 $(addprefix $(PFLASH_DIR)common/, $(ARCHFLASH_HEADERS=
)) $(DESTDIR)$(incdir)/common
> >> +=20
> >> +-LIBFLASH_H =3D libflash/file.h libflash/libflash.h libflash/libffs.h=
 libflash/ffs.h libflash/ecc.h libflash/blocklevel.h libflash/errors.h
> >> +-ARCHFLASH_H =3D common/arch_flash.h
> >> +-
> >> +-$(LIBFLASH_OBJS) : libflash-%.o : libflash/%.c
> >> +-	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
> >> ++install-bins: all
> >> ++	install -D $(EXE) $(DESTDIR)$(sbindir)/pflash
> >> ++	install -D $(VERSION) $(DESTDIR)$(libdir)/$(VERSION)
> >> ++	$(Q_LN)ln -sf $(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
> >> ++	$(Q_LN)ln -sf $(VERSION) $(DESTDIR)$(libdir)/$(LIB)
> >> +=20
> >> + clean:
> >> +-	rm -f $(OBJS) common-*.o *.so*
> >> +-
> >> +-distclean: clean
> >> +-	rm -f ccan libflash common
> >> +-
> >> +-all: links arch_links $(OBJS)
> >> +-	$(CC) -shared -Wl,-soname,libflash.so -o libflash.so.$(VERSION) $(O=
BJS)
> >> +-
> >> +-install-lib: all
> >> +-	install -D -m 0755 libflash.so.$(VERSION) $(LIBDIR)/libflash.so.$(V=
ERSION)
> >> +-	ln -sf libflash.so.$(VERSION) $(LIBDIR)/libflash.so
> >> +-
> >> +-install-dev: links arch_links
> >> +-	mkdir -p $(INCDIR)
> >> +-	install -m 0644 $(LIBFLASH_H) $(ARCHFLASH_H) $(INCDIR)
> >> +-
> >> +-install: install-lib install-dev
> >> +-
> >> +-uninstall:
> >> +-	rm -f $(LIBDIR)/libflash*
> >> +-	rm -rf $(INCDIR)
> >> ++	rm -rf $(LIB).* $(EXE)
> >> diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.b=
b b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> >> index 1553314..8a11ee1 100644
> >> --- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> >> +++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> >> @@ -16,9 +16,9 @@ DEPENDS +=3D "glib-2.0 systemd"
> >> RDEPENDS_${PN} +=3D "python-subprocess python-compression libsystemd"
> >> SRC_URI +=3D "git://github.com/openbmc/skeleton"
> >>=20
> >> -# RDEPEND on pflash if the openpower-pflash machine feature is set.
> >> +# DEPEND/RDEPEND on pflash if the openpower-pflash machine feature is=
 set.
> >> PACKAGECONFIG ??=3D "${@bb.utils.contains('MACHINE_FEATURES', 'openpow=
er-pflash', 'openpower-pflash', '', d)}"
> >> -PACKAGECONFIG[openpower-pflash] =3D ",,,pflash"
> >> +PACKAGECONFIG[openpower-pflash] =3D ",,pflash,pflash"
> >>=20
> >> SRCREV =3D "264009617c231447d6c8fc61264cf3c6ea7f49d5"
> >>=20
> >> @@ -26,9 +26,6 @@ S =3D "${WORKDIR}"
> >>=20
> >> do_compile() {
> >>         oe_runmake -C git
> >> -
> >> -        # Remove deprecated files.
> >> -        rm ${S}/git/bin/pflash
> >> }
> >>=20
> >> do_install() {
