Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZzZl1DkZzDsZ4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 12:22:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=QXUy7KBF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Qd3Uscix; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 291F7202AF;
 Thu, 15 Sep 2016 22:22:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 22:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lGJ3B
 3TH1Ac9mxXq98XVFR9dW2o=; b=QXUy7KBF5Cj5AUdFdq0N41nhoaj9PhveQZbaY
 5qOkBaYObTiG6Jt+9CpQMmsADqTuOXfY/KvARJGkKfAc9RDmclkuazkhQa4OaJtT
 oRWd91txNkbP9XUraK2mjB0FxYhC3zeRrRp4G38WS7dLo1b5tL/pZVeFZkEKPTb9
 i+DlD4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lGJ3B3TH1Ac9mxXq98XVFR9dW2o=; b=Qd3Us
 cix/Skfh43F+/3AsPApwQ7GtjZUnyfwhZtw7/fVIxZndUScA9M07FQhIifPXLHyv
 yDOXDrPImj4s4wlH1cq17nACGLq3oCZ4MV0X30j/h4ajjACJ+1Lj1DnjhKdY09II
 C7xEm2QmKSAV5KFCUbEGxdix7vRyYgsBaW0pog=
X-Sasl-enc: fqGCfvs8u8e1FSMmAczvx4n8Y3C+3XU+yF8rygEU6ooD 1473992556
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A641FF29D9;
 Thu, 15 Sep 2016 22:22:35 -0400 (EDT)
Message-ID: <1473992552.13249.40.camel@aj.id.au>
Subject: Re: [linux dev-4.7 3/3] arm: dts: aspeed: Add SPI1 master pinmux
 hog to g5 machines
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 16 Sep 2016 11:52:32 +0930
In-Reply-To: <CACPK8Xcx6s4rt+y1XbJZMCOL9zF82GSge5ciuCpToCtYD+V_AA@mail.gmail.com>
References: <20160915111308.31481-1-joel@jms.id.au>
 <20160915111308.31481-3-joel@jms.id.au> <1473986374.13249.5.camel@aj.id.au>
 <CACPK8Xcx6s4rt+y1XbJZMCOL9zF82GSge5ciuCpToCtYD+V_AA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jx+c7Uuqh9ofgr36aA1M"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 02:22:39 -0000


--=-jx+c7Uuqh9ofgr36aA1M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-16 at 10:21 +0930, Joel Stanley wrote:
> On Fri, Sep 16, 2016 at 10:09 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Thu, 2016-09-15 at 20:43 +0930, Joel Stanley wrote:
> > >=20
> > > This is for reuqired for using the PNOR on ast2500 based systems.
> > >=20
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> > Have we sorted out how we're going to deal with the strap register
> > configuration (given the pinmux driver treats it as read-only)? I don't
> > see a u-boot issue for it yet.
> I've opened https://github.com/openbmc/openbmc/issues/579 as I haven't
> decided if we want it do it in u-boot, kernel or somewhere else.

Fair enough!

Thanks,

Andrew
--=-jx+c7Uuqh9ofgr36aA1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX21doAAoJEJ0dnzgO5LT5d0MP/0Ukv9Tn4McrCjEKHzLjO7eH
7Gqcz6uCeVOJI9QWvvK1LsxluHGCeHUWCG3qJATUWtklqOe1jbFlcNn59Krqx2aY
GVkvCc2P+7No5k6Mr8Bz9SYA/HTrjKAGJXrKospEId68YM4Yl1JPZadIKvop2uTu
nOgCGvm0GcGdv/NKwt8W5i8BIX/GASeX485ooR7XZM82uK4RQShpR/NcOsWYOD3o
082hm/0V2N417RBP0s2InGv70z9RX3+5dwu+usKWhUfpwVlXJ25nZ4q6UWnewJeQ
7KeU+2AmjFmLV1069mh126+lD2+gYva4JbIApdqRB7NU7qxouclW4sYlvnmeorQp
Irai0jOycUW7SOvTIOq9RJCb7raw5SlUws0KJm8ddgEcJhKhTwrtc9IbXFbMeFHQ
gFsz02+GdUZqAF5xqtb0e+wye/RDbQFGZ/qj24nF2MIjZG9mylpj8AQLjpyCNjcu
EFi7ybB6LGRmRNbsciYePLMyAS35QlhQzE4qE8lu3ipc2bFg9+t3lL+TfMebNuro
4YKiqnDYCVaBQjVHaG4PCU4aHRQOdvkCUzg57HXyeUxXM4I5smUfiUE46JaEeouJ
N4fzKcpcxpaeBvoKdreM3YE9w945gc3N2aXrs7eP2bNf9o7tPTU6NwQ+K0oWwBkv
kL9W2+5mSQ88VO/YIpBq
=ky0y
-----END PGP SIGNATURE-----

--=-jx+c7Uuqh9ofgr36aA1M--
