Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 123441A02E6
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2016 00:48:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MRBegVHO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=T20XZXVK; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id hc1so6277308obb.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 05:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=JD7UHbMTHdf4D1YUivvwQ2OIr0C8ynctyvudNx+K1nk=;
 b=MRBegVHOPwcKdDeVY7iIt0YsH4KCkd2gDu3BdM9si6BfK0+AHv/NJ/k6LPZYpNfqIZ
 cmbp+Jbau1gsK7TT9el2i0q4LXcl/5j/54Ai77MEp4jfNp+QscVRkSoS4nnJa0iau3Y2
 /F00eRojGhvxX/QfiiEGiIc7zXyjisZbFnvlfC97geeCTbG21O4GelPhQUSbcM+U2/1r
 x3sPWH1Rn/ewDzElTBBgBDsTGRBaXUe7bBIgvPcn9GMCnFnTp79NSqRU6lbVZEyK19a3
 2cetytUJ7wArj6IK+Nxyj5sSXJFL8xemgt2OBYQgr7Ie8EjuNiVqkJoP4QmdCBtaAkzO
 NbDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=JD7UHbMTHdf4D1YUivvwQ2OIr0C8ynctyvudNx+K1nk=;
 b=T20XZXVKZJRvxxoI3LmVhm64paVDMJsw7jJgTCZLmDR3FnwImr3v1UZKWcFaAkc+AT
 oM0rOYJCfZ5ZFLoEy6QPmcBkKT0ASZ8sOlGU4opvCK6+p8whnv02mnHZ0pAp7E9nwzHU
 Ch+QSPPXMwLsBgElgY59EUKGdKztxgMryeC7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=JD7UHbMTHdf4D1YUivvwQ2OIr0C8ynctyvudNx+K1nk=;
 b=mimiK1Rrxpw8gPCFbRHiwwcEM0gUY8doT8vfivMpYWAl/a/2EiLK5tTC5cJs81407p
 y63xMJyk/aWynkLZb+LjrzxJohdDYXSzG9+lqQfl0fFwiyyARgL7dEuJ8jPTEaMFhCYX
 DaWddyLlhnUB7grMEkWInVDr4z/RBPfqdxtE/hYrWO+pUEoNlbQ24PrOVBNqmtIFF+s8
 VCu7lsPEoS1c/EVyKMXPrdUFSlzaUWR1/rulKLc1mlZN+fXGwsGUeYqBOGeZdH/b+dz4
 TxJ9J9mWYLOWKQdSJtfbdOe56eGPjyBsWx66JwLOfnhZZqxOJMNgTxuUbGCuHVKDXZd5
 e9gQ==
X-Gm-Message-State: AD7BkJIvOthnKRGwwBBdNgyvtYMSclGjYqsk/G1ojGXjKx03nTBavUQIVsyqkrd3dkU1XWUX37dobuIpnKjCfQ==
X-Received: by 10.60.232.162 with SMTP id tp2mr2184194oec.49.1457617692702;
 Thu, 10 Mar 2016 05:48:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Thu, 10 Mar 2016 05:47:53 -0800 (PST)
In-Reply-To: <DB4PR05MB09410DE4CC28F7164F053B26D5B40@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB09410DE4CC28F7164F053B26D5B40@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Mar 2016 00:17:53 +1030
X-Google-Sender-Auth: V0wmp9_ZoHV2nHoSdhnsMrqrQn0
Message-ID: <CACPK8XfOxhBq0th9JkooBeub3j0QmiJYEwrTRj+sMHnoqyr3OQ@mail.gmail.com>
Subject: Re: Assistance adding new system into openbmc project
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jeremy Kerr <jk@ozlabs.org>, Anton Blanchard <anton@samba.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 10 Mar 2016 13:48:18 -0000

Hello Shay,

On Thu, Mar 10, 2016 at 11:33 PM, Shay Slobodkin <shays@mellanox.com> wrote=
:
> We are newbies for the openbmc project, read through the manuals and woul=
d
> like to work under the ast2520 system.

Welcome! It's great to have you here. We look forward to working with
you and your colleagues.

We're a new project that is still finding it's feet, so feel free to
jump in and help out wherever you feel.

Jeremy has spent some time documenting some of our processes
https://github.com/openbmc/docs/blob/master/contributing.md, which I
encourage you and your team to have a read of.

In addition to this list we hang out on irc.freenode.net in #openbmc.
We're globally distributed, but US central time and all three of the
Australian timezones are when you will find the most activity.

> We have several questions regarding the tree structure and building.
> tree additions to support our system.
>
> Please let us know if you find the below as the complete and correct
> additions.

