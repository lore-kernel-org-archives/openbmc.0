Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Uf3ViChp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="g/nuXeU1"; dkim-atps=neutral
X-Greylist: delayed 315 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jan 2018 08:23:00 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMxkr5hmwzF0WF
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 08:23:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1408D20DA6;
 Thu, 18 Jan 2018 16:17:42 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 18 Jan 2018 16:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=g7VXrWgFBq/piIVC37s8sK+ps7wOP+VlrWv3eWJCHZI=; b=Uf3ViChp
 bQhq/ch6Cc8Q7PycPhZPG7YVpcsFCwTljsPlx2Z6DPvRWWvOOXrcUOhGe0B0FU45
 UQYbR3jqTGoT8uQHPYNSl8akTOiaIpZv1PViDNpiFKWf2j/pprkj9yhe9GKjWGub
 +w+NTuDcTxcIk8pOkwlTPp2d1K2mjAcJLECxm3iFk1Jy50/kEZFsqExJthhOxret
 c3KQswCzxl+Kg5XJ6xxnqiNKVDK1Xd7FKaXNkBtRr7z/CpWeQuCkKEKUg4ktXP5O
 2/1ma8q36hCdR+FyphP/cgfwU4noXNyRoCNnDj+3bGVbDVmXIe+kTkactN86+id6
 +DF9QsRHOVHb7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=g7VXrWgFBq/piIVC37s8sK+ps7wOP
 +VlrWv3eWJCHZI=; b=g/nuXeU1+BDLcP+cPBx0ZCRwwjcMjaHzBvaIATUFPzf4i
 Ac/pzn2UaNO3ks2666MZk52E57XQ7YW0mM9tyQpMEVes8QvDt2vdS6YU15PAu5Cs
 rUSEldTC7xceVNGyhqRrs/KNuyh8VPy6IDEphz6oSqsi3IMCGQCMGRCcgcUm5/qv
 oNCfucxdaLZlbi98RdPLgiuCs3K0FC0c5Ew/imBuR7LW+/hCnka+tyhxLMCG0KED
 G/WJ4PGNF73wBlJ5GkXZJUKR0bPcnwmjwnr9L1volpSA3uHaxRCvK5yOQgI9v5DV
 I1pXx9ftbcgdE/htb/LF664qiSwgcgWS7TiT6MzVw==
X-ME-Sender: <xms:9g5hWjDwgw0VsEGBCs9HPTRI3lhYym_10N9ShOAgC9gGIZkutlQI1Q>
Received: from dave (unknown [170.225.9.145])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7703E24608;
 Thu, 18 Jan 2018 16:17:41 -0500 (EST)
Message-ID: <1516310257.5522.19.camel@aj.id.au>
Subject: Re: Kernel Panic Issue on Witherspoon
From: Andrew Jeffery <andrew@aj.id.au>
To: Balaji.B.Rao@dell.com, openbmc@lists.ozlabs.org
Date: Thu, 18 Jan 2018 15:17:37 -0600
In-Reply-To: <4148cf3295bb4a61b0cf7374574e4f4f@ausx13mpc109.AMER.DELL.COM>
References: <4148cf3295bb4a61b0cf7374574e4f4f@ausx13mpc109.AMER.DELL.COM>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-b7rH+mv0tvQwvUjH9z7u"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Thu, 18 Jan 2018 21:23:03 -0000


--=-b7rH+mv0tvQwvUjH9z7u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-18 at 18:26 +0000, Balaji.B.Rao@dell.com wrote:
> Folks,
> =20
> I=E2=80=99m seeing kernel panic on witherspoon when I do a build locally.=
 I traced the signature to the issue shown below,
