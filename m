Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhMgf5GDrzDqYs;
 Tue, 29 Aug 2017 18:46:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Uwr/pT3h"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZUx1rmeT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2892B21385;
 Tue, 29 Aug 2017 04:46:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 04:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=FN4MxpF4Kl50/esGRlE+XTdgA9zY/R1wdu5l4PLBA
 Qs=; b=Uwr/pT3h7DjDUtJeKfwy6hO6Lm/nnB1xmsJffja9inbZTB/1ajus6URgS
 bWKuC9eCjFTWnw2uVtqYAIdkzYRrGF/T4Q09k6as1XmdbXzv82Uc3Av/V66dOAij
 McWqJc4d4BVns1XAfY7EQeinqXGMbNthjAQQOlv7Uq66wMk7tK/6XMJ8q5JmWN1N
 I1DFIb2172ZBhHGzkwzIRfk97t6DmK47Mho5S6pu37oPaeQZLnPmLtBnF4h3xolC
 xnjPenwOJeuKj80ZOkfgkaddDZeQJM2GQ8FmtMD8gI1473sYIGf9CsCHSYyHraVl
 VqcgoKcE6oM7rPxqBypU5JdBLf/uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=FN4MxpF4Kl50/esGRl
 E+XTdgA9zY/R1wdu5l4PLBAQs=; b=ZUx1rmeTyjCeRPeswiH7tCwEl8cxxF4hGz
 8hzzeaM+ob8dIwfxNVDKotTKLnDd4RW1X8OzCO1yxi8hkkukbTzx7IFRs9IPWxpa
 5DQKNHHpS9+n2HJplUEAW+BGHv8ivZOICCv1WAobR/qLjXL3FuvmMrAQ+Hmq3/x2
 qp8bxQvU9RxiZ4mjVWUmai68CW0iC8ZmqsKviXSgoRzPdKLOjm66bHFfUpOZwU17
 Biz/uwoDKjOraU5G47dxgdNnEs/AITQZziRv7OeTiSDs+ijYpvw/5vVRW36QHDmx
 DsMRvA4C6kcB0h1pTS+hJVqB62Oa3RKFsJBnBI9p0EQai74kZdww==
X-ME-Sender: <xms:7CmlWRdzcBOmetiBYtfGJoENptNjbfNS0dxRea3zTQskq_58rmy3xQ>
X-Sasl-enc: /vtYPGuNCORVGljNroSOhtyKXQAMJ/dBtztN7WHZM7f2 1503996395
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84C737F9D2;
 Tue, 29 Aug 2017 04:46:32 -0400 (EDT)
Message-ID: <1503996389.5933.9.camel@aj.id.au>
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
From: Andrew Jeffery <andrew@aj.id.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, brendanhiggins@google.com, 
 benh@kernel.crashing.org, joel@jms.id.au, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 ryan_chen@aspeedtech.com
Date: Tue, 29 Aug 2017 18:16:29 +0930
In-Reply-To: <20170829084508.edybxf6zctgx4xwy@ninjato>
References: <20170815072102.23067-1-andrew@aj.id.au>
 <20170828160702.x45hagij4kkm5zzc@ninjato>
 <1503989809.5933.5.camel@aj.id.au>
 <20170829084508.edybxf6zctgx4xwy@ninjato>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-atHR4LNRxbeydv6T7sas"
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
X-List-Received-Date: Tue, 29 Aug 2017 08:46:39 -0000


--=-atHR4LNRxbeydv6T7sas
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-29 at 10:45 +0200, Wolfram Sang wrote:
> > I'd argue that Brendan's patch should go in for-current as well,
> > because it fixes a divisor rounding error for the ast2500 (bus is
> > clocked faster than requested).
>=20
> Hmmm, pity, the description said "potential" issue so I decided for
> for-next. However, I wouldn't like to reshuffle my branches much so
> short before the merge window. So, would it be OK with you that you send
> both patches to stable after rc1?
>=20

Will do.

Cheers,

Andrew
--=-atHR4LNRxbeydv6T7sas
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpSnlAAoJEJ0dnzgO5LT52FMP/0msIRm4eNiY5zCU3cDhPzwu
xtiEkh9xbUtS39IEVEthjU6xop7gk8fED0xdoW8ZVqwDNmHbcoAuKe+OrjUq6hf1
UQ6iM5KzFVdzpiZYaStheMcZIyiJBcdd08xKPPVEoR3K9jRcdruh+X6VVNWshmkr
Lpq33lkAIML+FB3Z9pkQN+IZOYfPhKkNyXxzYC2e/pO8qpejl3oQIsxRTUTNrSKm
7tAFSQcs/KUF7Mf9RyoCKIjpGrY2fhRGUzcOg6E9JTpqDklvSKroQtA3HtlJK1HW
CmjRE0rvbDrcu3TZsRDjgwoV5FJAyek4+lZqq5CkCgZ+NJb6v6LrL9ERduj6O7ms
DLODsjMPNgAQY6V5v6GpqoiahDjiOj52nDTjcYvH4UV02Xt/QabUjT45Je6Ir/60
+D7YSk3YStpSuC5JhdaXOuMaYbpV1IvM0z0aMquGvTeyCtJaHvhwuHVN/ME898Xi
FFbtBCDj1FRH7AtdmmvYt+HK3PSGQL+HtRjjEDi24h4eIonMMg1XkLLZ9Xt/2UNT
uLVJreShMH4NOpTsW2sPpq1rNNXGKoefiRx8kXX1Ks38pKXnOGMHLoctxlER9ZEj
UHtlf/cHwCuo/YOABpl43SVN8sAYtpH89zWu8bkuA8+pJo1UNqPyavQXbNsLK3h0
CymjDnN3oN7gVVNw8m8C
=YSuO
-----END PGP SIGNATURE-----

--=-atHR4LNRxbeydv6T7sas--