> root
>
> |-- meta-openbmc-bsp
>
> |   `-- meta-aspeed
>
> |       |-- conf
>
> |       |   `-- layer.conf
>
> |       `-- meta-ast2520 (New SoC)

This looks good.

> |           |-- recipes-bsp
>
> |           |   `-- u-boot
>
> |           |       |-- files
>
> |           |       |   |-- config.patch
>
> |           |       |   |-- fw_env.config
>
> |           |       |   `-- patch-2013.07
>
> |           |       |       |-- 0000-u-boot-aspeed-064.patch (Exist)
>
> |           |       |       |-- 0001-u-boot-openbmc.patch (Exist)
>
> |           |       |       `-- 0002-u-boot-aspeed_2520_2500.patch (Patch
> with 2500-2520 u-boot support)

I believe we now build with u-boot from our git tree (which has these
patches applied, plus some more fixes), so these should be removed.

 https://github.com/openbmc/u-boot/tree/v2013.07-aspeed-openbmc

Submit your patch for 2520 support there and I'll get it merged in.

The goal there is to get support for the ast chips in upstream u-boot
so we don't need to carry any local patches.

>
> |           |       |-- u-boot-fw-utils_2013.07%.bbappend
>
>
>
> |           |       `-- u-boot_2013.07%.bbappend
>
> |           |-- recipes-kernel
>
> |           |   `-- linux
>
> |           |       |-- linux-obmc
>
> |           |       |   |-- defconfig
>
> |           |       |   |-- files
>
> |           |       |       `-- patch-4.3-dev (Or later, temporary till c=
ode
> upstream)
>
> |           |       |           |-- 0000-kernel-aspeed_soc_2520.patch (Pa=
tch
> with 2520 SoC support)
>
> |           |       |           |-- 0001-kernel-aspeed_2500_2520_dts.patc=
h
> (Patch with basic dts support)

Again, send them to the mailing list and we will get them merged into
our kernel tree:

 https://github.com/openbmc/linux/tree/dev-4.3

I've got on a 4.4 based branch ready to go. We planned to switch to
that once the v6 release was tagged, which has happened now, so I'll
upload that change soon.

As with u-boot we intend to upstream support and use that instead of
our own tree.

>
> |           |       |   `-- hwmon.cfg
>
> |           |       `-- linux-obmc_%.bbappend
>
> |           `-- recipes.txt
>
> |-- meta-openbmc-x86-machines
>
> |   `-- meta-mellanox
>
> |   |   |-- conf
>
> |   |   |   |-- layer.conf
>
> |   |   |   `-- machine
>
> |   |   |       `-- include
>
> |   |   |           `-- mellanox.inc
>
> |   |   `-- meta-mellanox-edr
>
> |   |       |-- conf
>
> |   |       |   |-- layer.conf
>
> |   |       |   `-- machine
>
> |   |       |       `-- include
>
> |   |       |           `-- mellanox.inc
>
> |   |       |-- recipes-kernel
>
> |   |       |   `-- linux
>
> |   |       |       |-- linux-obmc
>
> |   |       |       |   |-- files
>
> |   |       |       |       `-- patch-4.3-dev (Or later, temporary till c=
ode
> upstream)
>
> |   |       |       |          |-- 0002-kernel-mellanox-dts.patch (Patch
> with Mellanox dts support)

We can include this in kernel tree if you want?

>
> |   |       |       |   |-- mellanox-edr.cfg
>
> |   |       |       |   `-- mellanox-edr.dts
>
> |   |       |       `-- linux-obmc_%.bbappend
>
> |   |       `-- recipes.txt
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> Also, should we add a =E2=80=9Clocal.conf.sample=E2=80=9D file under the
> =E2=80=9Cmeta-openbmc-x86-machines/conf=E2=80=9D path?

I'll let one of the developers more familiar with our project layout
and build system to help you out with the questions below.
>
> If so, we were wondering about the following variables under the
> local.conf.sample file (we took the phosphor one as example):
>
> PACKAGE_CLASSES ?=3D "package_rpm"
>
> SANITY_TESTED_DISTROS_append ?=3D " RedHatEnterpriseWorkstation-6.*"

This is because some of our team members use RHEL6, and bitbake warns
about unsupported distros.

Many of the team use more recent Ubuntu releases, so it's up to you.

>
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
>
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
>
> PATCHRESOLVE =3D "noop"
>
> BB_DISKMON_DIRS =3D "\
>
>     STOPTASKS,${TMPDIR},1G,100K \
>
>     STOPTASKS,${DL_DIR},1G,100K \
>
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>
>     STOPTASKS,/tmp,100M,100K \
>
>     ABORT,${TMPDIR},100M,1K \
>
>     ABORT,${DL_DIR},100M,1K \
>
>     ABORT,${SSTATE_DIR},100M,1K \
>
>     ABORT,/tmp,10M,1K"
>
> Guess we should use the =E2=80=9Cgenericx86-64=E2=80=9D as MACHINE variab=
le
>
>
> We were wondering what specific =E2=80=9Coe-init-build-env=E2=80=9D and s=
imilar files we
> should change, in order for the project to compile.