> =20
> https://github.com/openbmc/openbmc/issues/2474
> =20
> But I don=E2=80=99t see any recommendation to get over it. Any help / poi=
nter is deeply appreciated. The kernel panic that I see is as follows,
> =20
> [    5.420000] fe00            2067 ubiblock0_1
> [    5.420000]  (driver?)
> [    5.420000] No filesystem could mount root, tried:
> [    5.420000]  squashfs
> [    5.420000]
> [    5.420000] Kernel panic - not syncing: VFS: Unable to mount root fs o=
n unknown-block(254,0)
> [    5.420000] CPU: 0 PID: 1 Comm: swapper Not tainted 4.10.17-72b52ebab5=
74eaf0bcd2256ae16a25976a37c407 #1
> [    5.420000] Hardware name: ASpeed SoC
> [    5.420000] [<80010080>] (unwind_backtrace) from [<8000d934>] (show_st=
ack+0x20/0x24)
> [    5.420000] [<8000d934>] (show_stack) from [<801dbf2c>] (dump_stack+0x=
20/0x28)
> [    5.420000] [<801dbf2c>] (dump_stack) from [<800a4a40>] (panic+0xc8/0x=
264)
> [    5.420000] [<800a4a40>] (panic) from [<8059056c>] (mount_block_root+0=
x288/0x300)
> [    5.420000] [<8059056c>] (mount_block_root) from [<80590740>] (mount_r=
oot+0x60/0x7c)
> [    5.420000] [<80590740>] (mount_root) from [<805908c8>] (prepare_names=
pace+0x16c/0x1d0)
> [    5.420000] [<805908c8>] (prepare_namespace) from [<805900b0>] (kernel=
_init_freeable+0x184/0x1cc)
> [    5.420000] [<805900b0>] (kernel_init_freeable) from [<803fe480>] (ker=
nel_init+0x18/0x104)
> [    5.420000] [<803fe480>] (kernel_init) from [<8000a5e8>] (ret_from_for=
k+0x14/0x2c)
> =20

Your best bet is to file an issue with the full boot log in the
description. We'll judge whether it's a duplicate with 2474 once you've
done so. If it is a duplicate of 2474, it's because the u-boot
environment is pointing to a UBI volume name that doesn't exist. I
think there was a fix in the pipeline.

How you hit this might also depend on how you're building the image and
flashing the system, so be sure to include that in the issue you file.

Cheers,

Andrew
--=-b7rH+mv0tvQwvUjH9z7u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaYQ7xAAoJEJ0dnzgO5LT56IUQALA1K4PYv78LPLQOUZ1Xntzn
IXebvzROoW/qxYjepsP/l3u11p9kLutGwJeNj55CS8qCx51nS30c/Q9wzOo/jsI7
9nGothzd/Jxb56s+9WX/Lg9iBxa4Kb6Ygx30KMM1x42anKGvB2zT6Rnn5OpNFxML
yleB3ufQqHGcnjrGadAKQH58b3NM/QXxI+vQdFc3gAAldvDf60UM1NzftonKuVSI
j0ZQ7DfG+T57bJi5YAy6AGartmhMkybcxKNzKpb7m4fwIujCGf2THCdqh6SLpePE
OMawOz/WnqILRMxd9QTBwdNSB2JiIuph/gKvyavQ5NeiN3aR/bBVzBUMpzXFOYTQ
y49kNjTSDcxfcjNyXLm+Xgd/r3vhibAgHE2zqVPPWHE7j6d5E4obKuGg6d7nRwBC
vQcgXsBlkOnve0kxh8HgZunop58bCCrCBkvc2IsL8/7/is85/GLoxBX4cOf1FL/F
p7OQ6v3YccSrFxqnWauFJ0hhCjQLWjyyjnjcJmmUop1dvMp16ZEhAhfkKOjLX2SN
zZq/9bVVlWa2ZxX+JeaWql0yKNZ+BTJZfl4DsvF3MLyoS9Pua9J/ytV1OFqe2iBv
gxZG1hckE9LrArF11i3pxcaF9a244fde9sElY7UG6PaqU0zlhww0EmCaJf846J8Q
Lc341vYsIM3f9MJeRP3j
=XQHK
-----END PGP SIGNATURE-----

--=-b7rH+mv0tvQwvUjH9z7u--
