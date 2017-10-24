Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="B83sveO0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IvliVT1s"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLZ5z0fKjzDqfh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 11:34:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 029B420A92;
 Mon, 23 Oct 2017 20:34:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 23 Oct 2017 20:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=uP785X5Di+WYdMXZM01cXC97cameuwAH3rLcuNBos6Q=; b=B83sveO0
 ewzKf/k1I6f79K/odfh9tv/yZTdACQNH+U/5wN8nNK6XxngzTtcifQ+50lDZ9Is3
 wGflU/U3abKsPGnlBqYcmejpi5Dlg443MgcVSfY1VamvkU1uTb48nc7BNZ+l1n0Q
 uz+XWsft1bN0GyKnrxm35y31UoYgNk10NOrY+3g/Fyh0C85ehZ52qZ8IWzbUET2P
 9wptTtu3uHP6I0oxyvpThS7EzkYNlqIa5PztlFL+C3OvEtyDS0+z5V6C5g8mtMcp
 uLSLe8GOiA3GoN27+OmPELTEw0vufcZdq5JDo8cvu5xRDkWc2Il5OQEiAS1CJnIv
 Wcmn4RMzc8xkqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=uP785X5Di+WYdMXZM01cXC97cameu
 wAH3rLcuNBos6Q=; b=IvliVT1sF+dd57S9fO2rmGV7shw4pQlVUZRPfF7bJ2hV+
 L9+F1d2Seh2wrSwroJVg2SPH5QKoIVZ5cvPhzep/PXS5oEnhQjOAaxym8A7XvkvO
 u3n8QF/WnuqjrlCrHJLtDfKJCAdeFeDL0DSVEB6cmnfKHEwvLdhNeqxNyIRD94lU
 aG8wEVdJduxayCJ5ZDPBFA0IUYDPxN1n+IYuwgHNU69xtPzQ/lYXYqJEqUQjBnE1
 4ypOetC+TdexVtkct1Xx18dow+TbW4DViB0oXIgYN63njt+hbb2K2Yg1Iy6CscDx
 X9uqSg5iCbMlwLVgcB6GYZ49RvsuHh/Y+HFJka8OA==
X-ME-Sender: <xms:kYruWVCP-NBASZdz0WzzWgL034PsKqrUrCFWQBoPvibsIFdosE7UKg>
Received: from keelia (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id B6D79247A8;
 Mon, 23 Oct 2017 20:34:24 -0400 (EDT)
Message-ID: <1508805259.10303.1.camel@aj.id.au>
Subject: Re: [PATCH 0/7] Backport upstream NCSI fixes
From: Andrew Jeffery <andrew@aj.id.au>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, openbmc@lists.ozlabs.org
Date: Tue, 24 Oct 2017 11:04:19 +1030
In-Reply-To: <20171023054557.29013-1-sam@mendozajonas.com>
References: <20171023054557.29013-1-sam@mendozajonas.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4gVP4YCV+WrZOAEr2wTm"
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
X-List-Received-Date: Tue, 24 Oct 2017 00:34:33 -0000


--=-4gVP4YCV+WrZOAEr2wTm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-23 at 16:45 +1100, Samuel Mendoza-Jonas wrote:
> This backports a few useful NCSI fixes which are upstream, as well as
> replacing
> "net/ncsi: Don't assume last available channel exists" with the
> actual upstream
> version.
>=20
> Gavin Shan (3):
> =C2=A0 net/ncsi: Disable HWA mode when no channels are found
> =C2=A0 net/ncsi: Enforce failover on link monitor timeout
> =C2=A0 net/ncsi: Fix length of GVI response packet
>=20
> Samuel Mendoza-Jonas (4):
> =C2=A0 Revert "net/ncsi: Don't assume last available channel exists"
> =C2=A0 net/ncsi: Don't limit vids based on hot_channel
> =C2=A0 net/ncsi: Fix AEN HNCDSC packet length
> =C2=A0 net/ncsi: Stop monitor if channel times out or is inactive

Series applied to dev-4.10.

Cheers,

Andrew

>=20
> =C2=A0net/ncsi/internal.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
> =C2=A0net/ncsi/ncsi-aen.c=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> =C2=A0net/ncsi/ncsi-manage.c | 59 +++++++++++++++++++++++++++------------=
-
> ----------
> =C2=A0net/ncsi/ncsi-rsp.c=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> =C2=A04 files changed, 35 insertions(+), 29 deletions(-)
>=20
--=-4gVP4YCV+WrZOAEr2wTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ7oqLAAoJEJ0dnzgO5LT5REcP/jI7h//PUv84OHchMHs22VW9
ynOtuApO5s5oUABPEMEFk6Yy1vVPnj1YbdkrSXvrTnjsDQeQdrRqfnNURY5KaqIE
Zb9qPSGewUjMn3a7t5wKWHbpRCahHK1yrHSNuxOzk1OdjZ1TzMrQZkL5UWGJuVfq
O4IRO3d3YZj/m+v0dF+/Eki2e0aJsdFRHmoLu14ZMyDGC9z1SKFjBWK6o/5N7CZY
jCjgmnv67cYJywVPIOcbGSDsgXGunlP58OWReZFJU/wiuB8DF8+J6rY/oF5+7FnL
lcLHq4MM3rv47CoTVN845VAZu9Zkb/V4v8lH/AmDWdcuKzB69edgK0EWonMemkc2
eMTqHEXoVvz9At8PwGFPnM+1eZsYVinUq4lFCSMaaOGQL6TJva0/hbC95mrOMqWd
KJx8gjCEIrpToKGo3dbudXDv4L2J4tfxRuerQQAbswyinH5fm6b/v0l2icCJuTl7
uirfPMfePXGgqG+6sBOvVh4t4BLfe/E5+3Z0khAtyiPN1vv6NGWP5GQHdV13GYgp
vFZ9zzZ8K5KW8KlxxOQwUHrvSCTj62Hc1ffF/JvwRHk5nINyrbQeTW14IwkDkXqL
T94MEFcLQZ4l6urlFMazECstRo2zDHEqBXWvXM1Bg+re1gQzX2R9aP1juKavrsu6
/2sdnb0RXcCTpnoYC4Vg
=HLT9
-----END PGP SIGNATURE-----

--=-4gVP4YCV+WrZOAEr2wTm--
