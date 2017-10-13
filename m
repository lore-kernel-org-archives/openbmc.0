Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Whv0vjGV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="n4tW/vQh"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCvXz19LPzDrDf
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 15:16:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BF8B20A86;
 Fri, 13 Oct 2017 00:16:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 00:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kkp7pz7aR0AyA+kvM
 oVyAxPc1cFW+PBkGsISGC9Jgd0=; b=Whv0vjGV5lOZR5YlsCsMS3aqj3xOjOZWD
 7FKhgpoJVSFyFbfnIo6eF6Y3BNgJ4Tq6HGXQOnWp94KCyjNGFrbAIUmsaJzYNLCN
 TXzfPZ/pCaJaK2nvUdMmIg7VJ1nFm4LXYjqsELyqTMVFdCyjjoDjTZIzMI47SZND
 IFRxBS24BIIhQVGUDPIrwnH4aKYHN0Cp/m6uCsygxku6m7pULM9EZZQ/s23wboOf
 IlvsGzJ2FSKeFbH59oanI58Yif3EGyNOW+qtABvbxrydKLZRIW7wZcP9tPl4/4Y9
 /OF0vbsc8x43aOH4GxuIs9C2izztNerDXK2c02TPRyj2MlLudqQRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kkp7pz7aR0AyA+kvMoVyAxPc1cFW+PBkGsISGC9Jgd0=; b=n4tW/vQh
 1J4c1fGNGFg5DT1THMlqNNEdK6Kw6J2mMt0Z+cgQ0bx1o18dmGsxS3H7J96kU8X1
 f+Tcphl6vvOm/+8VN4Fyb8cmUDVZzODrzTlW0GuIkH/AI3smyU1tpmOVoNExHJ/R
 P0O4p6735aAO3haINkVcyjzEnr4Z2cWiD5QFN5uDurKk6rpA76x0fABf/deN6O0x
 xm1/+6liOymI0T3MtvZ/RNi9jygQI0buEuCL+Bdtfk4nNxc8Aah6TznTYDSMAjb7
 xnf4vrV5XyzHs+gKuMFejjk39E9A6gpZPR3IHByjWk7CgHPz+nmQ+tLY93OJued2
 pP4xZELvC9+1xQ==
X-ME-Sender: <xms:Dz7gWR-f_9QyXWmQNaSMB8Q70IYKMt2aJl6KMbe9nnzEITRWrsPC4w>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id DAC8D7F91E;
 Fri, 13 Oct 2017 00:16:11 -0400 (EDT)
Message-ID: <1507868164.5452.192.camel@aj.id.au>
Subject: Machine-scope maintainers for OpenBMC
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, Joel Stanley <joel@jms.id.au>, Mykola
 Kostenok <c_mykolak@mellanox.com>, Patrick Venture <venture@google.com>,
 Rick Altherr <raltherr@google.com>, Xo Wang <xow@google.com>, Lei YU
 <mine260309@gmail.com>,  Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew
 Geissler <geissonator@gmail.com>
Date: Fri, 13 Oct 2017 14:46:04 +1030
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nfD2nN/y0lm+S8ZinLKK"
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
X-List-Received-Date: Fri, 13 Oct 2017 04:16:21 -0000


--=-nfD2nN/y0lm+S8ZinLKK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I'm wondering whether we should jot down the maintainers of machines
supported by OpenBMC, and if so, where? With respect to the latter, one
candidate might be the MAINTAINERS file in openbmc/docs.

A related question is: Who are the machine maintainers? Off the top of
my head I feel the following machines machines match with people:

    meta-evb/meta-evb-raspberrypi                  Yi TZ Li <    shliyi@cn.=
ibm.com    >
    meta-evb/meta-evb-aspeed/meta-evb-ast2500      Joel Stanley <    joel@j=
ms.id.au    >
    meta-x86/meta-mellanox/meta-msn                Mykola Kostenok <    c_m=
ykolak@mellanox.com    >
    meta-x86/meta-quanta/meta-q71l                 Patrick Venture <    ven=
ture@google.com>    , Rick Altherr <    raltherr@google.com    >
    meta-openpower/meta-ingrasys/meta-zaius        Xo Wang <    xow@google.=
