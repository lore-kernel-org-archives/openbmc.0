Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h65iWZWI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RimgbqQJ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6QBL6NDPzDqks
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 16:56:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD572211C4;
 Wed,  4 Oct 2017 01:56:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 01:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=eT2xM4OIsPvRco1TRt+9tWk+8+n+D34zXeHZxPz1P
 rg=; b=h65iWZWI6svsMvTh/ScCTW0KGpO4AuO/08CLnE+o6kzTzlOV+EbNUOr4G
 FEm1EBSBwbdb240yr4qxyekaRvwPPEarrEoqE+44z/W3TnQg5UG70TpPK8IrD+0N
 wFO8raPi0bVxbm8YByfCCska+vKwx/nGFgoe9Gx6XRXC7P8VHuTPI5ymzNq5Fodx
 xlkN3sCysxJrkbfllYMu/UrKZ96g4RMOELgHnWFiWW2Gem+YX7tcMKpMPMaiNAOj
 09SoAzM/Kdi0pWcICAmUx9ZFMZ7StaW3Mxy1TMuddJi++WSa/GEntvXlIZFthnpS
 F66vyffAIuXxjksEDE4Ky0NRhw3uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=eT2xM4OIsPvRco1TRt
 +9tWk+8+n+D34zXeHZxPz1Prg=; b=RimgbqQJgVIg6AdXofGYMXxEbA6nWkXx/e
 0d0SHD00ArBhGg775OlLAStsyJen4FXCKHgeyWoUih0qLVZxxIDiayYo/m1I98uP
 GcLVdi6ukBC7GnhdMKmvB5U9s/AsIs3wCLDcTFaZb/IahmxmP8fqczAQprNrUrYA
 BpqnirvqNVhA4gupEV1HC6epWS147AbnXO691SQROA7gHlRxTMpdrXT9v8dHOGA+
 XkY0yRCCl5+4Yf9+os3EXiC1bSfM9Erc39yi3KeZn9H77il9MTHBY9a6M8o9a9ha
 whtvIQL+uEbdzXh8f95WEWdgtPsH7l5Q9jbcFIB/SDA2mmfRrsiw==
X-ME-Sender: <xms:93fUWX8hbm89nKscKaWhYDeEnMHWYnIJUvWPaq6fvS4BNyGSZRsRXQ>
X-Sasl-enc: g/f/ao2/0lzlE3RrHc40Icz6ZJ/l3jUUhZ+vWkxxM4t4 1507096566
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8DB024570;
 Wed,  4 Oct 2017 01:56:05 -0400 (EDT)
Message-ID: <1507096562.5452.23.camel@aj.id.au>
Subject: Re: Call for maintainers
From: Andrew Jeffery <andrew@aj.id.au>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 04 Oct 2017 16:26:02 +1030
In-Reply-To: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
References: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-b7mDh7by91bvv8osM9bC"
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
X-List-Received-Date: Wed, 04 Oct 2017 05:56:13 -0000


--=-b7mDh7by91bvv8osM9bC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-02 at 20:52 -0500, Chris Austen wrote:
> The OpenBMC Project is looking for future maintainers. The amount of
> code now and expected in the near future will be more then any one
> person can continually handle. If you are a subject matter expert in
> a repo under https://github.com/openbmc or cross functional areas
> then taking on a role of maintainer might be appealing. This isn't a
> paid thing, this is completely voluntary opportunity (think Scouts
> without the camping or School volunteer without glue).=C2=A0
>=20
> So how might you go about getting this type of role on your resume?
> Start by signing up for code reviews=C2=A0=C2=A0https://gerrit.openbmc-
> project.xyz/#/q/status:open. Over the next few weeks we will be
> looking over the reviews for 1) understanding of the components
> architecture 2) Comments focusing on architecture that satisfies the
> needs of all 3) bugs 4) and more. Try to Focus on a single project.=C2=A0

So these kinds of people were documented a while back in the
MAINTAINERS file in the docs repo:

https://github.com/openbmc/docs/blob/master/MAINTAINERS

The patch went through some reviews, so it should be used as an input
into the decision process even if some aren't active reviewers (they
still could be domain-experts worth listening to). The file might not
be up-to-date but we should fix it. I also feel like it's a bit
disconnected living in openbmc/docs as opposed to openbmc/openbmc.

But backing up a moment, who are the people who will be looking over
the reviewers and making decisions? Are there some kind of guidelines
for thresholds, or will it just be gut instinct on the decision-maker's=20
part? I think it would be helpful to be as transparent as possible
here.

Cheers,

Andrew
--=-b7mDh7by91bvv8osM9bC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1HfyAAoJEJ0dnzgO5LT5uRAQAJXDKS4dVEIdsn0wYoWuJz2X
hV22odqGCtcxqeJWpUSUeIvsjAqMl7nntxtXotIJU97eU9ZqqMRNzxngt0wamylw
z/HeHBznHrh5YPF48SI889r6URgXPVEkGk9Wwsg89YKLdOXLVxf6Daqg11cG4SAU
FjfyaYO2KorXMnSvnRWHOkUfrHLHcm37WIIJzV1L4EEOEkWFv9onObrT9+Yy7vFk
6fB6YWb2I5q6bWYxqtwptjZFEqqJWdpbjntVzgcKOrDfFFTfmkuTUwwRrXEBwQpR
NNzbdFrkrA5RIsAoIwd2V3qNSG0nheY1Y9v1Nwq6lRHhhtTY92f82SK8y7S/ScMc
wbJXDK22uHUuXYlYSA/h2CGzJCYEU2diJp/caETEtVSJNfVvlXEHTMLelzkZaC0U
/WCVAQ7ehcPVWBbf8wU9q2kYjTSfCU6HNeiyD/a81fDHeVUEPkqu1ZpMH1pIZE1U
ryKNy1ebgMImhVUlN0Bs7Ven0mWfcSYuMVmUtcWsBrN9eyfnGhGsAJIPFWKYiGFK
9omKFSPQlG0AsCuCUtzFjvomwhRcqoWyMeCDkUm8Ex7sKqAhHSQ7uBxetn1N2Spt
Ov+5IRluEE/FzGpoUncuqwzIlXZWagSbTM8JHA1kjko2wWO9bWbpSgCXEWktQzN/
rn4Wd5rwYkZ0VNO+Hsr2
=C+F4
-----END PGP SIGNATURE-----

--=-b7mDh7by91bvv8osM9bC--
