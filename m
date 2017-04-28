Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb2K3TzzzDqFb
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pCWIDYrc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SbgNoblB"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 62DFF20AAB;
 Thu, 27 Apr 2017 20:55:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 20:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hZcNBmA6RrR2O6mvBf96/AcygZnShCKoBXOQ0UZ/F
 rE=; b=pCWIDYrcJTsIhBVKWSfQCABW3XQXWqTfkq+QqnBNSDXtpyrz7GSjTHOci
 5s53+yh/cM+V3yhWdl8R5ULbNMpGE9PZv1YOeK/6fv8dLT4yic3yFuAYwSHeEmnB
 sRjBmadZNajNlmdMqqd6JsQqDdZzWBNSpHTwyzFMNXZd4te4q6wtRKrfyBRalbKH
 gO+OjVqLvpvE7Ra+isAsMUaLndI46O2wmYXoph9UcnlwECJy6aowb9pE7BwCKvK2
 3oeQc0FK/+G3GtvSvrd0DEN5aL31TNm7W1ehd3BlGdxFhwF9aEEomCMlNQCB5Foy
 Mh95hdHca80hDoxCr4jRnNPIBwcPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=hZcNBmA6RrR2O6mvBf
 96/AcygZnShCKoBXOQ0UZ/FrE=; b=SbgNoblBgmU/fYXYc1PlW4I7OsL0Y99rmt
 ViyfkYwN9kIEoyZSY1qthD+frNbR3Qo0Drt6sQkCzKR+vJfqTwpOcD2wzsUFBRNC
 SR2MSlg6Vxj+u1nuAWUgFkLjlXvZArtPFezx0RFm9NnykN4EuGO+vlHIP8pq8rcz
 oOJqNRe02FlvkttryoEuoJyflMo507sEPNMTfNl9v5gJHeOER3EkYQQ/wQ5TKKjp
 C0X/LAfOPnT4gzptsiLISSWfwTTDT42vLrCY9hhxHT+2buJELPARJ7VvO+t4TxHL
 acM0ee5MbJ7DuZsxL/gp81+wgHUADHDmNVMrxZBllHZgeeMWXMGQ==
X-ME-Sender: <xms:55ICWSjqhqtSXG8_TVZW0KoEkXRFAIs1m0jk25rKVmdzD8qcKdK-Lw>
X-Sasl-enc: VzBFaemf23LsTp0O/sqFuYKDuLqyhwcNeu5DGGDMKVze 1493340902
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F142F248A4;
 Thu, 27 Apr 2017 20:55:00 -0400 (EDT)
Message-ID: <1493340897.4433.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 10/10] aspeed: romulus: Remove manual CS
 decoding window configuration
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU
 <mine260309@gmail.com>,  Rick Altherr <raltherr@google.com>, Xo Wang
 <xow@google.com>
Date: Fri, 28 Apr 2017 10:24:57 +0930
In-Reply-To: <CACPK8XcVvwdkkttdx4DZDb6jsbym5+6HZk1TUcwOTMC7bWKktw@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-11-andrew@aj.id.au>
 <34e26925-3142-9917-feac-eeb17d1eea13@kaod.org>
 <CACPK8XcVvwdkkttdx4DZDb6jsbym5+6HZk1TUcwOTMC7bWKktw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-S/7TcmPHJcnJKCS/gLms"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 28 Apr 2017 00:55:06 -0000


--=-S/7TcmPHJcnJKCS/gLms
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-28 at 10:23 +0930, Joel Stanley wrote:
> On Thu, Apr 27, 2017 at 4:27 PM, C=C3=A9dric Le Goater <clg@kaod.org>
> wrote:
> > On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
> > > This is now handled by the SMC driver.
> > >=20
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> I will take the cleanups that Cedric and Xo have has acked now. As
> applying without the earlier patches in the series created conflicts,
> I applied these three similar ones as one patch.

I assume you'll clean up the others if they're ack'ed in that case?

Andrew
--=-S/7TcmPHJcnJKCS/gLms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZApLhAAoJEJ0dnzgO5LT5pR8QAI41Inae4fNFP7OG682LtobQ
LNkdyP+9UkMhSsUGANSD7P5nbSo5ooz1ZYB6IFQPRiufIazjMnLMAvC7JsNOStSI
LVCVjKnsPkGGD8ZcOSQ631VflNwOEC9n1PqmtHbjWV/bMHYxw3MekP8iTC9Jej2V
AH6T/6PBHpQKOyVG8w4Cnkqu9k1RJxAVbLjDipZ94Dbq7t6339hQD/oCDwyyp+q4
t2vYqKAfm8G/lvLJt8+5rc2gMkNX2UAH2YHIC8CVAUwVAriiyUijUU3RklqYrPX1
bUh4ZJ9MXhNzVCVqlzJgruRL6SibNG7iJvpzELMJb5oY/MTUFhPYjSKpuSI3ap6S
izSSX492avrKcmGjiSEnaB2NTwHS88ZG37WCEJipdYPTIdvT7x2JzxvGzBjgDnlz
NIgbommHBYIDb668NZYPczk0Qz11QixCwlU+UdBee+P39+KlzQt8rkJOX4V1kvFa
4e4iLFG/94yghehzL7HN2H0RcvVsx2tYhige/DnL8Ul25pv3gZeKTG4d+1ZCdo0n
QoIQ0HhkTnF/qyIqbV3cif6XaKgt43rfcQb51jbfOTll00NtuTxlFOwTGqyPno2k
ziQJWIjGx9Na1vVt/rlMbpbYRaCKFI0sPZrqXpKakv+83Gbli0kGQxjU2PT154CG
d+/S125gkB7TAoPI5lNf
=D0M5
-----END PGP SIGNATURE-----

--=-S/7TcmPHJcnJKCS/gLms--
