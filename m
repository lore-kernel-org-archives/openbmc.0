Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qdZkb3ydhzDqD5
 for <openbmc@lists.ozlabs.org>; Mon,  4 Apr 2016 11:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=oa4y/tIH; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id ABF2D33406F;
 Sun,  3 Apr 2016 18:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=1xuLqFze3Jj0/68TF0nQh
 mI0VzM=; b=oa4y/tIHMKPe73v32AkoMSt8fLu/CcHNPerzbUdqWpRS983RmpiIf
 3RiOeNfZLjF4jOKodx85/Q+zSrRqP8bzlhg68efZlzHZSSjVsLMkjB7TA1IY1HZ3
 S+zo8SiBqJmA+q3/JyOmbQaPdKunXHO9otyCXt+VRKAaoLhEmWqd6w=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 7B03B33406C;
 Sun,  3 Apr 2016 18:52:51 -0700 (PDT)
Message-ID: <1459734763.3978.29.camel@aj.id.au>
Subject: Re: [PATCH openbmc] Update to yocto 2.0.1
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 04 Apr 2016 11:22:43 +0930
In-Reply-To: <1459475158.3978.14.camel@aj.id.au>
References: <1459459235-16287-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459475158.3978.14.camel@aj.id.au>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-SBQ0K5JAEji1eE87gqPR"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2016 01:52:57 -0000


