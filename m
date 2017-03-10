Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfmtL08zqzDqXx
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 23:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GLrp6EQP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mQl9MK7j"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E830F207FC;
 Fri, 10 Mar 2017 07:34:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 10 Mar 2017 07:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=3WoL2bruiQbBZcYZrsaUHcMHeDc=; b=GLrp6E
 QP3JMwhf/qmQtsKvWurzRlaCX1IPWWyLXRPFXvdBGrlFXyMII+Kx/OFU5keP5Yoe
 VdsOTh/ri2Gy6c0aFSab85xv0IJZqAD7LkK6Fm/hNrEE+rlvQ22kbTZeIQsyy3VL
 C76XWco++nrNR6xP59xL6kGU9cWYQj4+Kiygw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=3WoL2bruiQbBZc
 YZrsaUHcMHeDc=; b=mQl9MK7jAVxlpWFyGRqANz/DrzsYQBfK+ljq8CrR7AAnFR
 1wP8PRhPg+pjLOrByAV6EzKykNGKHy9+A0KaC9wtNUA+o0nBKwrrPLlnYuc/mBvK
 RrvLLY9G11VfVjSlMlRZUWJ5fVYtV+IJNE8xNPDYhIPwOIssVDCNwPdLZ12ss=
X-ME-Sender: <xms:Z53CWEdTf1qQ_tAREAtzead590CzDINIEwvyrK_26ymRQ3LfkIZuiA>
X-Sasl-enc: ewpI44V3bwbOonrPGbz9XcP8VbOwYND9H9KPFqyI72Vk 1489149287
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F5D924355;
 Fri, 10 Mar 2017 07:34:44 -0500 (EST)
Message-ID: <1489149278.26468.5.camel@aj.id.au>
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: clg@kaod.org, miltonm@us.ibm.com, wghoffa@us.ibm.com, patrick@stwcx.xyz,
 xow@google.com, openbmc@lists.ozlabs.org
Date: Fri, 10 Mar 2017 23:04:38 +1030
In-Reply-To: <20170310122135.29827-1-andrew@aj.id.au>
References: <20170310122135.29827-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rlkMwj//ZtLXFbf8u8v0"
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
X-List-Received-Date: Fri, 10 Mar 2017 12:34:50 -0000


--=-rlkMwj//ZtLXFbf8u8v0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-03-10 at 22:51 +1030, Andrew Jeffery wrote:
> Protect against suspect hardware causing the bus to read off more data
> than defined in the SMBus specification.

Sorry, I forgot to set the subject prefix. The patch applies cleanly to
dev-4.7 and dev-4.10, and should probably be applied to both.

The dev-4.7 tree with this patch applied was tested on Zaius.

Andrew
--=-rlkMwj//ZtLXFbf8u8v0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYwp1eAAoJEJ0dnzgO5LT5ykkP/0TCX2EiNvG7AtkUSZm5jqBy
vkD4c6Er+TwKjjnp6LLYB+A1VHRolJ9d5QpUdPgg0YmT86ft+uLVraATlTDgTy6o
PnyGrcOjcmmR62sjnihgV0E7VOme//5IkW50AUZ15ojbWfUDWP1bGMNb0ao1tXlQ
NQsjxxM1Ph+qRl9GjFW8X60nhHya9W9SnLhetQ7000B4QzJ4S6xQfZUMcVE/4qNM
KhGPkdUS9To3Q7pMqJwhq3aO5F3vrAmuNLI7+mnF14GMPpbBer+7yuhjPNSkrukw
EwOzOP4RuEsyxPK42kgHIzSrFu5wwtmsX4AZHkHurDsITGPvT9fVu5kTFzociuCm
Uq7aHj7RPNIAuhRNH8yDNfmfUQyVjem0lDs5ZbgC6xGP9yGN5D0zZUtycRYaw/rR
nSEWFGFwKRl/FKLN8NZ8ww+yesdkrAKWLcX4uVkn3p4P6BdmELKvrbYumNbp4XEX
pWzjenPpdC9YRSTshEGyaIby83p5dOyVk9pN+JmO+JruzpiEAj1Y8Lb/Uo4zgkdB
b/htZZ1dWTAy3etauZuzf/FNnXLvJoIn46d7VeEzpLoyhyqyA58945DvHPhCQdvb
khSCqKayDa2z9F9TImuYp71r12jwoGz3J+ZCFoOIDfeQhwlVW8vlbP5WgQq2aJq5
wCTUXmnR0VvFgV/x9/Fs
=9UQ6
-----END PGP SIGNATURE-----

--=-rlkMwj//ZtLXFbf8u8v0--
