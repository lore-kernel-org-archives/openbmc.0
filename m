Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td2Fk4nzgzDvkS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 12:30:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="G4Gt7gkO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QHg7gmTy"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9AA9820971;
 Mon, 12 Dec 2016 20:30:16 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 20:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=GkcOgUsKRvHFOMj3uGYrPe+yZXw=; b=G4Gt7g
 kODaES9r8JI7Zm1w5KcPeWZt8Y0kiRJwtAUID7Bb2j67II7sAMWnR5LcVGZYthhE
 IXYyOsonXSWOLlYTSl+3e55chiXfVfhgQL4irgCzOy2GOX3Lba0m41ckPeD+o49K
 l1tOOev77XdL2bgJBDK6hCrLqBCDuGikxzzHA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=GkcOgUsKRvHFOM
 j3uGYrPe+yZXw=; b=QHg7gmTyjM7T7CWyRX4fsll9N6oZrrkNgstfcKWuAKonrr
 QWBQVcTxk5FvyX1fP5A3Sjpjz/fuvJjdegxDtcGIOJqtKMyGAdFrMQVECrhoWVol
 igcdun2lsg1WdRWHkjyiYCOtydx8ayoCR16BLQyZwyVfeJaAnVB5iJBtBzuUg=
X-ME-Sender: <xms:KE9PWGX5ZFD6gPsAppuW8HQf8iopBR9qhQS4-V2mfm27PqhuEOnW6w>
X-Sasl-enc: u8vXG8r9DyA4wdKlHUfHvCAVs3jMO/6kzXnOX1qdwPft 1481592615
Received: from [10.3.85.50] (unknown [203.122.223.123])
 by mail.messagingengine.com (Postfix) with ESMTPA id E243E24241;
 Mon, 12 Dec 2016 20:30:14 -0500 (EST)
Message-ID: <1481592610.3112.17.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 2/9] hwmon: Add core On-Chip Controller
 support for POWER CPUs
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 13 Dec 2016 12:00:10 +1030
In-Reply-To: <1481522572.3112.12.camel@aj.id.au>
References: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
 <1481522572.3112.12.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8JxHeZxet6iqv5KMfvIY"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 13 Dec 2016 01:30:19 -0000


--=-8JxHeZxet6iqv5KMfvIY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-12-12 at 16:32 +1030, Andrew Jeffery wrote:
> > > +=C2=A0=C2=A0=C2=A0/* read remaining data */
> > > +=C2=A0=C2=A0=C2=A0for (i =3D 8; i < num_bytes + 8; i +=3D 8)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0driver->bus_ops.getscom(driver->bus, OCB_DATA, occ_data, i);
>=20
> This interface needs work. I'd much rather we could write:
>=20
> =C2=A0=C2=A0=C2=A0 occ_data[i] =3D driver->bus_ops.getscom(driver->bus, O=
CB_DATA);
>=20
> Looking at patch 4/9 I can't see any reason why we'd need such an
> unusual interface.

Actually, I take that back slightly. Ultimately I'd like to get away
from passing i as a parameter. So instead we could continue to use the
return value for errors, and pass a pointer to the memory getscom()
should modify:

    rc =3D driver->bus_ops.getscom(driver->bus, OCB_DATA, (u64 *)&occ_data[=
i]);

The value in (u64 *)&occ_data[i] is only valid if the call is success etc.

Andrew

--=-8JxHeZxet6iqv5KMfvIY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT08iAAoJEJ0dnzgO5LT5g4wQAJLLk2b+MCsJMMIWfXk4figw
GaDGP+aCpYANOFl5GOBdiSmZSqr/xLBzbxh/8FiME48GchPotgtf3MBIRg4ktM+S
UGxTMuCiu8XN+ON1T0phJhSKBW+dwbM43yz8ZVw/Vmfj+QI1z2AkmvFEQHQzoTcQ
3mKJNRLcpCGuTgPO+n7bpvPg03NFx9T7ERCZC/uuWCczvCoWPWgOhtm6W9CVeWXt
amD/9qh3XxEUg6NkSHeezI0BRuQnCmVw/hnyhtzl546lGS8qcmZ40Rciqi/RQk03
CT5jzPqSeixcDdjMuFFkjdoTEJDIqO4b9AMkSSaEZFpGl0vv3KoUShfrMT4n3o58
A6UblsH+hBVZvw0KSZvAhREjZX/ar/lo45C1qG7ZSB1pTWrcGqYi99m9/XgfdNSC
VNflQvuEZgIum3t5UXouTcXItDPGNwnDb1BApnNfBHxGhwamNaWCcv0fRrUYhOj3
1Ptpk6OSRatgz960AyKGe+4bGhAi8Qizqf5J48gJEpxAs7O9cdKOlSpcqp6Ay384
1AFDbfJFix3QQmMCPZReFxFOIwNOvR2BQD6Q/8k64zAoMVemCrAW9h/W9FBDjtSn
3nqbhV/9Da6MjwaAEawwKNtonynlzshA/K7v9wErdP1OB/hwlaBVt/NUSx3yGxek
7BAsEtOO/hf+wUszTKhK
=1cHC
-----END PGP SIGNATURE-----

--=-8JxHeZxet6iqv5KMfvIY--