--=-SBQ0K5JAEji1eE87gqPR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-04-01 at 12:15 +1030, Andrew Jeffery wrote:
> On Thu, 2016-03-31 at 16:20 -0500, OpenBMC Patches wrote:
> >=20
> >=20
> > This change is [https://reviewable.io/review_button.svg"
> > height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](
> > https://reviewable.io/reviews/openbmc/openbmc/217)
> >=20
> >=20
> >=20
> > https://github.com/openbmc/openbmc/pull/217
> >=20
> > Patrick Williams (1):
> >   Squashed 'yocto-poky/' changes from 7b86c77..c8a4ed9
>=20
> I verified this was the only action taken with the following two steps:
>=20
>     2     andrew@keelia    :~/src/poky$ git diff 7b86c77..c8a4ed9 | git p=
atch-id
>     59c5d457a3a9c9358340f58111c0a3fb617b25c6 0000000000000000000000000000=
000000000000
>=20
>     2     andrew@keelia    :~/src/openbmc/openbmc$ git show f1e5d6968976c=
2341c6d554bfcc8895f1b33c26b | git patch-id
>     59c5d457a3a9c9358340f58111c0a3fb617b25c6 f1e5d6968976c2341c6d554bfcc8=
895f1b33c26b
>=20
> This shows that no modifications were made that weren't from upstream
> (i.e. no conflict resolutions or sneaky changes). I also verified that
> c8a4ed9 corresponds to the tag yocto-2.0.1: a nit-pick suggestion would
> be to use the tag name in the range spec instead of the commit id (i.e.
> 7b86c77..yocto-2.0.1). I don't know how it came about that we based
> development off of 7b86c77 (it's not a tag), but `git merge-base`
> suggests that the 2.0.1 directly follows from it and `git branch -r -
> -contains 7b86c77` shows that upstream master contains it, so
> presumably it was the tip of master at some point?
>=20
> Anyway, I've build tested it from scratch after merging my qemu
> changes. The build completed successfully but it produced qemu-2.4.0
> rather than a build from the qemu_git.bb I've introduced. Tracking that
> down now, but otherwise, to me, this looks good so far. Once I've boot
> -tested it I'll send a reviewed-by.

Given the nature of the change, I've tested by booting the images in
palmetto-bmc qemu machine and running Manjunath's automated test suite
against the instance. The failures I saw were the same before and after
the yocto update was applied, so given that:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Andrew Jeffery <andrew@aj.id.au>

Cheers,

Andrew

>=20
> Cheers,
>=20
> Andrew
>=20
> >  bitbake/bin/bitbake                                |    2 +-
> >  bitbake/bin/bitbake-worker                         |    9 +
> >  bitbake/bin/toaster                                |  102 +-
> >  .../bitbake-user-manual-ref-variables.xml          |   59 +
> >  bitbake/lib/bb/__init__.py                         |    2 +-
> >  bitbake/lib/bb/build.py                            |    7 +
> >  bitbake/lib/bb/command.py                          |   10 +
> >  bitbake/lib/bb/cooker.py                           |   32 +-
> >  bitbake/lib/bb/cookerdata.py                       |    6 +-
> >  bitbake/lib/bb/fetch2/__init__.py                  |    2 +-
> >  bitbake/lib/bb/fetch2/hg.py                        |    1 +
> >  bitbake/lib/bb/fetch2/svn.py                       |    9 +-
> >  bitbake/lib/bb/main.py                             |    7 +
> >  bitbake/lib/bb/runqueue.py                         |    9 +
> >  bitbake/lib/bb/siggen.py                           |   10 +-
> >  bitbake/lib/bb/taskdata.py                         |   12 +
> >  bitbake/lib/bb/tests/utils.py                      |  203 ++
> >  bitbake/lib/bb/tinfoil.py                          |    9 +-
> >  bitbake/lib/bb/ui/buildinfohelper.py               |  229 ++-
> >  bitbake/lib/bb/ui/knotty.py                        |    2 +-
> >  bitbake/lib/bb/ui/toasterui.py                     |  127 +-
> >  bitbake/lib/bb/utils.py                            |  105 +-
> >  bitbake/lib/prserv/db.py                           |    2 +-
> >  bitbake/lib/prserv/serv.py                         |   38 +-
> >  .../toaster/bldcontrol/localhostbecontroller.py    |   97 +-
> >  .../management/commands/checksettings.py           |  138 +-
> >  .../bldcontrol/management/commands/runbuilds.py    |   15 +-
> >  .../0009_auto__add_field_brlayer_layer_version.py  |  180 ++
> >  bitbake/lib/toaster/bldcontrol/models.py           |   37 +-
> >  .../tts/toasteruitest/toaster_automation_test.py   |  275 ++-
> >  .../contrib/tts/toasteruitest/toaster_test.cfg     |    6 +-
> >  ...e__add_unique_customimagerecipe_name_project.py |  375 ++++
> >  .../0028_auto__chg_field_logmessage_message.py     |  345 ++++
> >  bitbake/lib/toaster/orm/models.py                  |  155 +-
> >  bitbake/lib/toaster/orm/tests.py                   |   53 +-
> >  .../lib/toaster/toastergui/static/css/default.css  |    9 +
> >  bitbake/lib/toaster/toastergui/static/js/base.js   |   18 +-
> >  .../toaster/toastergui/static/js/customrecipe.js   |   50 +
> >  .../toaster/toastergui/static/js/importlayer.js    |   13 +-
> >  .../toastergui/static/js/jquery.treetable.js       |    2 +-
> >  .../lib/toaster/toastergui/static/js/layerBtn.js   |   18 +-
> >  .../toaster/toastergui/static/js/layerdetails.js   |   32 +-
> >  .../toaster/toastergui/static/js/newcustomimage.js |   49 +
> >  .../toaster/toastergui/static/js/projectpage.js    |   31 +-
> >  bitbake/lib/toaster/toastergui/static/js/table.js  |   16 +-
> >  .../lib/toaster/toastergui/static/js/tests/test.js |   34 +-
> >  bitbake/lib/toaster/toastergui/tables.py           |  247 ++-
> >  bitbake/lib/toaster/toastergui/templates/base.html |  118 +-
> >  .../toastergui/templates/baseprojectpage.html      |   10 +-
> >  .../lib/toaster/toastergui/templates/bpackage.html |    1 +
> >  .../toastergui/templates/builddashboard.html       |   52 +-
> >  .../lib/toaster/toastergui/templates/builds.html   |   32 +-
> >  .../toastergui/templates/configuration.html        |    1 +
> >  .../toaster/toastergui/templates/configvars.html   |    1 +
> >  .../toastergui/templates/customise_btn.html        |    9 +
> >  .../toaster/toastergui/templates/customrecipe.html |  142 ++
> >  .../lib/toaster/toastergui/templates/dirinfo.html  |   19 +-
> >  .../toaster/toastergui/templates/importlayer.html  |    1 +
> >  .../toastergui/templates/js-unit-tests.html        |   16 +-
> >  .../lib/toaster/toastergui/templates/landing.html  |  104 +-
> >  .../toastergui/templates/landing_not_managed.html  |    2 +
> >  .../toaster/toastergui/templates/layer_btn.html    |   12 +-
> >  .../toaster/toastergui/templates/layerdetails.html |    1 +
> >  .../toaster/toastergui/templates/mrb_section.html  |  105 +-
> >  .../toastergui/templates/newcustomimage.html       |   54 +
> >  .../toaster/toastergui/templates/newproject.html   |    3 +
> >  .../toastergui/templates/package_detail_base.html  |   11 +-
> >  .../templates/package_included_dependencies.html   |    4 +-
> >  .../templates/package_included_detail.html         |    4 +-
> >  .../package_included_reverse_dependencies.html     |    4 +-
> >  .../toastergui/templates/pkg_add_rm_btn.html       |   16 +
> >  .../lib/toaster/toastergui/templates/project.html  |    3 +-
> >  .../toastergui/templates/projectbuilds.html        |   24 +-
> >  .../toaster/toastergui/templates/projectconf.html  |   23 +-
> >  .../lib/toaster/toastergui/templates/projects.html |   25 +-
> >  .../toastergui/templates/projecttopbar.html        |   75 +-
> >  .../lib/toaster/toastergui/templates/recipe.html   |    1 +
> >  .../toaster/toastergui/templates/recipe_btn.html   |   12 +-
> >  .../lib/toaster/toastergui/templates/recipes.html  |    1 +
> >  .../lib/toaster/toastergui/templates/target.html   |    1 +
> >  bitbake/lib/toaster/toastergui/templates/task.html |    1 +
> >  .../lib/toaster/toastergui/templates/tasks.html    |   15 +-
> >  .../toaster/toastergui/templates/toastertable.html |    1 -
> >  .../toastergui/templates/unavailable_artifact.html |    2 +
> >  .../toastergui/templatetags/project_url_tag.py     |   34 +
> >  bitbake/lib/toaster/toastergui/tests.py            |  614 +++++-
> >  bitbake/lib/toaster/toastergui/typeaheads.py       |    9 +-
> >  bitbake/lib/toaster/toastergui/urls.py             |   49 +-
> >  bitbake/lib/toaster/toastergui/views.py            |  327 ++-
> >  bitbake/lib/toaster/toastergui/widgets.py          |   56 +-
> >  bitbake/lib/toaster/toastermain/settings.py        |   11 +-
> >  bitbake/lib/toaster/toastermain/urls.py            |    2 +-
> >  bitbake/toaster-requirements.txt                   |    1 -
> >  documentation/Makefile                             |    2 +-
> >  documentation/adt-manual/adt-manual.xml            |    4 +-
> >  documentation/adt-manual/adt-package.xml           |    2 +-
> >  documentation/adt-manual/adt-prepare.xml           |   15 +
> >  documentation/bsp-guide/bsp-guide.xml              |    6 +-
> >  .../dev-manual/dev-manual-common-tasks.xml         |  139 +-
> >  documentation/dev-manual/dev-manual-model.xml      |   44 +-
> >  documentation/dev-manual/dev-manual-qemu.xml       |   24 +-
> >  documentation/dev-manual/dev-manual.xml            |    6 +-
> >  documentation/kernel-dev/kernel-dev-common.xml     |    4 +
> >  documentation/kernel-dev/kernel-dev.xml            |    4 +-
> >  documentation/mega-manual/figures/add-variable.png |  Bin 0 ->
> > 110712 bytes
> >  documentation/mega-manual/figures/bash-oecore.png  |  Bin 0 ->
> > 138198 bytes
> >  documentation/mega-manual/figures/set-variable.png |  Bin 0 ->
> > 111430 bytes
> >  .../mega-manual/figures/variable-added.png         |  Bin 0 ->
> > 112163 bytes
> >  documentation/mega-manual/mega-manual.xml          |    6 +-
> >  documentation/poky.ent                             |   11 +-
> >  documentation/profile-manual/profile-manual.xml    |    4 +-
> >  documentation/ref-manual/closer-look.xml           |    2 +-
> >  documentation/ref-manual/introduction.xml          |   71 +-
> >  documentation/ref-manual/migration.xml             |  435 +++-
> >  documentation/ref-manual/ref-classes.xml           |  378 +++-
> >  documentation/ref-manual/ref-manual.xml            |    4 +-
> >  documentation/ref-manual/ref-tasks.xml             |   17 +
> >  documentation/ref-manual/ref-variables.xml         |  429 +++-
> >  .../toaster-manual/figures/add-variable.png        |  Bin 0 ->
> > 110712 bytes
> >  .../toaster-manual/figures/bash-oecore.png         |  Bin 0 ->
> > 138198 bytes
> >  .../toaster-manual/figures/set-variable.png        |  Bin 0 ->
> > 111430 bytes
> >  .../toaster-manual/figures/variable-added.png      |  Bin 0 ->
> > 112163 bytes
> >  .../toaster-manual/toaster-manual-intro.xml        |    4 +-
> >  .../toaster-manual/toaster-manual-reference.xml    |  211 +-
> >  .../toaster-manual-setup-and-use.xml               |  649 +++++-
> >  .../toaster-manual/toaster-manual-start.xml        |   36 +-
> >  documentation/toaster-manual/toaster-manual.xml    |    6 +-
> >  documentation/tools/mega-manual.sed                |   40 +-
> >  .../yocto-project-qs/yocto-project-qs.xml          |    2 +-
> >  meta-selftest/conf/machine/qemux86copy.conf        |    3 +
> >  meta-selftest/lib/devtool/__init__.py              |    0
> >  meta-selftest/lib/devtool/test.py                  |   11 +
> >  meta-selftest/recipes-test/error/error.bb          |   11 +
> >  meta-selftest/recipes-test/images/error-image.bb   |    8 +
> >  .../recipes-test/images/test-empty-image.bb        |    6 +
> >  .../recipes-test/images/wic-image-minimal.bb       |    4 +
> >  .../recipes-test/images/wic-image-minimal.wks      |    6 +-
> >  .../recipes-kernel/linux/linux-yocto-custom.bb     |   15 +-
> >  .../0001-linux-version-tweak.patch                 |   21 +-
> >  meta-yocto-bsp/conf/machine/beaglebone.conf        |    2 +-
> >  meta-yocto-bsp/conf/machine/edgerouter.conf        |    2 +-
> >  .../conf/machine/include/genericx86-common.inc     |    2 +-
> >  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    2 +-
> >  meta-yocto-bsp/lib/oeqa/yoctobsp.py                |   39 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    4 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   16 +-
> >  meta-yocto/conf/distro/poky.conf                   |    7 +-
> >  meta-yocto/conf/local.conf.sample                  |    4 +-
> >  meta-yocto/conf/local.conf.sample.extended         |    9 +
> >  meta-yocto/conf/toasterconf.json                   |   32 +-
> >  meta/classes/allarch.bbclass                       |    4 +
> >  meta/classes/archiver.bbclass                      |   62 +-
> >  meta/classes/autotools.bbclass                     |   45 +-
> >  meta/classes/base.bbclass                          |    6 +-
> >  meta/classes/buildhistory.bbclass                  |    2 +-
> >  meta/classes/cpan-base.bbclass                     |    4 +
> >  meta/classes/cpan.bbclass                          |    2 +-
> >  meta/classes/cpan_build.bbclass                    |   23 +-
> >  meta/classes/cross-canadian.bbclass                |    2 +-
> >  meta/classes/deploy.bbclass                        |    1 +
> >  meta/classes/distrodata.bbclass                    |   20 +-
> >  meta/classes/distutils3.bbclass                    |    4 +
> >  meta/classes/externalsrc.bbclass                   |    5 +-
> >  meta/classes/fontcache.bbclass                     |   19 +-
> >  meta/classes/grub-efi.bbclass                      |    3 +-
> >  meta/classes/gtk-icon-cache.bbclass                |   12 +-
> >  meta/classes/gummiboot.bbclass                     |    3 +-
> >  meta/classes/image-live.bbclass                    |    2 +-
> >  meta/classes/image-mklibs.bbclass                  |    2 +-
> >  meta/classes/image-vm.bbclass                      |    3 +-
> >  meta/classes/image.bbclass                         |   37 +-
> >  meta/classes/image_types.bbclass                   |   27 +-
> >  meta/classes/insane.bbclass                        |   17 +-
> >  meta/classes/kernel-arch.bbclass                   |    7 +-
> >  meta/classes/kernel-yocto.bbclass                  |   17 +-
> >  meta/classes/kernel.bbclass                        |   17 +-
> >  meta/classes/libc-package.bbclass                  |    4 +-
> >  meta/classes/license.bbclass                       |    1 +
> >  meta/classes/metadata_scm.bbclass                  |   23 +-
> >  meta/classes/multilib.bbclass                      |    5 +-
> >  meta/classes/multilib_global.bbclass               |   28 +-
> >  meta/classes/package.bbclass                       |    4 +-
> >  meta/classes/pixbufcache.bbclass                   |    4 +-
> >  meta/classes/populate_sdk_base.bbclass             |   12 +-
> >  meta/classes/populate_sdk_ext.bbclass              |   54 +-
> >  meta/classes/prserv.bbclass                        |    2 -
> >  meta/classes/ptest.bbclass                         |   10 +-
> >  meta/classes/report-error.bbclass                  |   11 +-
> >  meta/classes/sanity.bbclass                        |   11 +-
> >  meta/classes/sign_package_feed.bbclass             |   31 +
> >  meta/classes/sign_rpm.bbclass                      |   48 +-
> >  meta/classes/sstate.bbclass                        |   30 +-
> >  meta/classes/testimage.bbclass                     |   56 +-
> >  meta/classes/toolchain-scripts.bbclass             |    1 +
> >  meta/classes/uninative.bbclass                     |    2 +-
> >  meta/classes/useradd-staticids.bbclass             |   16 +-
> >  meta/classes/useradd_base.bbclass                  |    6 +-
> >  meta/conf/bitbake.conf                             |    5 +-
> >  meta/conf/distro/include/default-distrovars.inc    |    3 +
> >  meta/conf/distro/include/distro_alias.inc          |   10 +
> >  meta/conf/documentation.conf                       |    2 +
> >  meta/conf/layer.conf                               |    5 +-
> >  meta/conf/machine/include/qemu.inc                 |    2 +-
> >  meta/conf/machine/include/tune-thunderx.inc        |   19 +
> >  meta/conf/machine/qemux86-64.conf                  |    2 +-
> >  meta/conf/machine/qemux86.conf                     |    2 +-
> >  meta/conf/multilib.conf                            |    3 +-
> >  meta/files/common-licenses/GFDL-1.1                |  206 +-
> >  meta/files/ext-sdk-prepare.sh                      |   20 +
> >  meta/files/toolchain-shar-extract.sh               |   30 +-
> >  meta/files/toolchain-shar-relocate.sh              |   24 +-
> >  meta/lib/oe/copy_buildsystem.py                    |    5 +-
> >  meta/lib/oe/distro_check.py                        |  108 +-
> >  meta/lib/oe/image.py                               |   62 +-
> >  meta/lib/oe/package_manager.py                     |  137 +-
> >  meta/lib/oe/patch.py                               |   12 +-
> >  meta/lib/oe/recipeutils.py                         |   94 +-
> >  meta/lib/oe/rootfs.py                              |    8 +-
> >  meta/lib/oe/sdk.py                                 |   76 +-
> >  meta/lib/oe/sstatesig.py                           |   20 +
> >  meta/lib/oeqa/oetest.py                            |   70 +-
> >  meta/lib/oeqa/runexported.py                       |   42 +-
> >  meta/lib/oeqa/runtime/_ptest.py                    |    2 +-
> >  meta/lib/oeqa/runtime/connman.py                   |   23 -
> >  meta/lib/oeqa/runtime/date.py                      |    4 +-
> >  meta/lib/oeqa/runtime/files/testsdkmakefile        |    5 +
> >  meta/lib/oeqa/runtime/kernelmodule.py              |    4 +-
> >  meta/lib/oeqa/runtime/parselogs.py                 |   13 +-
> >  meta/lib/oeqa/runtime/scanelf.py                   |    2 +-
> >  meta/lib/oeqa/sdk/gcc.py                           |    6 +-
> >  meta/lib/oeqa/selftest/archiver.py                 |   50 +
> >  meta/lib/oeqa/selftest/base.py                     |    2 +-
> >  meta/lib/oeqa/selftest/bbtests.py                  |   60 +-
> >  meta/lib/oeqa/selftest/buildoptions.py             |   11 +-
> >  meta/lib/oeqa/selftest/devtool.py                  |  405 ++--
> >  meta/lib/oeqa/selftest/imagefeatures.py            |   16 +-
> >  meta/lib/oeqa/selftest/layerappend.py              |    9 +-
> >  meta/lib/oeqa/selftest/manifest.py                 |  165 ++
> >  meta/lib/oeqa/selftest/recipetool.py               |   11 +
> >  meta/lib/oeqa/selftest/sstatetests.py              |   73 +-
> >  meta/lib/oeqa/selftest/wic.py                      |   94 +-
> >  meta/lib/oeqa/utils/decorators.py                  |   35 +-
> >  meta/lib/oeqa/utils/dump.py                        |   15 +-
> >  meta/lib/oeqa/utils/ftools.py                      |   20 +-
> >  meta/lib/oeqa/utils/qemurunner.py                  |   28 +-
> >  .../gnu-efi/gnu-efi/gcc46-compatibility.patch      |   21 +
> >  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb          |    1 +
> >  meta/recipes-bsp/grub/files/CVE-2015-8370.patch    |   59 +
> >  meta/recipes-bsp/grub/grub2.inc                    |    1 +
> >  ...-C-syntax-errors-for-function-declaration.patch |   74 +
> >  meta/recipes-bsp/gummiboot/gummiboot_git.bb        |    3 +
> >  ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch |   36 +
> >  meta/recipes-bsp/hostap/hostap-utils.inc           |    4 +-
> >  meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |    3 +-
> >  .../0001-lib-dns-gen.c-fix-too-long-error.patch    |   34 +
> >  .../bind/bind/CVE-2015-8000.patch                  |  278 +++
> >  .../bind/bind/CVE-2015-8461.patch                  |   44 +
> >  .../bind/bind/CVE-2015-8704.patch                  |   28 +
> >  .../bind/bind/CVE-2015-8705.patch                  |   44 +
> >  meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |    5 +
> >  meta/recipes-connectivity/bluez5/bluez5.inc        |    5 +-
> >  .../bluez5/bluez5/bluetooth.conf                   |   17 -
> >  meta/recipes-connectivity/connman/connman-conf.bb  |    6 +-
> >  .../connman/connman-gnome_0.7.bb                   |    5 +-
> >  meta/recipes-connectivity/connman/connman.inc      |   12 +-
> >  ...acktrace-API-availability-before-using-it.patch |   55 +
> >  ...resolve-musl-does-not-implement-res_ninit.patch |   77 +
> >  .../0003-Fix-header-inclusions-for-musl.patch      |   85 +
> >  .../connman/add_xuser_dbus_permission.patch        |   21 -
> >  meta/recipes-connectivity/connman/connman/connman  |    4 +-
> >  meta/recipes-connectivity/connman/connman_1.30.bb  |    4 +-
> >  meta/recipes-connectivity/iproute2/iproute2.inc    |    6 +
> >  .../irda-utils/irda-utils_0.9.18.bb                |    2 +-
> >  .../openssh/openssh/CVE-2016-1907_2.patch          |   65 +
> >  .../openssh/openssh/CVE-2016-1907_3.patch          |  329 +++
> >  .../openssh/CVE-2016-1907_upstream_commit.patch    |   33 +
> >  .../openssh/openssh/sshd@.service                  |    4 +-
> >  .../openssh/openssh/sshdgenkeys.service            |   21 +-
> >  meta/recipes-connectivity/openssh/openssh_7.1p1.bb |  154 --
> >  meta/recipes-connectivity/openssh/openssh_7.1p2.bb |  157 ++
> >  meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
> >  .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |   66 +
> >  ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch |  101 +
> >  .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |   45 +
> >  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |   66 +
> >  .../openssl/openssl/CVE-2015-3197.patch            |   63 +
> >  .../openssl/openssl/CVE-2016-0701_1.patch          |  102 +
> >  .../openssl/openssl/CVE-2016-0701_2.patch          |  156 ++
> >  .../openssl/openssl/ptest_makefile_deps.patch      |  248 +++
> >  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   18 +
> >  .../socat/socat/CVE-2016-2217.patch                |  372 ++++
> >  meta/recipes-connectivity/socat/socat_1.7.3.0.bb   |    1 +
> >  meta/recipes-core/busybox/busybox.inc              |    3 +-
> >  .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   |  388 ++++
> >  ...-linking-instead-of-LD-and-use-CFLAGS-and.patch |  114 ++
> >  .../busybox/busybox/0001-randconfig-fix.patch      |   33 +
> >  .../busybox/0002-Passthrough-r-to-linker.patch     |   32 +
> >  meta/recipes-core/busybox/busybox_1.23.2.bb        |    4 +
> >  .../coreutils/coreutils-6.9/loadavg.patch          |   18 +
> >  meta/recipes-core/coreutils/coreutils_6.9.bb       |    2 +
> >  meta/recipes-core/coreutils/coreutils_8.24.bb      |    2 +-
> >  .../dropbear/dropbear/dropbear@.service            |    3 +-
> >  .../dropbear/dropbear/dropbearkey.service          |    9 +-
> >  .../glibc/cross-localedef-native_2.22.bb           |    5 +-
> >  meta/recipes-core/glibc/glibc-locale.inc           |    2 +-
> >  ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |   84 +
> >  meta/recipes-core/glibc/glibc/CVE-2015-7547.patch  |  642 ++++++
> >  meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 ++
> >  meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  123 ++
> >  meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 +++
> >  .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++++++++++
> >  .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  385 ++++
> >  ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 +++
> >  .../glibc/glibc/use_64bit_atomics.patch            |   24 +
> >  meta/recipes-core/glibc/glibc_2.22.bb              |   13 +-
> >  .../images/build-appliance-image_12.0.1.bb         |    4 +-
> >  .../initrdscripts/files/init-install-efi.sh        |    9 +-
> >  .../initrdscripts/initramfs-framework/finish       |    2 +-
> >  .../initrdscripts/initramfs-framework/init         |    2 +-
> >  .../initscripts/initscripts-1.0/sysfs.sh           |    4 +
> >  meta/recipes-core/kbd/kbd_2.0.2.bb                 |    1 +
> >  meta/recipes-core/libxml/libxml2.inc               |   16 +
> >  ...-2015-5312-Another-entity-expansion-issue.patch |   39 +
> >  ...97-Avoid-an-heap-buffer-overflow-in-xmlDi.patch |   40 +
> >  ...00-Fix-memory-access-error-due-to-incorre.patch |  131 ++
> >  ...2015-8035-Fix-XZ-compression-support-loop.patch |   38 +
> >  ...42-Buffer-overead-with-HTML-parser-in-pus.patch |   49 +
> >  ...n-name-parsing-at-the-end-of-current-inpu.patch |  138 ++
> >  ...ssing-entities-after-encoding-conversion-.patch |   89 +
> >  ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch |   88 +
> >  ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch |   43 +
> >  ...top-parsing-on-entities-boundaries-errors.patch |   39 +
> >  ...leanup-conditional-section-error-handling.patch |   56 +
> >  ...ror-in-previous-Conditional-section-patch.patch |   35 +
> >  ...iation-of-overflow-in-Conditional-section.patch |   39 +
> >  .../libxml/libxml2/CVE-2015-8241.patch             |   40 +
> >  ...ng-early-on-if-encoding-conversion-failed.patch |   42 +
> >  .../libxml/libxml2/CVE-2015-8710.patch             |   71 +
> >  meta/recipes-core/meta/meta-ide-support.bb         |    1 -
> >  .../meta/nativesdk-buildtools-perl-dummy.bb        |   13 +-
> >  meta/recipes-core/meta/signing-keys.bb             |   45 +
> >  meta/recipes-core/meta/uninative-tarball.bb        |    1 +
> >  meta/recipes-core/os-release/os-release.bb         |    5 +-
> >  .../packagegroup-core-standalone-sdk-target.bb     |    2 +
> >  .../readline-6.3/readline-cve-2014-2524.patch      |   43 +
> >  .../readline/readline-6.3/readline63-003           |   43 -
> >  meta/recipes-core/readline/readline_6.3.bb         |    2 +-
> >  .../systemd/0001-fix-build-on-uClibc-exp10.patch   |   22 +
> >  ...nv-when-secure-versions-are-not-available.patch |   39 +
> >  .../systemd/rules-whitelist-hd-devices.patch       |   32 +
> >  meta/recipes-core/systemd/systemd_225.bb           |   13 +-
> >  meta/recipes-core/uclibc/uclibc-git.inc            |    5 +
> >  ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch |   42 +
> >  ...zes-away-the-write-only-static-functions-.patch |   51 +
> >  .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    |   49 +
> >  .../uclibc/uclibc-git/CVE-2016-2224.patch          |   49 +
> >  .../uclibc/uclibc-git/CVE-2016-2225.patch          |   32 +
> >  meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
> >  meta/recipes-core/udev/udev.inc                    |    2 +
> >  meta/recipes-core/util-linux/util-linux.inc        |    6 +
> >  .../util-linux/util-linux/runuser-l.pamd           |    3 +
> >  .../util-linux/util-linux/runuser.pamd             |    4 +
> >  meta/recipes-core/util-linux/util-linux_2.26.2.bb  |    2 +
> >  .../binutils/binutils/binutils-octeon3.patch       |    2 +-
> >  .../build-compare/build-compare_git.bb             |    1 -
> >  meta/recipes-devtools/ccache/ccache_3.2.3.bb       |    4 +-
> >  .../0002-dev.mk.in-fix-file-name-too-long.patch    |   32 +
> >  .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch |   52 +
> >  meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |    1 +
> >  ...ate-hardlinks-with-the-correct-directory-.patch |   81 +
> >  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   16 +
> >  meta/recipes-devtools/file/file/host-file.patch    |   32 +
> >  meta/recipes-devtools/file/file_5.24.bb            |   10 +-
> >  meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
> >  ...-gcc-483-universal-initializer-no-warning.patch |  107 +
> >  meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
> >  ...-gcc-483-universal-initializer-no-warning.patch |  107 +
> >  meta/recipes-devtools/gcc/gcc-5.2.inc              |    3 +
> >  .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      |  123 ++
> >  meta/recipes-devtools/gcc/gcc-common.inc           |    5 +
> >  meta/recipes-devtools/gcc/gcc-configure-common.inc |    1 +
> >  meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
> >  meta/recipes-devtools/gcc/gcc-multilib-config.inc  |    3 +-
> >  meta/recipes-devtools/gcc/gcc-runtime.inc          |    3 +
> >  meta/recipes-devtools/gcc/gcc-shared-source.inc    |    2 +
> >  meta/recipes-devtools/gcc/gcc-target.inc           |   12 +-
> >  meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 +-
> >  meta/recipes-devtools/gcc/libgcc.inc               |    9 +-
> >  .../git/git-2.5.0/0008-CVE-2015-7545-1.patch       |  446 +++++
> >  .../git/git-2.5.0/0009-CVE-2015-7545-2.patch       |  112 ++
> >  .../git/git-2.5.0/0010-CVE-2015-7545-3.patch       |  112 ++
> >  .../git/git-2.5.0/0011-CVE-2015-7545-4.patch       |  150 ++
> >  .../git/git-2.5.0/0012-CVE-2015-7545-5.patch       |   69 +
> >  meta/recipes-devtools/git/git_2.5.0.bb             |    8 +
> >  meta/recipes-devtools/guile/guile_2.0.11.bb        |   16 +-
> >  meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb |    3 +-
> >  .../installer/adt-installer_1.0.bb                 |    1 -
> >  meta/recipes-devtools/libtool/libtool-2.4.6.inc    |    1 +
> >  ...1-libtool-Fix-support-for-NIOS2-processor.patch |   68 +
> >  meta/recipes-devtools/mmc/mmc-utils_git.bb         |    4 +-
> >  meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    5 +
> >  meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 +
> >  ...-include-stdio.h-for-getting-FILE-defined.patch |   45 +
> >  ...reate-opkg.lock-in-run-instead-of-var-run.patch |   34 +
> >  ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++
> >  .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 +
> >  ...0003-sha256-Add-sha256_to_string-function.patch |  110 +
> >  ...4-opkg_download-Use-short-cache-file-name.patch |   85 +
> >  meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    6 +
> >  meta/recipes-devtools/perl/perl-native_5.22.0.bb   |   16 +-
> >  .../perl/perl/perl-errno-generation-gcc5.patch     |   23 +
> >  meta/recipes-devtools/perl/perl_5.22.0.bb          |    3 +-
> >  meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
> >  meta/recipes-devtools/pseudo/pseudo_1.7.3.bb       |   19 -
> >  meta/recipes-devtools/pseudo/pseudo_1.7.4.bb       |   19 +
> >  meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
> >  .../python/python-3.4-manifest.inc                 |    2 +-
> >  meta/recipes-devtools/python/python-async_0.6.2.bb |    2 +-
> >  .../recipes-devtools/python/python-pygtk_2.24.0.bb |    4 +-
> >  ...cache.py-getPackages-matches-name-version.patch |   43 +
> >  meta/recipes-devtools/python/python-smartpm_git.bb |    1 +
> >  meta/recipes-devtools/qemu/qemu.inc                |    8 -
> >  .../qemu/qemu/CVE-2015-7295_1.patch                |   63 +
> >  .../qemu/qemu/CVE-2015-7295_2.patch                |   58 +
> >  .../qemu/qemu/CVE-2015-7295_3.patch                |   52 +
> >  .../recipes-devtools/qemu/qemu/CVE-2015-7504.patch |   56 +
> >  .../recipes-devtools/qemu/qemu/CVE-2015-7512.patch |   44 +
> >  .../recipes-devtools/qemu/qemu/CVE-2015-8345.patch |   73 +
> >  .../recipes-devtools/qemu/qemu/CVE-2015-8504.patch |   51 +
> >  .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch |   46 +
> >  .../recipes-devtools/qemu/qemu/CVE-2016-2197.patch |   59 +
> >  .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |   45 +
> >  meta/recipes-devtools/qemu/qemu/no-valgrind.patch  |   19 +
> >  meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   11 +
> >  .../configure.ac-check-for-both-gpg2-and-gpg.patch |   29 +
> >  .../rpm/rpm-check-rootpath-reasonableness.patch    |    2 +-
> >  meta/recipes-devtools/rpm/rpm_4.11.2.bb            |    3 +-
> >  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
> >  meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    2 +
> >  meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c  |   10 +-
> >  .../subversion-CVE-2015-3184.patch                 | 2094
> > ++++++++++++++++++++
> >  .../subversion-CVE-2015-3187.patch                 |  346 ++++
> >  .../subversion/subversion_1.8.13.bb                |    3 +
> >  .../syslinux/0010-gcc46-compatibility.patch        |   37 +
> >  .../0011-mk-MMD-does-not-take-any-arguments.patch  |   33 +
> >  meta/recipes-devtools/syslinux/syslinux_6.03.bb    |    2 +
> >  meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb   |    1 +
> >  meta/recipes-extended/bash/bash.inc                |    2 +-
> >  meta/recipes-extended/byacc/byacc/byacc-open.patch |   12 +
> >  ...bunzip2-qt-returns-0-for-corrupt-archives.patch |   55 +
> >  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    1 +
> >  meta/recipes-extended/cpio/cpio_v2.inc             |    8 +-
> >  meta/recipes-extended/cronie/cronie_1.5.0.bb       |    2 +-
> >  meta/recipes-extended/cups/cups.inc                |    6 +
> >  .../cwautomacros/cwautomacros_20110201.bb          |    3 +
> >  .../foomatic-filters-4.0.17/CVE-2015-8327.patch    |   23 +
> >  .../foomatic-filters-4.0.17/CVE-2015-8560.patch    |   23 +
> >  .../foomatic/foomatic-filters_4.0.17.bb            |    4 +
> >  .../ghostscript/ghostscript/png_mak.patch          |   21 +
> >  .../ghostscript/ghostscript_9.16.bb                |    1 +
> >  meta/recipes-extended/grep/grep_2.21.bb            |   12 +-
> >  meta/recipes-extended/gzip/gzip.inc                |   14 +-
> >  meta/recipes-extended/images/wic-image-minimal.bb  |   14 -
> >  meta/recipes-extended/images/wic-image-minimal.wks |   10 -
> >  ...check-conntrack-when-libnfnetlink-enabled.patch |   34 +
> >  meta/recipes-extended/iptables/iptables_1.4.21.bb  |    3 +-
> >  .../libaio/libaio/system-linkage.patch             |   37 +
> >  meta/recipes-extended/libaio/libaio_0.3.110.bb     |    9 +-
> >  ...IVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch |  151 --
> >  .../libarchive/libarchive-CVE-2015-2304.patch      |  151 ++
> >  .../libarchive/libarchive_3.1.2.bb                 |    2 +-
> >  .../libtirpc/libtirpc/remove-des-uclibc.patch      |   22 +-
> >  .../libtirpc/libtirpc/va_list.patch                |   18 +
> >  meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |    4 +-
> >  meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    2 +-
> >  meta/recipes-extended/lsb/lsb_4.1.bb               |    4 +-
> >  meta/recipes-extended/lsb/lsbinitscripts_9.64.bb   |    2 +
> >  ...ace-inline-with-static-inline-for-gcc-5.x.patch |   69 +
> >  meta/recipes-extended/ltp/ltp_20150420.bb          |    1 +
> >  meta/recipes-extended/mailx/mailx_12.5-5.bb        |    5 +
> >  meta/recipes-extended/pam/libpam/use-utmpx.patch   |  233 +++
> >  meta/recipes-extended/pam/libpam_1.2.1.bb          |    4 +-
> >  .../quota/quota/remove_non_posix_types.patch       |   13 +
> >  meta/recipes-extended/quota/quota_4.02.bb          |    2 +-
> >  .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 -
> >  .../rpcbind/rpcbind/cve-2015-7236.patch            |   83 +
> >  meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |    3 +-
> >  ...-stack-overflow-due-to-too-deep-recursion.patch |   57 +
> >  meta/recipes-extended/screen/screen_4.3.1.bb       |    1 +
> >  meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |    2 +-
> >  .../0001-Include-needed-headers-explicitly.patch   |   62 +
> >  meta/recipes-extended/sysstat/sysstat_11.1.5.bb    |    2 +
> >  meta/recipes-extended/tar/tar.inc                  |   10 +-
> >  meta/recipes-extended/texinfo/texinfo_6.0.bb       |    2 +-
> >  .../recipes-extended/tzcode/tzcode-native_2015f.bb |   25 -
> >  .../recipes-extended/tzcode/tzcode-native_2016a.bb |   25 +
> >  meta/recipes-extended/tzdata/tzdata_2015f.bb       |  207 --
> >  meta/recipes-extended/tzdata/tzdata_2016a.bb       |  208 ++
> >  .../unzip/unzip/CVE-2015-7696.patch                |   38 +
> >  .../unzip/unzip/CVE-2015-7697.patch                |   31 +
> >  .../unzip/unzip/cve-2014-9636.patch                |   45 +
> >  .../unzip/unzip/unzip-6.0_overflow3.diff           |   45 -
> >  meta/recipes-extended/unzip/unzip_6.0.bb           |    4 +-
> >  meta/recipes-extended/xz/xz_5.2.1.bb               |    2 +-
> >  meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     |    5 +-
> >  meta/recipes-gnome/gcr/gcr_3.16.0.bb               |    7 +-
> >  .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |   39 +
> >  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   26 +-
> >  .../gnome-desktop/gnome-desktop3_3.16.2.bb         |    5 +-
> >  meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    3 -
> >  meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
> >  meta/recipes-gnome/gtk+/gtk+3.inc                  |    5 +-
> >  ...Do-not-try-to-initialize-GL-without-libGL.patch |   60 +
> >  meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb            |    1 +
> >  .../gtk-engines/gtk-engines_2.20.2.bb              |    5 +-
> >  .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |    3 +
> >  meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    3 +-
> >  .../librsvg/librsvg/CVE-2015-7558_1.patch          |  139 ++
> >  .../librsvg/librsvg/CVE-2015-7558_2.patch          |  230 +++
> >  .../librsvg/librsvg/CVE-2015-7558_3.patch          |  223 +++
> >  meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |    8 +-
> >  meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    5 +-
> >  meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb      |    5 +
> >  meta/recipes-graphics/cairo/cairo.inc              |    3 +
> >  ...anspose-the-matrix-in-_cairo_gl_shader_bi.patch |   49 +
> >  meta/recipes-graphics/cairo/cairo_1.14.2.bb        |    1 +
> >  meta/recipes-graphics/directfb/directfb.inc        |    3 +
> >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    3 +-
> >  meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
> >  ...10-sharedtex_mt-fix-rendering-thread-hang.patch |   43 +
> >  meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |    1 +
> >  meta/recipes-graphics/piglit/piglit_git.bb         |    6 +
> >  ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch |   54 +
> >  meta/recipes-graphics/waffle/waffle_1.5.1.bb       |    4 +-
> >  meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb   |    2 +-
> >  meta/recipes-graphics/xorg-lib/libxcb.inc          |    4 +-
> >  .../libxcb/gcc-mips-pr68302-mips-workaround.patch  |   22 +
> >  ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |   65 +
> >  meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |    1 +
> >  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    3 +
> >  .../kern-tools/kern-tools-native_git.bb            |    2 +-
> >  meta/recipes-kernel/kmod/kmod.inc                  |    2 +-
> >  .../linux-firmware/linux-firmware_git.bb           |    4 +-
> >  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    3 +-
> >  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    9 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |    2 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
> >  meta/recipes-kernel/linux/linux-yocto.inc          |    4 +
> >  meta/recipes-kernel/linux/linux-yocto_3.14.bb      |    9 +-
> >  meta/recipes-kernel/linux/linux-yocto_3.19.bb      |    9 +-
> >  meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   23 +-
> >  ...-sessiond-disable-match-app-event-by-name.patch |   58 +
> >  meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |    3 +-
> >  .../oprofile/oprofileui-server_git.bb              |    2 +-
> >  meta/recipes-kernel/oprofile/oprofileui_git.bb     |    5 +-
> >  meta/recipes-kernel/sysprof/sysprof_git.bb         |    3 +-
> >  meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |    3 +
> >  meta/recipes-lsb4/libpng/libpng12_1.2.53.bb        |    2 +-
> >  .../recipes-multimedia/gstreamer/gst-player_git.bb |    4 +-
> >  .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |    3 +
> >  .../gstreamer/gstreamer1.0-omx.inc                 |    3 +-
> >  .../gstreamer/gstreamer1.0-plugins-bad.inc         |   15 +-
> >  .../0001-glimagesink-Downrank-to-marginal.patch    |   32 +
> >  .../gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb    |    4 +-
> >  .../gstreamer/gstreamer1.0-plugins-base.inc        |    7 +-
> >  .../gstreamer/gstreamer1.0-plugins-good.inc        |   14 +-
> >  ...ink-Shouldn-t-drop-buffer-when-sync-false.patch |   30 +
> >  .../gstreamer/gstreamer1.0_1.4.5.bb                |    1 +
> >  .../libpng/libpng-1.6.17/CVE-2015-8126_1.patch     |   91 +
> >  .../libpng/libpng-1.6.17/CVE-2015-8126_2.patch     |  134 ++
> >  .../libpng/libpng-1.6.17/CVE-2015-8126_3.patch     |   79 +
> >  .../libpng/libpng-1.6.17/CVE-2015-8126_4.patch     |   48 +
> >  .../libpng/libpng-1.6.17/CVE-2015-8472.patch       |   29 +
> >  meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |   10 +-
> >  .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 +
> >  .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
> >  .../libtiff/files/CVE-2015-8781.patch              |  196 ++
> >  .../libtiff/files/CVE-2015-8784.patch              |   73 +
> >  meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |    2 +
> >  .../0001-card-add-pa_card_profile.ports.patch      |  245 +++
> >  ...oth-fail-if-user-requested-profile-doesn-.patch |   60 +
> >  ...-move-profile-selection-after-pa_card_new.patch |  363 ++++
> >  ...vailability-for-some-unavailable-profiles.patch |   75 +
> >  .../pulseaudio/pulseaudio_6.0.bb                   |    4 +
> >  meta/recipes-qt/qt4/qt4-4.8.7.inc                  |    2 +-
> >  .../0028-Don-t-crash-on-broken-GIF-images.patch    |   47 -
> >  .../0034-Fix-kmap2qmap-build-with-clang.patch      |   34 +
> >  meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    3 +
> >  meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
> >  .../matchbox-terminal/matchbox-terminal_git.bb     |    4 +-
> >  meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +-
> >  meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
> >  meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |   40 +-
> >  meta/recipes-support/apr/apr-util_1.5.4.bb         |    6 +
> >  meta/recipes-support/apr/apr_1.5.2.bb              |   14 +-
> >  meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |    2 +-
> >  meta/recipes-support/curl/curl/CVE-2016-0754.patch |  417 ++++
> >  meta/recipes-support/curl/curl/CVE-2016-0755.patch |  138 ++
> >  meta/recipes-support/curl/curl_7.44.0.bb           |    9 +-
> >  .../gmp-4.2.1/Use-__gnu_inline__-attribute.patch   |   36 +
> >  .../gmp/gmp-4.2.1/disable-stdc.patch               |   39 -
> >  meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
> >  .../recipes-support/icu/icu/fix-install-manx.patch |   48 +
> >  meta/recipes-support/icu/icu_55.1.bb               |    5 +
> >  .../libbsd/files/CVE-2016-2090.patch               |   50 +
> >  meta/recipes-support/libbsd/libbsd_0.7.0.bb        |    4 +-
> >  meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    2 +-
> >  meta/recipes-support/libfm/libfm_1.2.3.bb          |    5 +-
> >  .../libgcrypt/files/CVE-2015-7511_1.patch          |  245 +++
> >  .../libgcrypt/files/CVE-2015-7511_2.patch          |   55 +
> >  meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb  |    4 +
> >  .../0001-libgpg-error-Add-nios2-support.patch      |   46 +
> >  .../libgpg-error/libgpg-error_1.19.bb              |    4 +-
> >  .../libksba/ksba-add-pkgconfig-support.patch       |    2 +-
> >  meta/recipes-support/libpcre/libpcre_8.37.bb       |   73 -
> >  meta/recipes-support/libpcre/libpcre_8.38.bb       |   78 +
> >  ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   61 +
> >  meta/recipes-support/libunwind/libunwind_1.1.bb    |    5 +
> >  .../libxslt/libxslt/CVE-2015-7995.patch            |   33 +
> >  meta/recipes-support/libxslt/libxslt_1.1.28.bb     |    3 +-
> >  .../nettle/nettle-3.1.1/CVE-2015-8803_8805.patch   |   71 +
> >  .../nettle/nettle-3.1.1/CVE-2015-8804.patch        |  281 +++
> >  meta/recipes-support/nettle/nettle_3.1.1.bb        |    5 +
> >  meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |    2 +
> >  meta/recipes-support/pinentry/pinentry_0.9.2.bb    |    2 +
> >  .../user-creation/files/system-xuser.conf          |   11 +
> >  .../user-creation/xuser-account_0.1.bb             |    6 +-
> >  .../vte/vte-0.28.2/cve-2012-2738.patch             |  135 ++
> >  meta/recipes-support/vte/vte.inc                   |    3 +-
> >  meta/recipes-support/vte/vte_0.28.2.bb             |    3 +-
> >  meta/site/nios2-linux                              |  395 ++++
> >  scripts/contrib/devtool-stress.py                  |  241 +++
> >  scripts/contrib/python/generate-manifest-3.4.py    |    2 +-
> >  scripts/devtool                                    |    5 +-
> >  scripts/gen-lockedsig-cache                        |   19 +-
> >  scripts/lib/bsp/engine.py                          |    6 +-
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../arm/recipes-kernel/linux/kernel-list.noinstall |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  .../target/arch/i386/conf/machine/machine.conf     |    4 +-
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    5 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  .../target/arch/powerpc/conf/machine/machine.conf  |    2 +-
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    4 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   62 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   61 +
> >  .../linux/files/machine-preempt-rt.scc             |    3 +-
> >  .../linux/files/machine-standard.scc               |    3 +-
> >  .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
> >  .../recipes-kernel/linux/kernel-list.noinstall     |    2 +-
> >  .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
> >  .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
> >  .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
> >  .../linux/linux-yocto-tiny_4.1.bbappend            |   33 +
> >  .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
> >  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   32 +
> >  scripts/lib/devtool/__init__.py                    |   65 +-
> >  scripts/lib/devtool/build-image.py                 |   94 +-
> >  scripts/lib/devtool/build.py                       |    6 +-
> >  scripts/lib/devtool/deploy.py                      |    9 +-
> >  scripts/lib/devtool/package.py                     |    8 +-
> >  scripts/lib/devtool/runqemu.py                     |   64 +
> >  scripts/lib/devtool/sdk.py                         |   56 +-
> >  scripts/lib/devtool/search.py                      |   80 +
> >  scripts/lib/devtool/standard.py                    |  590 ++++--
> >  scripts/lib/devtool/upgrade.py                     |   70 +-
> >  scripts/lib/recipetool/create.py                   |   74 +-
> >  scripts/lib/recipetool/create_buildsys.py          |    2 +-
> >  scripts/lib/scriptutils.py                         |    4 +
> >  scripts/lib/wic/imager/direct.py                   |    3 +-
> >  scripts/lib/wic/utils/oe/misc.py                   |   20 +-
> >  scripts/oe-git-proxy                               |   12 +-
> >  scripts/oe-pkgdata-util                            |    7 +-
> >  scripts/oe-publish-sdk                             |    4 +-
> >  scripts/postinst-intercepts/update_font_cache      |    4 +-
> >  scripts/postinst-intercepts/update_icon_cache      |    3 +-
> >  scripts/postinst-intercepts/update_pixbuf_cache    |    4 +-
> >  scripts/runqemu                                    |   33 +-
> >  scripts/runqemu-export-rootfs                      |    8 +-
> >  scripts/runqemu-ifup                               |   15 +
> >  scripts/runqemu-internal                           |   89 +-
> >  scripts/yocto-bsp                                  |    2 +-
> >  749 files changed, 29611 insertions(+), 4083 deletions(-)
> >  create mode 100644
> > bitbake/lib/toaster/bldcontrol/migrations/0009_auto__add_field_brlaye
> > r_layer_version.py
> >  create mode 100644
> > bitbake/lib/toaster/orm/migrations/0027_auto__add_customimagerecipe__
> > add_unique_customimagerecipe_name_project.py
> >  create mode 100644
> > bitbake/lib/toaster/orm/migrations/0028_auto__chg_field_logmessage_me
> > ssage.py
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/static/js/customrecipe.js
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/static/js/newcustomimage.js
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/templates/customise_btn.html
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/templates/customrecipe.html
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/templates/newcustomimage.html
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/templates/pkg_add_rm_btn.html
> >  create mode 100644
> > bitbake/lib/toaster/toastergui/templatetags/project_url_tag.py
> >  create mode 100644 documentation/mega-manual/figures/add
> > -variable.png
> >  create mode 100644 documentation/mega-manual/figures/bash-oecore.png
> >  create mode 100644 documentation/mega-manual/figures/set
> > -variable.png
> >  create mode 100644 documentation/mega-manual/figures/variable
> > -added.png
> >  create mode 100644 documentation/toaster-manual/figures/add
> > -variable.png
> >  create mode 100644 documentation/toaster-manual/figures/bash
> > -oecore.png
> >  create mode 100644 documentation/toaster-manual/figures/set
> > -variable.png
> >  create mode 100644 documentation/toaster-manual/figures/variable
> > -added.png
> >  create mode 100644 meta-selftest/conf/machine/qemux86copy.conf
> >  create mode 100644 meta-selftest/lib/devtool/__init__.py
> >  create mode 100644 meta-selftest/lib/devtool/test.py
> >  create mode 100644 meta-selftest/recipes-test/error/error.bb
> >  create mode 100644 meta-selftest/recipes-test/images/error-image.bb
> >  create mode 100644 meta-selftest/recipes-test/images/test-empty
> > -image.bb
> >  create mode 100644 meta-yocto-bsp/lib/oeqa/yoctobsp.py
> >  delete mode 100644 meta/classes/prserv.bbclass
> >  create mode 100644 meta/classes/sign_package_feed.bbclass
> >  create mode 100644 meta/conf/machine/include/tune-thunderx.inc
> >  create mode 100644 meta/files/ext-sdk-prepare.sh
> >  create mode 100644 meta/lib/oeqa/runtime/files/testsdkmakefile
> >  create mode 100644 meta/lib/oeqa/selftest/archiver.py
> >  create mode 100644 meta/lib/oeqa/selftest/manifest.py
> >  create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gcc46
> > -compatibility.patch
> >  create mode 100644 meta/recipes-bsp/grub/files/CVE-2015-8370.patch
> >  create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console
> > -Fix-C-syntax-errors-for-function-declaration.patch
> >  create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001
> > -Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-dns
> > -gen.c-fix-too-long-error.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015
> > -8000.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015
> > -8461.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015
> > -8704.patch
> >  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015
> > -8705.patch
> >  delete mode 100644 meta/recipes
> > -connectivity/bluez5/bluez5/bluetooth.conf
> >  create mode 100644 meta/recipes-connectivity/connman/connman/0001
> > -Detect-backtrace-API-availability-before-using-it.patch
> >  create mode 100644 meta/recipes-connectivity/connman/connman/0002
> > -resolve-musl-does-not-implement-res_ninit.patch
> >  create mode 100644 meta/recipes-connectivity/connman/connman/0003
> > -Fix-header-inclusions-for-musl.patch
> >  delete mode 100644 meta/recipes
> > -connectivity/connman/connman/add_xuser_dbus_permission.patch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> > -2016-1907_2.patch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> > -2016-1907_3.patch
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE
> > -2016-1907_upstream_commit.patch
> >  delete mode 100644 meta/recipes
> > -connectivity/openssh/openssh_7.1p1.bb
> >  create mode 100644 meta/recipes
> > -connectivity/openssh/openssh_7.1p2.bb
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001
> > -Add-test-for-CVE-2015-3194.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2015-3194-1-Add-PSS-parameter-check.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2015-3195-Fix-leak-with-ASN.1-combine.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2015-3197.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2016-0701_1.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE
> > -2016-0701_2.patch
> >  create mode 100644 meta/recipes
> > -connectivity/openssl/openssl/ptest_makefile_deps.patch
> >  create mode 100644 meta/recipes-connectivity/socat/socat/CVE-2016
> > -2217.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to
> > -POSIX-utmpx-API.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC
> > -when-linking-instead-of-LD-and-use-CFLAGS-and.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox/0001-randconfig
> > -fix.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox/0002
> > -Passthrough-r-to-linker.patch
> >  create mode 100644 meta/recipes-core/coreutils/coreutils
> > -6.9/loadavg.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear
> > -ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015
> > -9761_1.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015
> > -9761_2.patch
> >  create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove
> > -incorrect-STRDIFF-based-optimization-.patch
> >  create mode 100644 meta/recipes
> > -core/glibc/glibc/use_64bit_atomics.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015
> > -5312-Another-entity-expansion-issue.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015
> > -7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015
> > -7500-Fix-memory-access-error-due-to-incorre.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015
> > -8035-Fix-XZ-compression-support-loop.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015
> > -8242-Buffer-overead-with-HTML-parser-in-pus.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug
> > -on-name-parsing-at-the-end-of-current-inpu.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498
> > -Avoid-processing-entities-after-encoding-conversion-.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1
> > -Add-xmlHaltParser-to-stop-the-parser.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2
> > -Detect-incoherency-on-GROW.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1
> > -Stop-parsing-on-entities-boundaries-errors.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2
> > -Cleanup-conditional-section-error-handling.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2
> > -Fix-an-error-in-previous-Conditional-section-patch.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942
> > -Another-variation-of-overflow-in-Conditional-section.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015
> > -8241.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8317
> > -Fail-parsing-early-on-if-encoding-conversion-failed.patch
> >  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015
> > -8710.patch
> >  create mode 100644 meta/recipes-core/meta/signing-keys.bb
> >  create mode 100644 meta/recipes-core/readline/readline-6.3/readline
> > -cve-2014-2524.patch
> >  delete mode 100644 meta/recipes-core/readline/readline
> > -6.3/readline63-003
> >  create mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build
> > -on-uClibc-exp10.patch
> >  create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-getenv
> > -when-secure-versions-are-not-available.patch
> >  create mode 100644 meta/recipes-core/systemd/systemd/rules-whitelist
> > -hd-devices.patch
> >  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl
> > -Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
> >  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5
> > -optimizes-away-the-write-only-static-functions-.patch
> >  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in
> > -syncfs.patch
> >  create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016
> > -2224.patch
> >  create mode 100644 meta/recipes-core/uclibc/uclibc-git/CVE-2016
> > -2225.patch
> >  create mode 100644 meta/recipes-core/util-linux/util-linux/runuser
> > -l.pamd
> >  create mode 100644 meta/recipes-core/util-linux/util
> > -linux/runuser.pamd
> >  create mode 100644 meta/recipes-devtools/ccache/files/0002-dev.mk.in
> > -fix-file-name-too-long.patch
> >  create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015
> > -0860.patch
> >  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in
> > -create-hardlinks-with-the-correct-directory-.patch
> >  create mode 100644 meta/recipes-devtools/file/file/host-file.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483
> > -universal-initializer-no-warning.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483
> > -universal-initializer-no-warning.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags
> > -for-build.patch
> >  create mode 100644 meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015
> > -7545-1.patch
> >  create mode 100644 meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015
> > -7545-2.patch
> >  create mode 100644 meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015
> > -7545-3.patch
> >  create mode 100644 meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015
> > -7545-4.patch
> >  create mode 100644 meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015
> > -7545-5.patch
> >  create mode 100644 meta/recipes-devtools/libtool/libtool/0001
> > -libtool-Fix-support-for-NIOS2-processor.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg
> > -include-stdio.h-for-getting-FILE-defined.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_conf
> > -create-opkg.lock-in-run-instead-of-var-run.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util
> > -New-file-with-bin_to_hex-function.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add
> > -md5_to_string-function.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add
> > -sha256_to_string-function.patch
> >  create mode 100644 meta/recipes-devtools/opkg/opkg/0004
> > -opkg_download-Use-short-cache-file-name.patch
> >  create mode 100644 meta/recipes-devtools/perl/perl/perl-errno
> > -generation-gcc5.patch
> >  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.3.bb
> >  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
> >  create mode 100644 meta/recipes-devtools/python/python-smartpm/smart
> > -cache.py-getPackages-matches-name-version.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -7295_1.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -7295_2.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -7295_3.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -7504.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -7512.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -8345.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015
> > -8504.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016
> > -1568.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016
> > -2197.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016
> > -2198.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch
> >  create mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check
> > -for-both-gpg2-and-gpg.patch
> >  create mode 100644 meta/recipes-devtools/subversion/subversion
> > -1.8.13/subversion-CVE-2015-3184.patch
> >  create mode 100644 meta/recipes-devtools/subversion/subversion
> > -1.8.13/subversion-CVE-2015-3187.patch
> >  create mode 100644 meta/recipes-devtools/syslinux/syslinux/0010
> > -gcc46-compatibility.patch
> >  create mode 100644 meta/recipes-devtools/syslinux/syslinux/0011-mk
> > -MMD-does-not-take-any-arguments.patch
> >  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix
> > -bunzip2-qt-returns-0-for-corrupt-archives.patch
> >  create mode 100644 meta/recipes-extended/foomatic/foomatic-filters
> > -4.0.17/CVE-2015-8327.patch
> >  create mode 100644 meta/recipes-extended/foomatic/foomatic-filters
> > -4.0.17/CVE-2015-8560.patch
> >  create mode 100644 meta/recipes
> > -extended/ghostscript/ghostscript/png_mak.patch
> >  delete mode 100644 meta/recipes-extended/images/wic-image-minimal.bb
> >  delete mode 100644 meta/recipes-extended/images/wic-image
> > -minimal.wks
> >  create mode 100644 meta/recipes-extended/iptables/iptables/0002
> > -configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
> >  create mode 100644 meta/recipes-extended/libaio/libaio/system
> > -linkage.patch
> >  delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001
> > -Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
> >  create mode 100644 meta/recipes
> > -extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
> >  create mode 100644 meta/recipes
> > -extended/libtirpc/libtirpc/va_list.patch
> >  create mode 100644 meta/recipes-extended/ltp/ltp/0001-replace-inline
> > -with-static-inline-for-gcc-5.x.patch
> >  create mode 100644 meta/recipes-extended/pam/libpam/use-utmpx.patch
> >  delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc
> > -nss.patch
> >  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015
> > -7236.patch
> >  create mode 100644 meta/recipes-extended/screen/screen/0001-Fix
> > -stack-overflow-due-to-too-deep-recursion.patch
> >  create mode 100644 meta/recipes-extended/sysstat/sysstat/0001
> > -Include-needed-headers-explicitly.patch
> >  delete mode 100644 meta/recipes-extended/tzcode/tzcode
> > -native_2015f.bb
> >  create mode 100644 meta/recipes-extended/tzcode/tzcode
> > -native_2016a.bb
> >  delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015f.bb
> >  create mode 100644 meta/recipes-extended/tzdata/tzdata_2016a.bb
> >  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015
> > -7696.patch
> >  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2015
> > -7697.patch
> >  create mode 100644 meta/recipes-extended/unzip/unzip/cve-2014
> > -9636.patch
> >  delete mode 100644 meta/recipes-extended/unzip/unzip/unzip
> > -6.0_overflow3.diff
> >  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015
> > -7674.patch
> >  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to
> > -initialize-GL-without-libGL.patch
> >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015
> > -7558_1.patch
> >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015
> > -7558_2.patch
> >  create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015
> > -7558_3.patch
> >  create mode 100644 meta/recipes-graphics/cairo/cairo/Manually
> > -transpose-the-matrix-in-_cairo_gl_shader_bi.patch
> >  create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0010
> > -sharedtex_mt-fix-rendering-thread-hang.patch
> >  create mode 100644 meta/recipes-graphics/waffle/waffle/0001
> > -third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
> >  create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips
> > -pr68302-mips-workaround.patch
> >  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3
> > -test-add-a-check-for-FE_DIVBYZERO.patch
> >  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix
> > -sessiond-disable-match-app-event-by-name.patch
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0
> > -plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
> >  create mode 100755 meta/recipes
> > -multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop
> > -buffer-when-sync-false.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE
> > -2015-8126_1.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE
> > -2015-8126_2.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE
> > -2015-8126_3.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE
> > -2015-8126_4.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.17/CVE
> > -2015-8472.patch
> >  create mode 100644 meta/recipes
> > -multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
> >  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015
> > -8781.patch
> >  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015
> > -8784.patch
> >  create mode 100644 meta/recipes
> > -multimedia/pulseaudio/pulseaudio/0001-card-add
> > -pa_card_profile.ports.patch
> >  create mode 100644 meta/recipes
> > -multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user
> > -requested-profile-doesn-.patch
> >  create mode 100644 meta/recipes
> > -multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection
> > -after-pa_card_new.patch
> >  create mode 100644 meta/recipes
> > -multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some
> > -unavailable-profiles.patch
> >  delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on
> > -broken-GIF-images.patch
> >  create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap
> > -build-with-clang.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2016
> > -0754.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2016
> > -0755.patch
> >  create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/Use
> > -__gnu_inline__-attribute.patch
> >  delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable
> > -stdc.patch
> >  create mode 100644 meta/recipes-support/icu/icu/fix-install
> > -manx.patch
> >  create mode 100644 meta/recipes-support/libbsd/files/CVE-2016
> > -2090.patch
> >  create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015
> > -7511_1.patch
> >  create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015
> > -7511_2.patch
> >  create mode 100644 meta/recipes-support/libgpg-error/libgpg
> > -error/0001-libgpg-error-Add-nios2-support.patch
> >  delete mode 100644 meta/recipes-support/libpcre/libpcre_8.37.bb
> >  create mode 100644 meta/recipes-support/libpcre/libpcre_8.38.bb
> >  create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add
> > -AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
> >  create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015
> > -7995.patch
> >  create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015
> > -8803_8805.patch
> >  create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015
> > -8804.patch
> >  create mode 100644 meta/recipes-support/user-creation/files/system
> > -xuser.conf
> >  create mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012
> > -2738.patch
> >  create mode 100644 meta/site/nios2-linux
> >  create mode 100755 scripts/contrib/devtool-stress.py
> >  create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes
> > -kernel/linux/linux-yocto-tiny_4.1.bbappend
> >  create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes
> > -kernel/linux/linux-yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux
> > -yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux
> > -yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux
> > -yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux
> > -yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/mips64/recipes
> > -kernel/linux/linux-yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/mips64/recipes
> > -kernel/linux/linux-yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/powerpc/recipes
> > -kernel/linux/linux-yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/powerpc/recipes
> > -kernel/linux/linux-yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux
> > -yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux
> > -yocto_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/x86_64/recipes
> > -kernel/linux/linux-yocto-tiny_4.1.bbappend
> >  create mode 100644
> > scripts/lib/bsp/substrate/target/arch/x86_64/recipes
> > -kernel/linux/linux-yocto_4.1.bbappend
> >  create mode 100644 scripts/lib/devtool/runqemu.py
> >  create mode 100644 scripts/lib/devtool/search.py
--=-SBQ0K5JAEji1eE87gqPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJXAcjsAAoJEJ0dnzgO5LT5sA8P/RPr6NCuS2TYZzLo8IKxQMK5
I6cp3ZA2AT+CaZji4LZmOrI/mqVaGzGF1EGUTu4s63WmhJLGSacn1o2SGAu7UFOt
+SUIjAainPR3DEY15otp28Gk+LNrCfgAsQiHUDYYMqPSDYY7IQ/TpX5pPZ6n1YdU
TzItKLmgOR+TeiDBzdgIKrR3xZb82HL38xD5x0EXI/67Zk0+Iv7wDv0iL7iPmEcv
u8FjhpmSyo+bYX9MBb+lwEjCRI9buc0ljzKWfzqN+h/0FqqHcKMHSPHQAvRfcvy9
QUDtRqavhdXyUUdp/Clxgn7w2MZDr8pnBvNKw/F9DPldguPxDNrHzqRoeeOaCD9/
LikcdiCPfS+kc/CHB1A8d1E3zvwvQe8OH5Z/sxrAxLtnwcnAEOhEHuOcmOmv7mSm
bK0lYtMGj8bywWzRwaPeDIzS7kVx6hVPF1soVWIr5Sx/yZXrBrYZhTABH+tOk180
+uE1MCkfAPsUT+FwO1/wMZmGyS3Sds7c55AtPBSNbJBE3xie/KKrmQyhvyVWQSL0
vDp0eFjLv7RXyPgmDVRYpZNoveNfi69OOwvVLiNY2tC1rU0+nk9LcuGSC9MsMYhD
Z2wqWwmrSmdJ5f4tF3cLQVqCeWzQr9vEUeA+X4KZnpt6zadrtGJeW2iYvglAO3LC
KeeLegomgtEqQoe/AcUb
=/L87
-----END PGP SIGNATURE-----

--=-SBQ0K5JAEji1eE87gqPR--
