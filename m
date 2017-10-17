Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W7nbo4oR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="si0eCZRs"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGY040rqYzDrG0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 22:30:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EEF02078B;
 Tue, 17 Oct 2017 07:30:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 17 Oct 2017 07:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=diQA0rpw5nMHO2yyDxTSEjKd3zRkRwpk33Uq4+0q8W8=; b=W7nbo4oR
 rYkWm5WtMp4jfuC61cYmfiBv0aYu3qEfKuWO2F6L+cTzCoPLNp5ySssO93hdOIvT
 vYwyBxLQBafRb9DEdn+EN3hJx1jSWeCJ6U4Z2PP6y4lPlkFVY6ceWYKIhEySz3X1
 Zn0pRsS2anM7PmxA6yOsoCqd2KkRHLwxz9w2w01LDExLyHJ3hk/Skeb9Hfvjhqgx
 8Bjv3FqMBwykTxlXXLDmcS3EQhwNHclxhpm7NUu5eE/istFgLwxPSoFtFffxMy7x
 qMtObaFNvagR/i5lUwP1DlwxLk7BnKKsdYQ8T7fOnXH7QqkFMh5QLt+mMGNzKacf
 mPEVPLNMmaZSpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=diQA0rpw5nMHO2yyDxTSEjKd3zRkR
 wpk33Uq4+0q8W8=; b=si0eCZRszNNDCVfUilfXIlq/UqwyxXJ9whyUwpcUb2nMg
 fTIviRXHk4gHAl5zgp/uF+35v+lCkopE/ETtxImYCJwLP5fv1hrNrBZQG6KxILgL
 nZrMJEy0TeAgphRtoF0+5hXmObfR8piWtiyQ0Qoh7ECjet8K1XxflYhBwPt5+qtR
 5f6Lyq70a8q/3cUiE6f9H+fIWkFHFTvzFeuFn9zuhFp/uGUZbNjMNyieY+K5/FZp
 UDgi9t3csD20Su/DEs2LlDWLMTPzlNqtdtmC+6E8ccilRayn2v9ChdVCi3GEstVj
 eXPXpMjN/JjJ/iCuRjvj8U/By6Y7INp/EQd+UCJSw==
X-ME-Sender: <xms:yunlWb6C8Bo6iaowRoESiCBND-HYocCB2HNs165JhztTCHrLYEFxQQ>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id B41CB2479D;
 Tue, 17 Oct 2017 07:30:16 -0400 (EDT)
Message-ID: <1508239809.24322.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 0/2] drivers: hwmon: occ: sysfs_notify
 and presence detect
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 17 Oct 2017 22:00:09 +1030
In-Reply-To: <1508171389-30728-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508171389-30728-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LyZ9TvoqgUfAMzjsF0Xt"
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
X-List-Received-Date: Tue, 17 Oct 2017 11:30:30 -0000


--=-LyZ9TvoqgUfAMzjsF0Xt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-16 at 11:29 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patch set removes the error checking for the number of OCCs present.
> Instead, export a new sysfs attribute to indicate the number of OCCs pres=
ent
> from the master poll response. In addition, add sysfs_notify both to the =
new
> occs_present attribute and the throttling attributes.
>=20
> Changes since v1:
> =C2=A0* just rebase
>=20
> Edward A. James (2):
> =C2=A0 drivers: hwmon: occ: Add occs_present attribute
> =C2=A0 drivers: hwmon: occ: Add sysfs_notify to throttling attributes

Applied to dev-4.10.

Cheers,

Andrew

>=20
> =C2=A0drivers/hwmon/occ/common.c | 49 ++++++++++++++++++++++++++++++++++-=
-----------
> =C2=A0drivers/hwmon/occ/common.h |=C2=A0=C2=A02 --
> =C2=A0drivers/hwmon/occ/p8_i2c.c |=C2=A0=C2=A04 ----
> =C2=A0drivers/hwmon/occ/p9_sbe.c |=C2=A0=C2=A04 ----
> =C2=A04 files changed, 37 insertions(+), 22 deletions(-)
>=20
--=-LyZ9TvoqgUfAMzjsF0Xt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5enBAAoJEJ0dnzgO5LT51jIP/iztRZmPc2+YUkvlkOBvDMex
cb8DGeOXyS/OZeKMrR3TLMy2dv7HUCjLdDzm9/J7tU5cUhxS7rY3nhHQiXQ21gNZ
4EzvmsvoJssV/sEAOzkQfVxs5/nfjhcmStaH7Dh3etw+mL/QsX/q8KCSc8iOTXrD
SCXe1AJRnRFIudH3nPvZrsf2anLm1fOBpg+Se4jNn6jHnWGTacmQUtPx61fBnDrM
9ivaEvWivOP449AHtA5xr6US6hsScjYU0C5MCOPdvWWCAZ/0gsIlv7ATe82HMlfb
8GRELVAYyHA+4A78+o41NHysgR+JPcDVE7xgh9Y1tFS3USJWJRfIiR+2hV7dpe5V
Rm1YxrB6qkAsPURuz/nWUbU6xh46IhxxX8mle81wx8fLTfVqNUkoxxJ4IxZTYdsz
P9gMiFQjklzjG1fGB5xMUh2s1R17UZcUwuzBKaknSR8rd12ZPhuhyGmRokIB00Wf
ImN+um2UqKu6VW2kdvHtB4xmUoMa5W1zBXJYWLB5930dR+rLId9k0cUklGVEkZRf
CzZoQH6E11DmaYTDcdXKosn3cJvedckMcCPbKva/TJd82UzTlrH17bzegQEHpWy9
SIIYwcMT04fRNcluq9h8D5iSxEp4RTHjq1wuvofdHZBYNj8c5OWK9olqibK6KRr1
XhffdFsNrn08iI70yY0s
=NhUJ
-----END PGP SIGNATURE-----

--=-LyZ9TvoqgUfAMzjsF0Xt--
