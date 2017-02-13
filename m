Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMf315sXlzDqBW
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 08:34:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JTkS5CdJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ONBtI16c"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B4D2D208D4;
 Mon, 13 Feb 2017 16:34:51 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 16:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=0M6e9B/Nm2eri725+PKaWJUfG1U=; b=JTkS5C
 dJrRT8vr6IyQ1oCuOWQqVOdtItcbdOeL/ggQ/fDgu58sYp6+ylOSfAoZx1exbrKg
 tLI9Kl8r6ftBLkEDqcNCmFu1BYTNHAp3uZsdbLxcsYj4GWePpxLZIu9BhrYibscS
 xQ66jJH5v4FqJi90ajFScqPwlQHUgS80IuLzA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=0M6e9B/Nm2eri7
 25+PKaWJUfG1U=; b=ONBtI16cqjF2WOYumj9CKaVLWEnLm8B/EgBTCxHRYmfdtM
 zgIFF7jouiNrWGX6AcjQHBkUIA3axHuqE9vJDohzT07Ea5wytox8e5wY/A1k67Eh
 ba5moVOHtGtN6Fc3w/n6X9Ruq2ydrwMvc8AlvGF14wrMn5WDaJOcqHhp8XVmE=
X-ME-Sender: <xms:eyaiWHKZK3YCH4GGkaObaZEHVXfyYUc_C7Nijw1uHwIjmQBBEK4v4A>
X-Sasl-enc: MyAkmFNihtdCDv6o49dY5TYgBrt9qRHTgA+iZM+xK72X 1487021690
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67A9F7E06B;
 Mon, 13 Feb 2017 16:34:49 -0500 (EST)
Message-ID: <1487021685.3661.26.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Date: Tue, 14 Feb 2017 08:04:45 +1030
In-Reply-To: <CAPLgG=kOBYuKTnZAbZtwDyZoXrUiwivyHAEzcG-tn-jmkxGZhQ@mail.gmail.com>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
 <20170213172440.lrqaf5v7jk66denq@asimov>
 <1487021173.3661.24.camel@aj.id.au>
 <CAPLgG=kOBYuKTnZAbZtwDyZoXrUiwivyHAEzcG-tn-jmkxGZhQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-o0d27K01tlzQg2Psqj35"
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
X-List-Received-Date: Mon, 13 Feb 2017 21:34:54 -0000


--=-o0d27K01tlzQg2Psqj35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-02-13 at 13:31 -0800, Rick Altherr wrote:
> The AST2500 datasheet I have covers both 2500 and 2520.=C2=A0 The table o=
f
> contents has many peripherals that have (AST2520 Excluded) next to
> them.

Wow - so it turns out I use Evince's Outline side-pane exclusively for
moving around the datasheet and I never stopped to look at the ToC in
detail.

Thanks for pointing that out.

Andrew
--=-o0d27K01tlzQg2Psqj35
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYoiZ1AAoJEJ0dnzgO5LT5/KgQAIo0KZqx5KhiADGWpdExF/Sl
64QIYnUh0nkJ2JpSd8XwviTi0ZYznPfpfc3+ew+TxUVLQLUFiO9+I85gL1cTwhjJ
q/BO1iuc41kbAp4LUDGBsPYixT5ytdyfOdGWoJu8JUWqFIEMT3hoI8SZf3bDtAiW
PQmKKVBcqthWFpIieUq7gOdVCejSkcBv5N7kVR/fvp8hScvp+h2tOO59lWkIRA4+
uWEyV7Hdi4HzI8rNywzT2QLRdFGN9oIUSmbPVcgYufHANMFYd7NS6kyhIbFauL+D
XRPJH33SJ19u3Y7YQ+fH77wr8X4uj2vPBXZeHQEC1p0qf82HlkoOqIJ1TZmafQAt
zZpMMewROW6ZRLJ+FEVMPvzB6kmqQ5j/sSpsw2l/gYK2OOI2uh3NZRW/eOzM6Ul5
o+kB+zZqqjvqBW/16ySvsU32kGUyyoYHPCAfNMAp4P0MZ7AvWyw8rmJltLc5tRc1
sE8mJIcIBXbuVV41ocSAaM6pnoZKdzZXKwX9zJgmcF0GNqs0tdfYv2U5SXyF+QJN
K64EfSF5AD1DVgbLB7oN9r47vitLWP/QnuDw46so4tmw27DlMrsODn6Nj/Gc84Jr
Fy6b8f5zB95R5dqp8wPzJQzjVd4zXvrOBPcSAQuFvsNtN8FDfjvAaVxyAnTrAZWD
FwHSwYjZCyiffRELo7Im
=Phk9
-----END PGP SIGNATURE-----

--=-o0d27K01tlzQg2Psqj35--
