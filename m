Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22b; helo=mail-it0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EjlJ9AAd"; 
 dkim-atps=neutral
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xWVR0FxvzDqSL
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 16:25:18 +1000 (AEST)
Received: by mail-it0-x22b.google.com with SMTP id l186-v6so761720itb.4
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 23:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UUQGDN1NQ/ubBSGrOO9wTIlQdOWphR8gVdPhQwpBCkk=;
 b=EjlJ9AAd6c4jpdUebyaSzHROjUPSxrGKTcYiCMkhKLyjVd4MHSzxh7Cfj4qYoe+WQV
 D+N/s+wKg6IrarAB6am54Czcl3GVRyuXgMFTPYjsP5wWYOOxoKWiK164V9s9/hzTehC9
 nYsA4TFmhUnHi9qR8DH8uPc4II8jKY6DMu0pAc81eOmX6Vj0lJ+E0dkhM+Z4t1BU1brS
 3JctH6gPGybOCDw6yNGaDcmj4eawo7cvGMQJl5axD8HJvfgAv3izmyB+/wBb0MFz4nSl
 SPMTkk6pQN43A4paVWoGaGv0mgi1CPAK9Rl8kDIJgSOIbuvmuPN3SmHkFG6GxBNj53Li
 FXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UUQGDN1NQ/ubBSGrOO9wTIlQdOWphR8gVdPhQwpBCkk=;
 b=TrqkebwmWHZiQZk+3z0E1L0OIMYzvuzVnYYUggR2QSmr2W0zvUKRlwaOOPzz46cXnS
 NKfJr5YxZ3eWaqSFkd5c15FD9sSmEC1VKF2LiiDNl/vezhvZ+wNpqdHa4VsJhS68eSN1
 OBD4sbafw3VsrHoGL/UZVcaU/jY145pKY4CmoTgL8otGkeAkMtYS8ytRvfTXElUTb/if
 RDebLsCd8ZdqqdxvbcXVSB2szoBHiQv5F09zEESYDzx2Nxf8q9KeOwSmCr9jl95bfA0o
 SVI5P9XU7qKx70vZO/IzgfbCxek1Q2DFnXv+D9o86YXxQcZ8Y8LzzhgH98q5Vb9BSdSt
 F7yQ==
X-Gm-Message-State: APzg51AipGtlDY6Txr0lLlHWs05d0YSHYRAthg+8oJrV2B4zSqTUH0ZB
 s8jX+/0wIwJ3oIZrX3kZw9cZb2DFEL7NGse54iA=
X-Google-Smtp-Source: ANB0VdZlgwQ1091A+TI1LYI+8g37Ul9ZJPbq+kGdGaZkvE5eaCJEIoQVPRrHWqKDyjJdnYqgcVnRZJiWHGLEBgqAkCc=
X-Received: by 2002:a24:85c6:: with SMTP id
 r189-v6mr459649itd.83.1535091916440; 
 Thu, 23 Aug 2018 23:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notww5kS39b-OH2oAD=doMR_yUrunzFaAKK+=B=G42fc9KQ@mail.gmail.com>
 <00000011-BD2E-4DC0-A1F2-534E0022AE2C@fuzziesquirrel.com>
In-Reply-To: <00000011-BD2E-4DC0-A1F2-534E0022AE2C@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 24 Aug 2018 14:24:57 +0800
Message-ID: <CAARXrtkcRsm690t-PTocaR9N8ojg=3iKmYhGr9+RZVNj+-cvug@mail.gmail.com>
Subject: Re: Warnings from building at HEAD
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 24 Aug 2018 06:25:19 -0000

This warning message comes from `meta/lib/oe/patch.py`:

    def runcmd(args, dir =3D None):
        ...
        if " fuzz " in output:
            bb.warn("""...

It checks "fuzz" in the patch output, which means the patch is applied but
the context is different.
I would think it is OK, it is just a warning to tell that the patch is
out-of-date.

To fix this, we need to update each patch that triggers the warning, and th=
e
patch itself may be out of openbmc's scope.

On Fri, Aug 24, 2018 at 10:02 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
> > On Aug 23, 2018, at 5:19 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > I'm seeing these warnings, is anybody else?  (Building quanta-q71l as
> > of a few minutes ago).
> >
> > WARNING: libgpg-error-native-1.27-r0 do_patch:
> > Some of the context lines in patches were ignored. This can lead to
> > incorrectly applied patches.
> > The context lines in the patches can be updated with devtool:
> >
> >    devtool modify <recipe>
> >    devtool finish --force-patch-refresh <recipe> <layer_path>
> >
> > Then the updated patches and the source tree (in devtool's workspace)
> > should be reviewed to make sure the patches apply in the correct place
> > and don't introduce duplicate lines (which can, and does happen
> > when some of the context is ignored). Further information:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14=
8675.html
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> > Details:
> > Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> > patching file src/Makefile.am
> > Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
> > patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h
> >
> > Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> > WARNING: phosphor-ipmi-host-1.0-r1 do_unpack: noskeleton in
> > MACHINE_FEATURES. Remove mapper-wait on host settings.
> > WARNING: libgpg-error-1.27-r0 do_patch:
> > Some of the context lines in patches were ignored. This can lead to
> > incorrectly applied patches.
> > The context lines in the patches can be updated with devtool:
> >
> >    devtool modify <recipe>
> >    devtool finish --force-patch-refresh <recipe> <layer_path>
> >
> > Then the updated patches and the source tree (in devtool's workspace)
> > should be reviewed to make sure the patches apply in the correct place
> > and don't introduce duplicate lines (which can, and does happen
> > when some of the context is ignored). Further information:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14=
8675.html
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> > Details:
> > Applying patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> > patching file src/Makefile.am
> > Hunk #1 succeeded at 61 with fuzz 2 (offset -3 lines).
> > patching file src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h
> >
> > Now at patch 0001-syscfg-Add-ppc64le-cross-build-support.patch
> > Using an insecure image signing key!
> > WARNING: python-pygobject-2.28.7-r0 do_patch:
> > Some of the context lines in patches were ignored. This can lead to
> > incorrectly applied patches.
> > The context lines in the patches can be updated with devtool:
> >
> >    devtool modify <recipe>
> >    devtool finish --force-patch-refresh <recipe> <layer_path>
> >
> > Then the updated patches and the source tree (in devtool's workspace)
> > should be reviewed to make sure the patches apply in the correct place
> > and don't introduce duplicate lines (which can, and does happen
> > when some of the context is ignored). Further information:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-March/14=
8675.html
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> > Details:
> > Applying patch obsolete_automake_macros.patch
> > patching file configure.ac
> > Hunk #2 succeeded at 82 with fuzz 1.
> >
> > Now at patch obsolete_automake_macros.patch
>
> Hi Patrick
>
> Yep, I=E2=80=99ve seen these.  In fact, it is my patch it is complaining =
about - it started
> with the bump to Yocto 2.5.  I haven=E2=80=99t had a chance to fix it up.
>
> -brad
