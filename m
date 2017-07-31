Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLPpR6krPzDrVh
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 13:20:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="j7LZiyzr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aW68TsJL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 66D6620682;
 Sun, 30 Jul 2017 23:20:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 30 Jul 2017 23:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=2dKMu/cxj8AfHAdj4vP2YWmr+n1+vwysaXR0lNfMF
 W4=; b=j7LZiyzr/CWVFmF5pAnVANjNBZWXyKg0vlDOVVwWdYjsFNiq08VSdvx5F
 O97/fvBr5j4NuVtjL+08VyAuY6kH/cTiKebHl6Rrg3Ye5MW5JDxL/fdufnwbRShZ
 sA1xbh4bFbgUUAc73lgnVixw7iYhVcu9WxvbbEcQc3uaaYHIkYMydC3IPTofSBCs
 Ve2GfPkFVYxHs3B99dq+O8b1lKNvs8dtFmgfIMxKdKyEtH6jlPPkhLf0j192OeFZ
 dhM8Zr9QI9kX0Plbwu8J3hhzBPWHXsZT3DUmdpiHEQ8Wb1NRTzjPaRIWAjh8MB1B
 XSeFg0bBuAa57Vk1NsGhlEBYqQnnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2dKMu/cxj8AfHAdj4v
 P2YWmr+n1+vwysaXR0lNfMFW4=; b=aW68TsJL/NsNX5bPBLhHnfwLApmGNSo9+x
 eAkRc+p0yHmTvIIkCzz33q9E2tp387gTpve7RKUl2AOEgJiPEGuBZN9XJjOombC5
 plaTK+FlUW8Krbwg0Fyj0Kbd7qF8BUPvsnBV/Z2RecjynH8lSyNv7fvxJTjM+bgE
 40svo1iW5ZjP0cA6jo5tUBISKGgjiObi0qhi3Gqks9l5Z0XCHEs1DP9z/EwydmL7
 P5SN1Ha8IFrioT3kB7S812yre5ZhrnUgr7Xl/MZp+GyjP3jbp5KOWsxm1n5IUewk
 0A3UGDrn8dm5nRq5M+s6SyOeIaqqX3atFUV7GN2pM0luWNAprNKA==
X-ME-Sender: <xms:66F-WWYFqudCfxuRSIzXAeHYvbLdHETvgJEh8SSrC1O3e7Gq_ztIVg>
X-Sasl-enc: N3IhXBc5Tad679nhpH/gIzF0yPqbBs+tnoL6mIfcmKbp 1501471210
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4A6A7E354;
 Sun, 30 Jul 2017 23:20:08 -0400 (EDT)
Message-ID: <1501471202.5179.27.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
From: Andrew Jeffery <andrew@aj.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>,  Patrick Williams <patrick@stwcx.xyz>, Eddie
 James <eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 31 Jul 2017 12:50:02 +0930
In-Reply-To: <dd1e2e71-c548-2341-d37f-deea820b1fb0@ozlabs.org>
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
 <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
 <20170728151405.GB14987@asimov>
 <abbfb937-cefd-c7e3-3acf-be4092624273@ozlabs.org>
 <d4b089af-9b63-2c0c-32ac-1d9f664937c7@linux.vnet.ibm.com>
 <dd1e2e71-c548-2341-d37f-deea820b1fb0@ozlabs.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8gqmC+lmgrqZlC1MWlqp"
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
X-List-Received-Date: Mon, 31 Jul 2017 03:20:19 -0000


--=-8gqmC+lmgrqZlC1MWlqp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-31 at 10:36 +0800, Jeremy Kerr wrote:
> Hi Chris,
>=20
> > Not sure I follow what the FSI GPIO master probe would do if it can't
> > access the GPIO itself, assuming we're in blocked mode. Would this
> > require a deferred probe of some kind once access is unblocked?
>=20
> Yes, any state change from blocked to unblocked would need to reinit the
> GPIOs, and potentially initiate a scan.
>=20
> So, if we're initialised in blocked mode, the fsi master gpio driver
> would still claim the GPIOs (but not change any of their states),
> register with the FSI core, etc, but couldn't start any operations that
> require GPIO activity.

On this note, we should probably configure reset tolerance for the FSI
GPIOs on the Aspeed SoC to avoid glitching them in any way during a SoC
reset.

>=20
> > Also, in the existing FSP-2 implementation there is a bit in the FSI
> > slave SISC which indicates if OPB if fence by host.=C2=A0=C2=A0Which I =
believe is
> > set whenever host boot is using the FSI bus.=C2=A0=C2=A0=C2=A0Possibly =
we could use
> > that info to determine if any FSI accesses past the CFAM slave engines
> > are allowed.=C2=A0=C2=A0=C2=A0This might be racy though since BMC can't=
 control when
> > that bit is set and cleared.
>=20
> OK, I'm confused - are we able to access *some* parts of the FSI bus
> (ie, the SISC register in the CFAM) while the host is booting?
>=20
> But as you say, this might race. It would seem simpler to use the BMC's
> knowledge of when the host is booting to decide when the BMC is able to
> access the bus.
>=20
> Cheers,
>=20
>=20
> Jeremy
--=-8gqmC+lmgrqZlC1MWlqp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZfqHiAAoJEJ0dnzgO5LT5A+0QAJJJn8mqZq0xB2MCWRi2kJAk
bpVbkwpI0pn+EOjEvWJMvPEjXFDBrMLFYOqxyFLSrjA2jNU/1VnlllPfjmv8AR59
Hv7AI1h0yiKSK+k246PmeP6je5elQOWek3boCPYcZw6/6KJwrXk7lW+9RLzcKCaP
4RR9qvhUxlB+d8ZsA0l3XRenk+CKgVgzjEe39E9X9qulqfgGpZkAdJfehMk35dpX
mA52+jYachvVvLa6yK4PIjgSc+kEoGG7A8+7OmR7G81dJF2bOkrTtjEJDf4AoImw
f1u0LQ38dXdLnjkXoprEAhEPpok3D9bWgW+v1cHGDiV+tMsIY1iMjpBkKCrrg8e4
INj50ppb2wXQ/oGhS6UWPDv5so+/Ngx+R0vLT7wJAolvsNh+VLwWDUxgS/EUXxvV
h1aE2rF0db60ym3kmPViwI8XJwD20Zdu0rMIrOPEIghsfpwVWffxrDoyMMQbHaLc
jcBdrzXDy/xH+XSqEI38TO1yLS6yfx2Vc8vokjjtUNhqbeS7lBlxW+j6jyc391Fr
dYSfoaCZ8ouKPjMk8dbozAJ6ua/xJlFrlj6nU7ZnrCRuNskTm8r+vrjAsTRArrfc
3cCiddaHTO/gokPbgK0f0Qdy9UUws3OC+oPymfmoljF/hpTvkD1aJ6Iug14Nc/Vt
nELl0wQZuT6l87ZbRPsP
=slQt
-----END PGP SIGNATURE-----

--=-8gqmC+lmgrqZlC1MWlqp--
