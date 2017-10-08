Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UjSS3xvG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PNDtGSTt"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y93475W7jzDqG2
 for <openbmc@lists.ozlabs.org>; Sun,  8 Oct 2017 23:44:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02A0B217D2;
 Sun,  8 Oct 2017 08:44:51 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 08 Oct 2017 08:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TQKdfOnUadBGWFRE0MbdPPAkHQc9tGv/dkmepRI/Y
 gU=; b=UjSS3xvG0vNFTRJHhio6oB/VwnqRuCTWB6Oj5ACsdPeAMB9cBefl4anbA
 PKkeCGDZhFaGwwzNKzXFfS2bc2/y0XItmG5Inw7Wl2W07BqH4QiKU5EWvAvATszI
 LGiLd0OmY9KqutmGJk/DwdVbGLVqAzLT3KJayC7DnLSk7QTg4tHmilfl/n6USzgF
 3FIBuhy39wqzJFuFP909mann7c/uuX3+somhCks0J3WSqxF1+5wiUzXlsaq13l/4
 2mQ6v33Cqb8c4RbVrYscWg5T3JAkFq/iNAZ0k66xTjGFT/I2b7rady/C7XK4d40v
 B0f0sVV1gCr41TpstyVpCxnMLhtnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TQKdfOnUadBGWFRE0M
 bdPPAkHQc9tGv/dkmepRI/YgU=; b=PNDtGSTt6Xk25QSLPrsmNROh4y6RRZjEQC
 8dBOIQNOlMK/LGJNHZS8VHS7DHf8LqLHJP26TDYu6RaqUubUdH04TMyNjSw6N0lw
 dS5pztrm3+pzHnAxWt2SNTW4DSvnbHl0Z1h8QaBZ17YOfALmTDkRIS5yk1Z2fRyH
 55C78XKGPrKIc8sIruaQ5iO4QW/iHwkryTWL4wDuxF2hioVydR+mov/hfZz2GX0d
 jrKHNqMcPzx2Ob9Y1JBgJDKn3pqp5hterD6qOsxOeGsq9MQTP9XvNebL/r6wgQ/c
 90i8D9tKAUXWnAwsOvj/1PKutbfaH3K4yL+4y0DeGNe1sLUCX4gQ==
X-ME-Sender: <xms:wh3aWZefoDknG3PXddymaIAb5QksfSSqYx0oOX3sWRWVKVrp4GZbJg>
X-Sasl-enc: +3Pa61X9Mc18IzXT4+EvY4O5gBkPdT4cjUJK24tiuh9s 1507466690
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4028C7E3E1;
 Sun,  8 Oct 2017 08:44:48 -0400 (EDT)
Message-ID: <1507466681.5452.143.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
From: Andrew Jeffery <andrew@aj.id.au>
To: Javier Romero <xavinux@gmail.com>
Cc: Rick Altherr <raltherr@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Sun, 08 Oct 2017 23:14:41 +1030
In-Reply-To: <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-k4f3uKRRLr5X/mCc5ZNm"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Oct 2017 12:44:57 -0000


