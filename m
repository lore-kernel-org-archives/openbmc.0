Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mAEpYnP5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="asTXSH4j"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGY6b6VQGzDqlv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 22:36:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BBBE620BC9;
 Tue, 17 Oct 2017 07:36:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 17 Oct 2017 07:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EGRUi4mkPWqCLs3YgdbNwnPgHu/gTGlmZam+yVUBj4c=; b=mAEpYnP5
 bAogoARXme6kAZmdbNciBh3W5DS7Yh4gMoxMYU1BrJyeFOqp2pk1tqJ2aj598MxJ
 WYjb4wqMRdzgWdxE+sm2m5VAG/u9YTEXBV1CENIW2iB79hHPk4Oe3GTtR3iTDQnK
 b4MvZuaRNrTR+LCvZFrHdwWEjH8mt5kHZDQXVeUTRYKKrcMA6s7+GzPRrKVbQCkG
 KTJuri7jOGUjTEDgEUBpafkxSJlFN6FBUjmmOYVUVyv2XyK6QaUnAN0d2hHbrsPn
 ZKxvL47/CVUyYngxWbVrv7i/TiEu1efXUXHC4OxXuCOZ7WQlACQJwyuVCplSf1xj
 WiBWpjdIVeT7YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=EGRUi4mkPWqCLs3YgdbNwnPgHu/gT
 GlmZam+yVUBj4c=; b=asTXSH4jr05ZJ7xdgukljdq0zvwcQpVrmtcJEIx3JTZ+t
 CGD7kPqsu09Xo1GRjtcHu0unk6u36d8W2h9VtcWV62N/4qv1vhDn3ZnNilcQNtOY
 sC/eNI/vzndNo89e9HAwfGSkqSTNiYVISLQum9QvSCIRBq0SGs+FNnaBTvmyqkQc
 C6Er33QRwJQFx0yI3aHMQoqIQ5WxCsV4aJRvYXgXHMnjv9x6PjUdDXzvLF9xbh6b
 LWG/bFy53vxEYNramfJ4TZR99VfN64MWBQMAqukmFYYVmU+uMxXSFc1YTobMx9lS
 4PACzi3JiQKAVcWEiqmia2VqekA8dhPzPOpGxlfDw==
X-ME-Sender: <xms:JevlWRraRjTlnVfL8Fsh7uD6dLwCwfXrAP7TAaxM6oUYx1uEbNoNtA>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7501E2479D;
 Tue, 17 Oct 2017 07:36:02 -0400 (EDT)
Message-ID: <1508240158.24322.16.camel@aj.id.au>
Subject: Re: [PATCH v2 4/4] watchdog: aspeed: Move init to arch_initcall
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, Ryan Chen
 <ryan_chen@aspeedtech.com>
Date: Tue, 17 Oct 2017 22:05:58 +1030
In-Reply-To: <CACPK8Xdz1iK-4bqZfmfTUYw3zDLxCniwt6LupJq5mo-CCca3XQ@mail.gmail.com>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-5-andrew@aj.id.au>
 <CACPK8Xdz1iK-4bqZfmfTUYw3zDLxCniwt6LupJq5mo-CCca3XQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jY4S5v9IgRxn0LWWmsEZ"
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
X-List-Received-Date: Tue, 17 Oct 2017 11:36:08 -0000


--=-jY4S5v9IgRxn0LWWmsEZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 15:43 +0930, Joel Stanley wrote:
> > On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > Probing at device_initcall time lead to perverse cases where the
> > watchdog was probed after, say, I2C devices, which then leaves a
> > potentially running watchdog at the mercy of I2C device behaviour and
> > bus conditions.
> >=20
> > Load the watchdog driver early to ensure that the kernel is patting it
> > well before initialising peripherals.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> I agree that we need to make sure the watchdog driver is loaded
> earlier. I think this is the correct method, but I'll defer to Guenter
> on this one.

Just following up on Joel's comments: Is there anything else I need to
address?

Cheers,

Andrew
--=-jY4S5v9IgRxn0LWWmsEZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5esfAAoJEJ0dnzgO5LT5BfQP/izJPdvy7HsiMTr/51oUwhWQ
zKfVa2ubmVOoHYeEJyerDKIAj8wMBPZNHPsYd2/MLZ5u6PwrrRQ08dQehPy3giKU
1pPtkgdYl+GMvfjzU/IPaaA80yObzwZC4/oXpq28peLQCJZKx9zpx4q1IUVG1f6R
c4rYxovSHDt4993ZA5TGBw1W+EPR6yZ1dGNvpfK8skpRpqs7/ZkwfIoHD6BLiih1
RupCrKlZGwGfwoXdizDhbmGxI5cXEsysLPFzLq8oXqFLiijE08oWGECqjkLf2UvM
yjDap9mhPK11LAy3G7OIxsRD2MRKh2VfyJ0fv6fEX6Ep5hnlWyuUzN2IlQyb61VV
UTaucK/H1F0EK1XJ4kTXB5Biza2X3ifo2ni7HG0Fp68U5L7bSDpCz+jFsRvR5A0D
kGLwNRtHe3NqTCqT6VjifawunceIU3yPcPfd0I5A8a4w57R5zvR+vfVpnGLyyb+H
lZv3joZcImFmmG9Wg2c1eY7oulaleBjrL1vqXjcjhFHu7+CMquQoo47A6NuYR9nY
dFbolNXvfsHOiz8aKGCpJDydGav6VrCTXfpEVCKrQPFsKRuDOfI3IRMf1VZQh2ak
Uahikn8ReA/yvRQW+OwvKjiwzHjfUyreT330g/JXDUUTnBy2KV0c6y0Xls6Ssk28
h06lPSnD2GTHgletGOpW
=aupq
-----END PGP SIGNATURE-----

--=-jY4S5v9IgRxn0LWWmsEZ--
