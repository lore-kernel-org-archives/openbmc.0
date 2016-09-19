Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdMzX1PQJzDsMT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 09:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kK8cC6GT; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=T1czCp/k; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D7BC20689;
 Mon, 19 Sep 2016 19:48:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 19 Sep 2016 19:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=6LAA2
 SKAkUiMTpNdsTa16T5Vx8A=; b=kK8cC6GTSKsHycpyMmhZRHvYNSNS+RQ4/YH4t
 Qrqn6ftM0xEpZIRQqhfNAgBZOuz/1vdR7b9WFYxv0vxsFUJWM1edAKMCy5yt1K1w
 P/lGkHOTF5WT6l6nH7kxFIfMKI+LP2P5FryzQhnwbDk8+Ngcq2sYLzcag0jNeD0F
 TQnVYc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=6LAA2SKAkUiMTpNdsTa16T5Vx8A=; b=T1czC
 p/k342SqV/sE0pZE1LncUSfAps2ablNhldHipzUouygQDLJS905pAIoOursOmx0u
 fer2GH0NMvxZgr7lJUOFUtNy63qbRbT/ebjm67hM4uufaG009fd7Zv8wV56wwz3H
 OjMyn7hyIxMH42c6vLVrChR0rVNOpCjpXiYFy4=
X-Sasl-enc: nb9advU2yx2Kua+r/GXkXH6hCRMPaU2DfjaMIFUjzOHu 1474328933
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D46B5F29D9;
 Mon, 19 Sep 2016 19:48:52 -0400 (EDT)
Message-ID: <1474328928.13249.62.camel@aj.id.au>
Subject: Re: [PATCH 03/17] Ensure that the old style MDIO interface is
 active before registering the MDIO bus on Faraday style MACs. Without this
 patch the hardware may continue to expect new style commands, yielding MDIO
 timeouts and general lack of communication with the MII.
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 20 Sep 2016 09:18:48 +0930
In-Reply-To: <57E06B68.6080205@raptorengineeringinc.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
 <1474246308.13249.46.camel@aj.id.au>
 <57E06B68.6080205@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Y1kSfFXGaMAMZVBv7QLZ"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 19 Sep 2016 23:48:56 -0000


--=-Y1kSfFXGaMAMZVBv7QLZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-09-19 at 17:49 -0500, Timothy Pearson wrote:
> I'm going to manually re-send this.=C2=A0 git send-email was the problem.

Ah; should have read this before replying to the previous email. What
was the problem? It might be helpful to others to explain what went
wrong.
--=-Y1kSfFXGaMAMZVBv7QLZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX4HlgAAoJEJ0dnzgO5LT5HekP/3Ry06nKHtc1PHX5dYxPBkoI
uTGBCHUZRU89mk99GZQ4z4D6WC3NkuZR0OgtZQ7mRJKoRfhdsniu/rGD/FDNuGkE
0TKHcY+db1ys/sMuUyZrcMkUVG/NXgPri5zQpL4pAq9xrBcrCnZRlbIelG+uznz6
tZYlOss8hbWihqOTNWlUWWjSxO2AN0xr5Jh7Ax2isyyPlRAJphGidVh1QRRt3XcV
VXCORaEAJsw/znrllHLYwR1mdV6W7oDEstsdOpUujRQOi1lSnzG63scBr9LJNIKB
dX8F3Dhv+9gC5304sXbXUAF1fqB0kAa/UagbPIJAeFwaCi65IpAYKGv/E5v/PcJT
LCPS+GgA4HrTzuwJLLBIsIZoKjWzWIpJM6eCVwdGZFt30WMxdoitOm2TjhAa+K/T
vboVWbrfzR3yBrMVdDdaTgb9ZO0otY60qp4CzQu7wEFRwv50kYfYrOC62OC3vRQH
7JPqxmwTrbNPQgnM4WCpTNwXwhUOSodPUmRT35Aazg8gKGeKpECsowJOwb4qBkJB
wzmM/fj/5SYhup5mpz1+cDPHFyX5KNiHPIbsWIvBMZy/ZDq+bUIkmbWcya0Rl+Cs
8qgJ+PLaygu0jO45eHZAXxSffkhLjIFlP2oQmxmm1uuVtbg5mV2kRoDe8DLAPrVU
WPyQ0BxEhKMoDW914vsg
=/JXU
-----END PGP SIGNATURE-----

--=-Y1kSfFXGaMAMZVBv7QLZ--
