Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HOGp5OOm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VKQcbPS/"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Xm83r8vzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 12:55:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 08DE320B69;
 Thu,  5 Oct 2017 21:55:49 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 21:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=dXrLIa
 pLsW4RxqfEcmcb3ho3LqO+ZbOsv7n8D3b96C8=; b=HOGp5OOmhOsyF3kmuuuBwU
 fpskxoAC/+X/UBnxy0eelwR3rFY0Ez0QMFWkoHwg8EFhfaHylowyK2KXAioA24dj
 wGF0K1nWFjZGXB0W5YIiEAXBiuVFRCXvKVplz9qR1npPQDFNNHo+MpyTQEKuAIlU
 7kOp2+Uc5TFbwPCUYH4kWz3pZcJ8cTpyxcDGfNr60vaup8W6QGv87sd6tWXf4lYy
 bbUc5pGQllb0Soe8kAhIbCccl5lzVQR6GgWizWR9Ajp80fMOTVsnGl7lmatLjxnu
 7VTW9XVM6M+qC5gQl+lkiK27Fe/ZCJqQ0sbRdph/Utv/I6Os2j4L7HTRWh70RXBQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=dXrLIapLsW4RxqfEcmcb3ho3LqO+ZbOsv7n8D3b96
 C8=; b=VKQcbPS/NLL6Fgx48uTrGVijd4fap3ePGDuJSrYQQ4uFmMapKbajGIvGc
 UR3TmgBySBDfDLM/Gw17j1kSIG1/zrVQYzPWl+dYN3DoJJCSNhGUqXNbavnTVizv
 q2nkpfqve34Rc7rCdHaS2/P+UjPUpK3hqSY1arMY9EatRuFwykPkeoYpvIbKGxku
 NbD+0ugNEhvCvlf/Ma+k2k9/s811gH2X9lH9BfZdSnn3dzaObTDq8jcDAzxleSeZ
 3bri+xvvqQeWbBf0Ueg1zluu+0rQJKuRwW3Q9lsKXS8VrMPpdaMMLDkshVh7Sbw2
 PAqcthJx6RNEFUYlMvX3QlWLXDWtw==
X-ME-Sender: <xms:pOLWWcMFhGuiw5iEGkXqf1bE053tbATzk96Hm-pzDb0I9shJCtge5A>
X-Sasl-enc: XiLsyz9u3YufKeF5e9jKBsPlV+9bySbjoAv/WLBjmRpu 1507254948
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B4672479F;
 Thu,  5 Oct 2017 21:55:46 -0400 (EDT)
Message-ID: <1507254940.5452.129.camel@aj.id.au>
Subject: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Date: Fri, 06 Oct 2017 12:25:40 +1030
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rnlS1V5kIC9vHwVM1aGF"
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
X-List-Received-Date: Fri, 06 Oct 2017 01:55:54 -0000


--=-rnlS1V5kIC9vHwVM1aGF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've noticed that we've grown several helper script repositories, with
a mix of intents.

So far we have:

https://github.com/williamspatrick/openbmc-events

and the seemingly more active fork:

https://github.com/geissonator/openbmc-events

Along with something Joel cooked up a while back:

https://github.com/shenki/obmc-ctrl

and some scripts that I've written:

https://github.com/amboar/obmc-scripts/

Is it worth consolidating these efforts? If we do I think the result
should be low friction wrt merging changes, and some hacking should
always be expected if you're going to use the repository. Consolidating
might help avoid duplicate effort.

Cheers,

Andrew
--=-rnlS1V5kIC9vHwVM1aGF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1uKdAAoJEJ0dnzgO5LT5BFgQAJP0cQUkSnQ/BgZTuaWHWHRa
twNslmlNDwah5dYhcJyxeDrEgHI28yUE7HsgpuWq8k76rgrMjxVzu113FDMxjMSh
GYwYFLmn4RbiiSpOIBQjab3h9yXlGwg8v0HVAQ5HM6AN0ZIj3aX6fyGiaXokOedH
QckaV5MIwq57tIX+e/nhoeAgiZ1T2Y/bZ5+yNSarwqmSHKf5tavwxP9YM09EwY54
L1226jczr4JRcfvQw1cb/EtnmQ3OWgRbM0FF2RRuFUU4XrTR0WAjzPtnAkMml0KM
IgIigj3aRFYtYuMv+Zij3t0Rg3i5cyGJKVqI/6kZi7o/HpHPX7dt2qILW0BfEjuV
X7R5nw7WAcK1dcppNB3hI1B/UrrAS6qaUPyRB4rdDrrEkuyZA/HdkoZReqjK5ErO
Mud95l6lKQD2ndKxyMwLkcfbOb/WpoZnEmELBGrG2CqJPmWZE7FX7B8dqfmYH7nO
QG3n9JpR+pECP8+8yv+YKo6qwnalc3//ROA+9ScDkzJ2ry6TvdfsH/7iYqdivQA1
mcAFeNXx//iqIJK8eYtNS4BTHilf1kDYw6cOHZeau9q/rzIMYnfnLC5VacMMfkha
WDz46ZUdf48Cx/SpCaH9O1lX4bAEC+PBO35RVmODvgpVFMOpB/oJyGpwklKNK9te
Iq08tfXMvXcuSVltk4mc
=W1nS
-----END PGP SIGNATURE-----

--=-rnlS1V5kIC9vHwVM1aGF--
