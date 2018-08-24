Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xPgF4xLRzDqj4
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 12:02:32 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id F11D08B29C;
 Thu, 23 Aug 2018 22:02:23 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Warnings from building at HEAD
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notww5kS39b-OH2oAD=doMR_yUrunzFaAKK+=B=G42fc9KQ@mail.gmail.com>
Date: Thu, 23 Aug 2018 22:02:23 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <00000011-BD2E-4DC0-A1F2-534E0022AE2C@fuzziesquirrel.com>
References: <CAO=notww5kS39b-OH2oAD=doMR_yUrunzFaAKK+=B=G42fc9KQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2018 02:02:34 -0000


> On Aug 23, 2018, at 5:19 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> I'm seeing these warnings, is anybody else?  (Building quanta-q71l as
> of a few minutes ago).
>=20
> WARNING: libgpg-error-native-1.27-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>=20
>    devtool modify <recipe>
>    devtool finish --force-patch-refresh <recipe> <layer_path>
>=20
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> =
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14867=
5.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> Details:
> Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> patching file src/Makefile.am
> Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
> patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h
>=20
> Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> WARNING: phosphor-ipmi-host-1.0-r1 do_unpack: noskeleton in
> MACHINE_FEATURES. Remove mapper-wait on host settings.
> WARNING: libgpg-error-1.27-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>=20
>    devtool modify <recipe>
>    devtool finish --force-patch-refresh <recipe> <layer_path>
>=20
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> =
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14867=
5.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> Details:
> Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> patching file src/Makefile.am
> Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
> patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h
>=20
> Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> Using an insecure image signing key!
> WARNING: python-pygobject-2.28.7-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>=20
>    devtool modify <recipe>
>    devtool finish --force-patch-refresh <recipe> <layer_path>
>=20
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> =
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14867=
5.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> Details:
> Applying patch obsolete_automake_macros.patch
> patching file configure.ac
> Hunk #2 succeeded at 82 with fuzz 1.
>=20
> Now at patch obsolete_automake_macros.patch

Hi Patrick

Yep, I=E2=80=99ve seen these.  In fact, it is my patch it is complaining =
about - it started
with the bump to Yocto 2.5.  I haven=E2=80=99t had a chance to fix it =
up.

-brad=
