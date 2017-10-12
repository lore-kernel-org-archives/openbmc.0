Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N6kYkhEn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mxscF3+1"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCkbC4sWczDqJ7;
 Fri, 13 Oct 2017 08:32:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7BBCD219A7;
 Thu, 12 Oct 2017 17:32:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 12 Oct 2017 17:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kqcSVWWMrKWUfI9EiWQklmukKRIXv5CqhFCqB9dZIAI=; b=N6kYkhEn
 wdndsl9x6HTLJXxq86sf1IduUwj6DIWwpNYAkwZHolCkS4FfYZ6KXTpw0NK/gK+K
 zpB6P1zZZZFDCEbNSvACSLYOFIsNiiVRTLGVi0SdRwg8IuGW52dj8JEgNmUzic03
 V9/aYH5SxxlYdFPlWDsMa5jPiC2o0NjSNgSnNobjnY5qlFFUeX3lq56xNEhEzibM
 DesbyHM/LzCFK/UEAqYLPRPE4QSS2+VOVukTwoki6iwXZnXh524ibNgRQXccspVE
 g7Rbgq7oqsBi82S0ubxzwo04u+VJ2j+pkY7xSLmS+sUR91ApSRWziC/PAvZeGInX
 JwPtIil/Ka7WNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=kqcSVWWMrKWUfI9EiWQklmukKRIXv
 5CqhFCqB9dZIAI=; b=mxscF3+125qD7bgWZHQLQ2lHD+jEH9JldAw129SvqXGDk
 U1Q4fE0NVKJqlzdLEM5TWVo/O4n8iSpC1MKNJ4Mxwg0OiJzPyUiJuPEyxTL142d7
 GULzwZcVe4xRPXe9sVmNMiZrMGDhbkNRDb0u0HMQvNOV7eb2wpj4kocEPhbzf1hS
 1b1hj+AF3nIekFXrsUoKXinPJzlFkUZpCe5pG1vEfbxZBW2N2GbO8veR+Yfj6ZGm
 SEmK2hyKXaTkGlZyzPG0+SAS3i+K+UQqavJxBOLDW1WOR5d9Mci6yxzN4wXKLFY5
 EoIUFL1jCaWa3lfXe4o+7TiSjBMiIPnl4HsslpF+g==
X-ME-Sender: <xms:ct_fWetTDmeJapyeva3ubgbXcYH42SYUiopvPSti6UhH_Ogq5MfEYg>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CAF57E101;
 Thu, 12 Oct 2017 17:32:32 -0400 (EDT)
Message-ID: <1507843946.5452.187.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Lei YU <mine260309@gmail.com>
Cc: Chris Austen <austenc@us.ibm.com>, openbmc
 <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 08:02:26 +1030
In-Reply-To: <CALLMt=ri4td=9C6av3jHchZwckffmPdxYkztj1qCav2WMmd3Jg@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
 <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
 <CALLMt=ri4td=9C6av3jHchZwckffmPdxYkztj1qCav2WMmd3Jg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fDlxB1vSqOKXrJHuF9Iq"
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
X-List-Received-Date: Thu, 12 Oct 2017 21:32:41 -0000


--=-fDlxB1vSqOKXrJHuF9Iq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-12 at 12:52 -0500, Andrew Geissler wrote:
> Lets do this!=C2=A0 Any proposal on the repo name Andrew J?=C2=A0 openbmc=
-tools?

Sounds reasonable to me, can you create it?

Cheers,

Andrew
--=-fDlxB1vSqOKXrJHuF9Iq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ399qAAoJEJ0dnzgO5LT5DccQAKaipCFwr0xHa8VU1iPz6/kV
OhSpiIQfPxSJ+FISwoXRNnmF8xmGE7fTn1cbkouF/mWMbK9pHIQuoC2RdYc1LhCB
e2ImuE2HbFYAoSb5amhPAs/8KQMBShOquLrwDehrg6KiXzFefd4fRe/46R5/Jjhy
tZnAbS+kmbP5oIKPtqN/KZ78uohMEKCvsZR687dmfhtRyKYd19qgPj/fKS9EgV/n
iY8Deb2VdyoZqIUb8n2YJNa3MQ3GjV05sMo1rxRhTWPKkUC8h0eTSGSuzC9SeWh+
A6OQ+BtswjqoZQ0JOuemHSnsyuv1Drh3GVvt57kJtb4fW/u2BIvshaq9lUVIidaa
/6KR0QCRWgs7aJ3rAn82iaqvBTCw8oQ3EaemYZGQAI/Jzn/Z34fgSfGlya71SFVw
1xKQfnpuS9fKOnmKQg++IKD49mFtcE2OP9bnhZThUpPVXGarTiERrHED2il/C0SS
Pzl/AbS5mhp8F2XIF0cZcA8D3+7mYLIK6aMG03tPr843qlQrXoNGVhxW8SOGmn2d
GCpcm/WPPfDUJ8w6qY0UXDgRQ++DgXgSg3gAuV7ruNGE6ABPZbAZ5ksgwlVPtI9Z
RCTepk7ZtqEEgudJ4838pYXvIw5JFdMPubMlTDH6qFWpipfExfKuJx/Rl+C39Ax3
Ikm+kI5OuIy6Yv0VF9MS
=jSPW
-----END PGP SIGNATURE-----

--=-fDlxB1vSqOKXrJHuF9Iq--