com    >
    meta-openpower/meta-ibm/meta-firestone =C2=A0 =C2=A0 =C2=A0 =C2=A0 Lei =
YU <    mine260309@gmail.com>    meta-openpower/meta-ibm/meta-romulus      =
     Lei YU <    mine260309@gmail.com>
meta-openpower/meta-ibm/meta-witherspoon       Brad Bishop <bradleyb@fuzzie=
squirrel.com>, Andrew Geissler <geissonator@gmail.com>

Less obvious are the following machines:

    meta-openpower/meta-ibm/meta-palmetto
    meta-openpower/meta-ibm/meta-garrison
    meta-openpower/meta-rackspace/meta-barreleye

Yet another related question is what do we want to do with machines
that don't have an obvious maintainer?

In the case of Palmetto I imagine we could find someone willing to step
up (/me ducks). Garrison I'm unsure about, and for Barreleye I've had
kernel patches on the list for several months with not a lot of
interest in them, which indicates to me that we could probably drop it.

As some background, Joel and I were recently discussing machine
maintainers with respect to the dev-4.13 kernel effort. The approach
Joel kicked off for dev-4.13 was to start from scratch against upstream
and distribute the forward-porting amongst owners of patches in dev-
4.10. That is, if you have patches in dev-4.10 and that are not in
upstream v4.13, you should rework and send them for us to apply to dev-
4.13.

To stress the point a bit, the dev-4.13 tree as it stands does not have
niceties such as `arch/arm/mach-aspeed/aspeed.c` or any of the machine-
specific devicetree files. The idea is that in addition to distributing
the workload, we only add back in what we need and try to avoid
carrying accumulated cruft across moves to new upstream releases.

Whilst the distributed approach eases the workload on Joel, it does
mean that we could miss things that are required for specific machines
(the board-file hacks are particularly worrisome). This is driving my
interest in identifying the maintainers. Having such a list of people
would, for instance, clarify who ought to be on the review list for
kernel bumps to openbmc/openbmc in Gerrit. In the case of dev-4.13 this
would help with the go/no-go decision.

So if you have thoughts on the above or want to put your hand up to
claim any of the machines in the limbo list above, please do speak up!

Cheers,

Andrew

--=-nfD2nN/y0lm+S8ZinLKK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4D4EAAoJEJ0dnzgO5LT5afAP/0/VDpqFAZeg7bET7uBoRJIx
h6a5qC0AlrXBzm4XHHfXN8VtgAL6kUfzVfoKHPXxChlV2LK8s3FkHaEKu1GgiWI6
MnEMQaiRfmyIrCR3koBaHX3icr6EcYOTPI3sr7Z3IjGSvgX5X5yZVWmyLW5oPgaS
ChU87bcrYvuVPLVQrxUDdOvWbY0uoqYJnsDMT8vPh1FSd4o5v78wyY/K4TjwSxpj
kO/JKDoGyykFlTkjameBleqGlnfLSawVcpCm1czcz8qOZGPqyGpT9rTi3KC/menZ
bl7+5817jOMhUfwwXDZeiGN5Zb4H8f+8bxroeag/Y1VkWcA49YeBMgR0ODYgz4qZ
3RyM4Z+3AeKXYtBaIwk2gp9l/6/1izDDr0Mq/QXGYRElo3Nltz1Unnycs2r8n2Fx
jcLJ1V/FdoZG/j3BTVeaM9+9p0wGuoMc1hL7Z0iRmXzjH/XsgfuuI/suOSQbrVgK
rDiUFT/SBrIyA4XruIbwJnFsetZNjqC0UDv7/DGGkdfDMsMKOCUt63kq9Oepl5Cd
YCT4Hd/g1Dj4mK0VIohUu3kGH3EFXa0bINEmHrEzDA29HrCo7V/JrIy3miFF96Cp
mjLpNRwHEeof+PDcF6fGaxgwFykw8sa1Y/eZVNjCm/ZLjP6DZR5CS5lxxcFKOrk0
R8fGC8Nwlwl8m02kH8Kp
=oEQu
-----END PGP SIGNATURE-----

--=-nfD2nN/y0lm+S8ZinLKK--