--=-k4f3uKRRLr5X/mCc5ZNm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-10-08 at 01:45 -0300, Javier Romero wrote:
> I've tried these steps:
>=C2=A0
> 1. tester@obmc:~$ cd openbmc
>=C2=A0
> 2. tester@obmc:/openbmc$ export TEMPLATECONF=3Dmeta-openbmc-machines/meta=
-evb/meta-evb-raspberrypi/conf
>=C2=A0
> 3. tester@obmc:/openbmc$ . oe-init-build-env ~/my-build-raspberrypi
>=C2=A0
> 4. tester@obmc:~/my-build-raspberrypi$ bitbake obmc-phosphor-image
>=C2=A0
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.32.0"
> BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
> NATIVELSBSTRING =C2=A0 =3D "Ubuntu-16.04"
> TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "arm-openbmc-linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "raspberrypi"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "openbmc-phosphor"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "0.1.0"
> TUNE_FEATURES =C2=A0 =C2=A0 =3D "arm armv6 =C2=A0vfp arm1176jzfs callconv=
ention-hard"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "hard"
> meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0
> meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0
> meta-networking =C2=A0=C2=A0
> meta-python =C2=A0 =C2=A0 =C2=A0=C2=A0
> meta-virtualization=C2=A0
> meta-phosphor =C2=A0 =C2=A0=C2=A0
> meta-raspberrypi =C2=A0=3D "master:65edf7d796c34012982632d0a724d80ff44c9e=
4a"
>=C2=A0
>=C2=A0
> But the following error appears:
>=C2=A0
> ERROR: linux-raspberrypi-1_4.4.48+gitAUTOINC+7ddf96fbb7-r0 do_kernel_meta=
data: Function failed: do_kernel_metadata (log file is located at /home/tes=
ter/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/linux-r=
aspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.72=
76)
> ERROR: Logfile of failure stored in: /home/tester/my-build-raspberrypi/tm=
p/work/raspberrypi-openbmc-linux-gnueabi/linux-raspberrypi/1_4.4.48+gitAUTO=
INC+7ddf96fbb7-r0/temp/log.do_kernel_metadata.7276
> Log data follows:
> | DEBUG: Executing shell function do_kernel_metadata
> | ERROR. input file "phosphor-gpio-keys" does not exist
> | ERROR: could not process input files: /home/tester/openbmc/import-layer=
s/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig /home/t=
ester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-ras=
pberrypi-4.4/0001-fix-dtbo-rules.patch phosphor-gpio-keys
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0See /tmp/tmp.GA2zgVbszZ for details
> | ERROR. input file "phosphor-gpio-keys" does not exist
> | ERROR: could not process input files: /home/tester/openbmc/import-layer=
s/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi/defconfig /home/t=
ester/openbmc/import-layers/meta-raspberrypi/recipes-kernel/linux/linux-ras=
pberrypi-4.4/0001-fix-dtbo-rules.patch phosphor-gpio-keys
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0See /tmp/tmp.BEzIPRvVMy for details
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_kernel_metadata (log file is located at /hom=
e/tester/my-build-raspberrypi/tmp/work/raspberrypi-openbmc-linux-gnueabi/li=
nux-raspberrypi/1_4.4.48+gitAUTOINC+7ddf96fbb7-r0/temp/log.do_kernel_metada=
ta.7276)
> ERROR: Task (/home/tester/openbmc/import-layers/meta-raspberrypi/recipes-=
kernel/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata) failed with exit =
code '1'
> NOTE: Tasks Summary: Attempted 632 tasks of which 0 didn't need to be rer=
un and 1 failed.
> Summary: 1 task failed:
> =C2=A0 /home/tester/openbmc/import-layers/meta-raspberrypi/recipes-kernel=
/linux/linux-raspberrypi_4.4.bb:do_kernel_metadata
> Summary: There were 6 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>=C2=A0
> Is there something wrong with the steps I've tried ?

Nope, that's just an outright bug in the raspi support. I'd recommend sever=
al
things here:

1. Open an issue in the github issue tracker[0]
2. Cook up a patch! It looks like this might have to do with assumptions ma=
de
=C2=A0=C2=A0=C2=A0in meta-phosphor/conf/distro/openbmc-phosphor.conf, as th=
e raspi uses a
=C2=A0=C2=A0=C2=A0different kernel tree to the ASPEED SoCs
3. For better or worse patches are submitted via Gerrit[1], so push your pa=
tch
=C2=A0=C2=A0=C2=A0there

Make sure to speak up here or on IRC if you get stuck :)

Andrew

[0] https://github.com/openbmc/openbmc/issues
[1] https://gerrit.openbmc-project.xyz/#/q/status:open
--=-k4f3uKRRLr5X/mCc5ZNm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ2h25AAoJEJ0dnzgO5LT5l0kP/2bArdgrsaXLc/vPrKT7dLb8
72uZo5njgyf1uYeRUEXe3T4CvRHVy29SSlRmtTBSt3odEDn2tV8cJsNsz3FrRMvY
Ly/XQHkd1n4MLBVdNrLrV11HZ/yPf4JpilCg9RBiK1eeCusLF9banjQDI7StLBVT
6hgwszocQSG9Z7k8TVIBuONPvq0YYpzTXXYp3J8AqVIN2ZK9r7e68gv5r07sK39J
SyCdpz92Azu8KGaasHGfzaDc4jEBSizy8k2Gr2r7WViD9tcy38H73plT8SIP7DyY
1srExZwQlhT33cjKGBHuVsj15Faws5t/VHQgEbsgWfAA9D2iX1pSXO4w3STVZUrA
HCeJIL89kG5Yj2FV5qnJJjjPQ9Odf8amLe+4eFnpTdQRR0v1Mohl9TGB+sclklIc
SUMl5kgXigH7RqwIgGsyHFMdNmvKLAECrJtQqOxSHiCDeP6aKxCU7D5MVXkqVUQx
t5XVbcyc9x9EZPCJZHy0xjcq+cXLKxcDAJhArTeUogIXIAEY+CcXCUcIK8E5yT7j
czi9FAFrqb0wCSZ+Og7vO0bXVuiMbUgM0yyYWNZuHMr//bPf0YlYL3XCSRu5LWV6
61D5lLdTK9LWrq9CI6JfGPZPJcGI7VIR9/THmeNmVVkI5T58jbxM5CzvfBOvtWHc
14M2oc8DNiPNPRaVP7Pz
=RbKu
-----END PGP SIGNATURE-----

--=-k4f3uKRRLr5X/mCc5ZNm--
