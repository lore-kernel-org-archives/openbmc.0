Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ETAPO7R6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VTnBui6n"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBf4v0GHtzDr5T
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 14:06:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B55B820AF8;
 Tue, 10 Oct 2017 23:06:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 10 Oct 2017 23:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=VmqqEKKEFplhAszJAuP5VOAtoKeb4jd9jl/sHB+e2
 Zs=; b=ETAPO7R6pHXs6D0ma2z7V+aVUTvAOpCMIkTdRg2WzpUGjgmC3aB9UOex4
 3UqPrgTl2wtZ/8VZbnmD/jts2EnevnDwADpqitxm2gMzJnQavEATh15mUpIc1qUB
 MvwgSQUXh6Q+Hdwfba4BysR0gTSFG2dm2ZdHbkKANVhvbEjwrHndPiJM+5XEdB+y
 g9HV4MUVm1Py4PeeJp27Qs6Sjxj3iFaDn4MOxG2999FB5gpaJhR3E/Y8UWzhlpH7
 GJBOsupn8jsrIt8yANtkOsFfWw3g8D9Kg8A+IjB3negyBuMUx2jVWt1OLlzQoL1Z
 AN+68kQT9axe+zQz+vsXQAMHb1qQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=VmqqEKKEFplhAszJAu
 P5VOAtoKeb4jd9jl/sHB+e2Zs=; b=VTnBui6nWOLkHaAHFtEPP7ALJ28m5GAbYE
 bIweqr8u9/nRyuF66QYssH74Bt8PcLh59BfvAuIHfw7u9bdwjJgqf6Wth7NJY1VF
 KKGzphQ3WuuYGYHs491DMThbqL9poA09m4GePb8z7wy0yM00hQemufg+upGdLL5o
 dFc7exRUK5XQHuokNzaaKnYELPkECU9bNau0HaTFRDy67LN0k0g16dHWllFCZw8B
 rz+gfblu2Q12S9HZTY+JLXbjRMtNeI09xmWWTKFcgwAtjzMbTgEsKvl98dX776Z3
 nhlAncRJgqbS595XqrhxqxqfvVX0vTgKa+EhX9SwVwRyTV/p1tZw==
X-ME-Sender: <xms:nIrdWQpcbK42wmugrWHvz0MLAb8VaMhW2sas4xRJgLNUwYGLdmHo7Q>
X-Sasl-enc: wEGppgAq5L0krqC3SCEO0ATvUoe/zVzs7VRjRx1PG/rP 1507691163
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0118C7E3BA;
 Tue, 10 Oct 2017 23:06:02 -0400 (EDT)
Message-ID: <1507691159.5452.168.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
From: Andrew Jeffery <andrew@aj.id.au>
To: Javier Romero <xavinux@gmail.com>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 11 Oct 2017 13:35:59 +1030
In-Reply-To: <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
 <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
 <1507594463.5452.156.camel@aj.id.au>
 <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-j1CG2tEPfMwnhd0zO3SH"
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
X-List-Received-Date: Wed, 11 Oct 2017 03:06:07 -0000


--=-j1CG2tEPfMwnhd0zO3SH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 11:01 -0300, Javier Romero wrote:
> > Ah - so I don't think you've outlined why you picked OpenBMC for the
> > job. Can you give us a quick run-down?
>=20
> I'm an individual contributor on the Open Compute Project and follow
> the Hardware Management Group, OpenBMC is on their project scope and
> sounds very interesting for me, so decide to participate and see if I
> can be useful.

Ah, nice. Good to have some background :)

> >=20
> > There are going to be easier projects out there than OpenBMC to cut
> > your teeth with, but if you are keen to learn to program, feel you have
> > the drive to do so and Yi is happy to help out with your interest in
> > the Raspberry Pi then by all means stick around :)
>=20
> Have bought the Raspberry PI a few days ago, to start contibuting to
> the OpenBMC project and try to make it work on the RPI. I can learn
> what is needed on the way, and that is why I'm here and decide to
> participate, to contribute while learning new things.

Great! I look forward to you helping us improve our documentation and
on-boarding of contributors. It might be rocky but it should help those
coming along in the future.

>  But if more
> programming advanced knowledge is requiered to participate on the
> OpsnBMC project, maybe I'll have to cut my teeth with other project as
> you said.

Play it by ear - I just wasn't sure what your motivations were. But
since you're coming from the OCP background with an interest in
hardware management, it makes sense to stick around here. As long as
you get in touch when you get stuck we'll find someone to help answer
your questions.

Cheers,

Andrew
--=-j1CG2tEPfMwnhd0zO3SH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3YqXAAoJEJ0dnzgO5LT584kP/i+ZichCWrkhgai+q7V2UPwa
jR1++D0CBIc7h4YwBygNW9ytcgki7/T0XtP0ET9mEa/HuYVyfQRLYD3s0W4+T1FH
QVu785+d/zcW0Elm1w/Uf2BtXCLkB4Z0s3B0Ahcd3IhrMzoq/+uFrBwi+EGS5vhJ
vd6T3v3oazY5IFwNEdFZ4Na36prMjSDZqluelPxz6mO1BRCl2fdS2lAhIFD6Bb+i
Y8kzgo5B85kMe56WzTtONHR7yMmRuV+um44tCXV5/PIlJc53P1Hs/1D5KWi0jhk3
jfHwWb7Y1jVbkz/GgFZzOtidcEbhQVBlCP5VD0AonFheHemlI5CwpSRgTy5/PBju
YQWJehrCUZ9nreIr1k8I3cCy2zow7b+tmT2El1Y13jJuOswM8YDzn7RNgbmKNdzx
EwR2xxUz5TkR5uShcMXfeHZHmZLvUHgXxGgQpqZk+QQyZdmHoOwuZwLa6O9HWS5H
Ymp6ig9CUR4HF3JmneYdtbtG+Uxq/uB8dro932/TMGXmA0jVv+22iijWnbB4k0cX
KfnOHGmkCVO+NeGfe8HBswhVwkhsIgYiEL6pRaLZhYRPHAR6MuMEgXL6neIZg6vK
hXpt+8Zotzv9X6myqgGTjIU5m0OnarqtRfHqEPvHSUYE8kdwdVoUK5uxuHyjjSkU
3x5Q8jml5GyWiVc3Zyu+
=OMGq
-----END PGP SIGNATURE-----

--=-j1CG2tEPfMwnhd0zO3SH--
