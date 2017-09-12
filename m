Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="feb8YRBi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bTifdRAb"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrwwY5wl6zDrJk
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:12:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 745E0211ED;
 Tue, 12 Sep 2017 03:12:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 12 Sep 2017 03:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0esy2s
 2Uw30Uu7e206Eo0JwxluB3bpqf0Tla/gjCFe8=; b=feb8YRBikh8K85wn0oXZqm
 4VprfO5V2GCwyjOgk9+yiYYggFucaHP26JKqMX5mZRW/y+/UzyuYfN6gM0AXJiFb
 8e3mDVCBLpLsAhlZGh3B2HQsxFIdCg2n6kvyX0eb7eR5YgdrYFkkGnMt0AfIlrrb
 oNQdJjZCMOFq6MDPwLDOgYGeqxxXTDMKNL4xlpLhNew50SDrNVD6+LE5qXPLP9cW
 qVipD8VTDiURQjVeUHYPnHVkMan2dONVmz+TYn4wwy+bkmpddbkLgkG6BUYTH5da
 27wHJI5oyMQ+wWDa0K4w9O0Xjge0MaAvC5XnKK9q4ot840eyLvwH95pUarXMpJ7w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=0esy2s2Uw30Uu7e206Eo0JwxluB3bpqf0Tla/gjCF
 e8=; b=bTifdRAbne9u7sxk6YQeC0MnDjbmqUosQExJRx7aJpYNj5SsEWlScrofc
 2ops9n+9pYmKLZ1qrBnYUXxXVuxPa0SaaDmZUC0aV58HwEodG3sLyxmK97BPmDL4
 Vj/pLUD5att+3RmK9xJeGuic0YRdSybkLprARfr/negVoxueVbUf//m7cyVJOjwV
 /drfx+2u9OtKJNDVmpKaAuSiVtbhy18HSsqDcNhtgnEx2q+Rnp4qsN0TrhB2WqcK
 lO2PJeCx9eUwZM3KFKt7cjjuW4B3oK2DsjOWdQEUI79Ezb3fWsgIo1hZ26JvB7kv
 oPYnQasrhnA1R/0LG/gawGulz3ZyA==
X-ME-Sender: <xms:2Yi3WYybGgviBy0gajXF3wFGVY7DTF2F10r_sNB-lX_lKCxSRHSJ4Q>
X-Sasl-enc: 3vR9d+i45KvPuG62dpq9PtYru/2DmrTuQuxluPIYSV3I 1505200344
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id C16CC24009;
 Tue, 12 Sep 2017 03:12:23 -0400 (EDT)
Message-ID: <1505200336.4080.3.camel@aj.id.au>
Subject: QEMU 2.10.0
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>
Date: Tue, 12 Sep 2017 16:42:16 +0930
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-shAXREIY1SOj/ZtJrMjb"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2017 07:12:31 -0000


--=-shAXREIY1SOj/ZtJrMjb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've updated openbmc/qemu's master to 2.10.0. For anyone maintaining
patches on top of master I've merged the old master state into 2.10.0
with the --ours strategy, then applied the series C=C3=A9dric is maintainin=
g
on top. This means any patches you might have on top of master should
rebase easily due to shared history, whilst keeping our yet-to-be-
upstreamed patches in an easily identified set.

Cheers,

Andrew
--=-shAXREIY1SOj/ZtJrMjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZt4jRAAoJEJ0dnzgO5LT5H9wP/0Vvlj1v9XqOv5yMqOQ1mAzw
gjezFQBa6wWM14rWGN8mE/127ZlZO7k+kjv4eOhhdrr/C1KpZMU6GSEuoVyK/mCS
BFm+HnYAoeSvB+0hz+qtQFTZOWhgEkGf8vFrwVVbVT4rJD3i/Gpp1D5CeJt/eBcj
N4lZgh24NbYOe1siIzARJMUNWO4xTPRkptmyOClRggMAeGQ2V5w0rLJttEKkbWWZ
LdJ0U+E70jr4s+tM6ERjhsNLGuu0ZhfIJAOq+d0LJYrhpS0eX9yvNjqddoUWeCFj
YL0TZ5SUE4X1DSuT6vIU5eq+qDjl0jihdRVW5sMrL1fUEyCxHek7EbND3GkKxjkE
Dl/gCHmEKYm+pagPY1W4lk25D7KevU1txc0qvVa5G+BVXRQL0R4/sHOMCafHil/K
OLjUd+A+yOf05/UbKaDPu28CubqrIUCE9EUiBRtPaeRCWsosPUlW8/aUPX3+Nqh2
e1SqnUx+TvGW1OGXDeDc77bV62aeElaf2e5/RvGmaNlkxucrZ4Aa7+2uBtIrR341
PG0rXemejxFiujgOV2Cr5IzhBF6AHtl/gPi+O5KmfwYfgG4Z6miUUQLrBMgzHdrc
3xKA2SkW5jt+Kj1XgJJ/KfvfabaQFpukpWMr5WTD7kuGeUjOUJtYh2qtHltt1glp
BauVrphSXVAAZ9HCxTNA
=FOog
-----END PGP SIGNATURE-----

--=-shAXREIY1SOj/ZtJrMjb--
