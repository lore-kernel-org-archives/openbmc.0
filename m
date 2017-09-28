Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="X5ueBy0q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lGY3xJ2u"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2kgQ2MJ2zDsPp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 16:05:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F100B2124D;
 Thu, 28 Sep 2017 02:05:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 28 Sep 2017 02:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=xlAkXrfy12QO6gt9p1ujRvHel6qmrn1GW9UQFKxHl
 7U=; b=X5ueBy0qTGIdsOKmIDCHHwlhIuMqvHDrvL5t2KTBIHoVIk3Z5E7BCQi/8
 CYjdd86ugiB8XcUBc7M0o08uimu0yDQ16S308syTp2vmWMERaQKIyPnqnxFDNYzV
 hckRwmnSS/+nQ04Z8uKN7JpCi8OPc5w8yaij1s3HHsuv2x+XysyY1MlsbeHYl7sM
 8w8rV1bsOC3AQ+4OZCcNe3648Ytw0nBBFXnOzGGVP2mMj1O5riRb7BJITtiPomhg
 77I8RkFMdOZQGn/8xVilJvDHo9kiD0Dk0XAAPLgKaEnoZgjyE5xinyvx8Bdsuqu4
 KsZUJDSGGwfZPvbdDbFhNBDko7vqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=xlAkXrfy12QO6gt9p1
 ujRvHel6qmrn1GW9UQFKxHl7U=; b=lGY3xJ2uHyup6vz8ZwcI3J0kJnKzCXF2SA
 uZDFdfPi1Blk/6wmSIvbg7MaX6KFlKJaLXs5mw8FXj24s6X1EHdWNjlBXPdr0lYA
 9SB7v6J9qs+h98/9hv1gs8xNo8WIRGMUZ4WBA7D6x0vltLdDDAqnQQZKq2jg2TFK
 mzG1vC4/qYnxQZuCmWbjaJq5CMVTsjIsncRou2RUwgJDgPi48MZdmf4D4v6YnATY
 6QBVM9HQrNJHPQM4ugWwiGZh9hevQmwFd1s/2kaJD2VG+K3sT3jw8G4AxAzqaGCG
 ITMvseGdOxiLogJYECsebtfkXa06hNsUBF7iR3xwYQyOGzLbf5rQ==
X-ME-Sender: <xms:DpHMWSur3Xs5SgN0qf65l4MVIQr5JkzxyZbl6IRIMqBJg2-GoHiDQw>
X-Sasl-enc: Adotiwtp6Y5llYoKYvpYyySLiZbqX4llPk1+1Kvb54jn 1506578702
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7EDBA7F92D;
 Thu, 28 Sep 2017 02:05:01 -0400 (EDT)
Message-ID: <1506578695.5388.3.camel@aj.id.au>
Subject: Re: OpenBMC growing leadership
From: Andrew Jeffery <andrew@aj.id.au>
To: Chris Austen <austenc@us.ibm.com>, OpenBMC <openbmc@lists.ozlabs.org>
Date: Thu, 28 Sep 2017 15:34:55 +0930
In-Reply-To: <OF7D68BAEA.1296BECD-ON862581A7.00632E79-862581A7.0077F790@notes.na.collabserv.com>
References: <OF7D68BAEA.1296BECD-ON862581A7.00632E79-862581A7.0077F790@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NOVc8vuKXIW5Skl9JdvX"
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
X-List-Received-Date: Thu, 28 Sep 2017 06:05:07 -0000


--=-NOVc8vuKXIW5Skl9JdvX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-26 at 16:50 -0500, Chris Austen wrote:
> I wanted to let you know some pretty exciting news. As you may be
> aware The OpenBMC Project and the Facebook OpenBMC team have been
> looking for ways to work together. Over the past few weeks IBM,
> Google, Facebook, Microsoft, Intel and OCP have been talking about
> the code and how to create a common stack for all the world to
> reference.=20

This is great news! I look forward to collaboration with and
contributions from all involved.

> There are plenty of items to work through (like finding a hosting
> foundation, Governance, etc) but the desire and momentum is there to
> work together. Be assured that the goals of our OpenBMC Project
> (which, as code contributors, you are part of) remain the same; that
> our community is open and the code is designed to enable your
> business needs.=C2=A0
>=20
> This will not be a tear up or rewrite of github.com/openbmc. The
> OpenBMC Project repos will be used as the starting point. I saw some
> presentations at the Dallas OpenCompute Project engineering workshop
> that gets me excited about the future. You can see the entire
> workshop here... https://www.youtube.com/watch?v=3DQFhEbXkHd0Q

Thanks for the link, there were some excellent talks. It's essential
viewing for people wanting to understand the (somewhat complex) history
of the project(s).

>=20
> Let me know if you have any questions

Yeah - can the speakers please share their slides from the workshop?

Cheers,

Andrew
--=-NOVc8vuKXIW5Skl9JdvX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZzJEHAAoJEJ0dnzgO5LT5lVsP/2TwSlzc8h2xMdhLTcglWVU3
T6aeC0wuTQW545y/pJclfHPmwwspDAngYLO+ggKR8WEk69U5OTTdEV6JYnmMmaU0
/dvYw/LcaRWKlwyg39OWia7/3uq3EAxmtwRWnXMNEHVJbyGUXP6Vj2pD5ImZsDvt
/w3DT00jDIwRhft5rdAfmyz+LAghPMBD132K/QwRr3+690iQgaSjKpdrnYaFc6C2
4cGjgnlxhXwhdWWdEUuI+qzB2GB27AZ6jRSIoRx4CRTl6QZYAP9heNB9D6xmRn8i
Pw2UdpKNpSuhvPUkUg9YaBzgGNoz+3IwM91Nk4Z0oF/BM0ybmj8k1AQ32qfzwrAk
d/2RJXb0b0TYGhpzgFXCUe/Bcjc3arVWSW8peU8BMC+bptaJ90ZNn8ii/rZ4KYbY
rmf9rgLknW5R6k0LzoQVz4qKfVvXrznkWLImUCiBycw3mYtEejxVnCtFmIorhqI4
tgmiwXlrrLBx32mV7b7gfa7oRzTE2gis784Wv0DBTgtGwAKSlbeFyN8SW9DpZIxK
yvgcsu8rZGG448060O2RcymVu6Vx5V6jAvu5TWd3Z7y36MEHUSNTf6EeqNYrSc1j
OYft4ODns0BgmLh6z+gRdTlhqtC/Gl76GzUx/icSf6q2FuZ7cNz11qlhZish7wcu
LGlbOoTNCvc3adg7xq+n
=C/1T
-----END PGP SIGNATURE-----

--=-NOVc8vuKXIW5Skl9JdvX--
