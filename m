Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t93ls2QCkzDvM2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 12:14:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V+j1amtR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oiJsZ27d"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5252E206CD;
 Thu,  3 Nov 2016 21:14:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 21:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=p6zV9HPHkHtfdLrlUnRxGazdugw=; b=V+j1am
 tRyauDbfh4KdnDElWHJQYTJdTm8O1M5FLIWurThYf6FSR+iw9htBIgA1/irHe/IL
 98a3kh5S8jwRE8rhL0J3lX0YcaoPpFnEHo7+nCecbfptcp0ulreOO/Osu9CuiW9W
 1RCK54pArBj+Xqf3eLwg20TCHRY/h/C+3Vvh0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=p6zV9HPHkHtfdL
 rlUnRxGazdugw=; b=oiJsZ27d3j5w++jzeKNOsR2nxusvwfQ4t9cACFoX0CUXWi
 Fx+kL0CQh/1J3j3NCqVM9w6bBxilIMrDdC/j3m7MUljkUrdtv6Sc0bOU6/K1VcFY
 nbjmyiyD/w3LGeWEeF8xdmlKKYeh2eBvVzjl1u96eaOcKOgs/yURX+qKo1KPk=
X-ME-Sender: <xms:B-EbWJ1A7os1KkTkmYj17pnW1VL8mQ-vmEzsi-zKI_SAspnEiLGNlg>
X-Sasl-enc: oyEbvzLPjR1IAKlDv56PtjYHvJnVcxKoBHHHVx1+wVbd 1478222086
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18D26F29D0;
 Thu,  3 Nov 2016 21:14:44 -0400 (EDT)
Message-ID: <1478222081.27396.43.camel@aj.id.au>
Subject: Re: [PATCH 2/2] arm: aspeed: Set SPI master strap for all boards
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi@google.com>
Date: Fri, 04 Nov 2016 11:44:41 +1030
In-Reply-To: <CACPK8XdWn91bXBgH2CRu=vNKNQWSc6VjhOcJNYcS37F7bC8kgQ@mail.gmail.com>
References: <20161102055557.24349-1-joel@jms.id.au>
 <20161102055557.24349-2-joel@jms.id.au> <1478088662.27396.5.camel@aj.id.au>
 <CAPH-5w498pdxsc22+TSMY4u1hEiPmWqrQMa2j6bQzuUsqGkG1A@mail.gmail.com>
 <CACPK8XdWn91bXBgH2CRu=vNKNQWSc6VjhOcJNYcS37F7bC8kgQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZTOPTcndbDLXS3zv+p58"
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
X-List-Received-Date: Fri, 04 Nov 2016 01:14:49 -0000


--=-ZTOPTcndbDLXS3zv+p58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 09:58 +1030, Joel Stanley wrote:
> On Thu, Nov 3, 2016 at 3:10 AM, Xo Wang <xow@google.com> wrote:
> >=20
> > On Wed, Nov 2, 2016 at 5:11 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >=20
> > > On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
> > > >=20
> > > > All of the ast2500 systems that we support have incorrect strapping=
 for
> > > > SPI. This commit moves the Zaius specific strapping change to the c=
ommon
> > > > ast2500 setup, so that Witherspoon, Romulus and the EVB can benefit=
.
> > > >=20
> > > > This moves the strapping change out from the Zaius board version ch=
eck.
> > > > I don't see an issue there, as the will still be correct for future
> > > > boards.
> > > >=20
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > >=20
> > Reviewed-by: Xo Wang <xow@google.com>
> Thank you both for the prompt review.
>=20
> Applied to dev-4.7.

Just noting that a this will likely be backed out in favour of Kun Yi's
patch[1]. That way we can configure it in the devicetree in spite of
the platform's strapping.

Andrew

[1]=C2=A0https://lists.ozlabs.org/pipermail/openbmc/2016-November/005393.ht=
ml

>=20
> Cheers,
>=20
> Joel
--=-ZTOPTcndbDLXS3zv+p58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG+EBAAoJEJ0dnzgO5LT5hrQQAItAov9CZHB7Du0rv2sX54n3
JRQhER4I1VCdZ0eOM5qJnKUh4Kkliwow3CvSot55IQMQblSKyQgBtbkDzEO/5FQY
LI3WSluljiSADP/GAzhufluCzjpsoWNT8zLgnC5G9PqlJaZbdUfjgcHC4v5OuBkE
u7wBaiy7gmE6l9RJBID3tjZi4lTy8Xm/816q7Oa8bW3cvMLNE34KJxVxJhiUu73J
cMrx82JF/Alac0q8HB2txAdyJ8/QDza/eZIfz80v+wRjBV902s73xLOz5/Ea/0lo
GBNcRzWryoh41Nm3JxrxZxw1NP8Kez8VUFfQN18Vz2sfsxkTghlzFywVWqwq1XF1
6wjSuo9cajXyoXka7MoHmZVNAjFYvwg7UhBt3CdiMZUhAAXOc+66FcUmQoKtew+f
stpDRsqg517N+B76dh6Zd+2JggJ4sqb+3tY2OV7Juz9zuUKZngEV+OeA0QE72KBd
r4QAUrwZf7ede0KyL83d/iARTNRoJEFesaN1iLxbhN2GM3mzAqpy6DSf9nwSWBLR
0KsOmobXrrrhej/V10FFNrG9jJtqan9SYZKGOYuetjO57etOe06Dn7OXGc44CVN/
fVOELGLf6TBdItPBRHBi+1yJauLuL5lbB2+N/+fTxMFsjJAkvOojDKeDdUVKvOO4
jvatDzckbRpDa7FyIif9
=uhS9
-----END PGP SIGNATURE-----

--=-ZTOPTcndbDLXS3zv+p58--
