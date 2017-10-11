Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rSd2u3rN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XB9ASjnQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBfDZ3jDszDr5T;
 Wed, 11 Oct 2017 14:12:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E84F920BA1;
 Tue, 10 Oct 2017 23:12:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 10 Oct 2017 23:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6s40eiQsqODRp4AAold0fb5Ki6IKIX+m8rFrDd4u8
 Jg=; b=rSd2u3rNdcHscP8o4sgdICzN+hRfqUd/NWuqeA9XXgjF1UrFTzEJDjf19
 qtz5F5MWEiYp7DDU4scf+qb03WadGaT9FDXoasdUUqQ8xdYHudritlP1FXlW1fwb
 xFn6pBglO8qQ4mhXHinjVmn33kB6fiqOusjRTfZy8MK+o27yELbW5zFfiaEVUdal
 aF4/UBVS68L6LAF4l3GHKlJwLnMrqsHft+pTDyBIbOGlMJ5WBhFywAtw8sPR+O5/
 ZqsqX/2p9yIWJ873t/2ZsH8lS5xfe2oR3512gMqCH7zUFhXjyiPaM7jdkDJZxfvA
 +X/4jwA3WyArtjLMdJCns8OFNYxfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6s40eiQsqODRp4AAol
 d0fb5Ki6IKIX+m8rFrDd4u8Jg=; b=XB9ASjnQDCdWLoc4/ZHUKV8GP6KQvgD0aT
 i1oh5B+PzuWOWMCWSlCj4fdoFuKkQj+nIYPlcN4bCvmZFVEeB3fg9cdwkzD9iQCu
 uuEhg3sL+VAyp0afqjVb5RZNKc36ya5yB+oCUc4m4kU009Sj2h3hcKTaR3BqW6zN
 HAKjiqV8c8/LjqDCvUVyIh/kxUDge5/YUgqD+FFHYcxWsgf+MtYdIvcUKk+d6qll
 GgH7yg9SCCROP4Xe4uReawP86zi+hPmJAeOmSiy78MuxAtEc2x2iDlye3qOAHasY
 zsZiJjS9Kqy7JDPLdFA1vnXvwbwiTvtvt16E0nxthzu//kM1uTMQ==
X-ME-Sender: <xms:K4zdWbDUdDoGV9dIiznwak7GJ4m74pBn5qQGpfrwR20P-wHcBQkBog>
X-Sasl-enc: 4Y2XXdXscyX7DH6dFcVVV4mKU7+OLlD6OZLpJ3FZD2c8 1507691563
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD72E7E3DF;
 Tue, 10 Oct 2017 23:12:41 -0400 (EDT)
Message-ID: <1507691558.5452.172.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Andrew Geissler <geissonator@gmail.com>
Cc: Chris Austen <austenc@us.ibm.com>, openbmc
 <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Wed, 11 Oct 2017 13:42:38 +1030
In-Reply-To: <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zSQgGbrdBTxeImjbYSGa"
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
X-List-Received-Date: Wed, 11 Oct 2017 03:12:47 -0000


--=-zSQgGbrdBTxeImjbYSGa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 09:55 +0800, Lei YU wrote:
> Vote+1
>=20
> I always wanted such a repo to put common/shared scripts together.

Great, it seems there's a fair bit of consensus on this. Did you have
any scripts of your own that we could pull in?

>=20
> And even more, what about a repo that collects the common/shared code
> (C/C++)?

I feel this is a different undertaking, something that should be
addressed separately from what I'm proposing. My move-fast-and-break-
things model doesn't really gel with developing the low-level libraries
you're talking about here.

Cheers,

Andrew
--=-zSQgGbrdBTxeImjbYSGa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3YwmAAoJEJ0dnzgO5LT5xYoP/390KfyCFvULBQPWXDNX+Pm+
8BYwHOw87WGseS00hyUc0jUNM4Ts0Cf7zgxiKhUxju5su/EdAW7ohbmj6pOB3Nx4
i1EPWFZ1eh/rpg/4qwwcxZU6GcMH5Snq9gkJI7xWR7/MV2hQ50JpOhzU2U5xkIqw
xnPIy+ttegaMV/qyxdTqa0BP/zYS1iMPaLcyxyhxwtrvGnl7TGeYtXHxWfzsAIKn
wu3yz/efZ1ylVSlwrVNFryu/BtW4foptjytx7eExaFLqmI0RM+KAj97c2uapI8t7
A5rMTjr/4EiTQvkTU10S1BFfo5TeecJIJ1QVwZsMN1ndtFJo694Pys535bV5rc9v
zZrvBajTWbFEVnkC3JuTh3F7jNvBTD3/b7cfsl9ga7OMXWf2Jt3ms25yF7gRilei
4bVzBmIL2OiUP2X+YN1eE1z93uBeEUkYXNdu0nRJcMiuOyjEW7X6jLMlsrU1Yy01
C1z8DdcR7nZAXO00iJVAEZvFBoQCIaN3z8N1/ZybZf4wL88CB15BRtjPztmh9uu6
5eBBvRAI/dbDzAeOfj0YD/4IWsxRwEumyROH3Rfw9FbXRQgqZxwZIfyPAqref0Fc
vqI0Gt8rW0bLXwULBipSm3m4UqmB5nNnw40GcS93uDOMcgth6Mz91IwBxuU+0XyZ
dA4lRBSMnY8Wdo1iJtsH
=dkYs
-----END PGP SIGNATURE-----

--=-zSQgGbrdBTxeImjbYSGa--
