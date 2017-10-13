Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i4juAu+v"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oPSbu2lE"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yD5g52M4PzDqlv;
 Fri, 13 Oct 2017 22:52:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53C1120C6B;
 Fri, 13 Oct 2017 07:52:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 07:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Yi2zCizpGHf0vwpqEEGIQNBqvDjwXt/SDwJq6iykhBI=; b=i4juAu+v
 b8FvS/DqzlaRh8eYaGccKVsjJYp37yfY3hEmgWuMhIrtixmoqHaToB9fhZqJKaGD
 wfKR3eh4bdNmACOMsqGAd8HaLIH9m3pe5zK6iUFdiVkFaCeUFIXOzYYEiURWvRuY
 SvU3DfPL3YwJjbZQqicr8cF6q3i3bQBp+3juMMXXV4Kq7wIKBH0Rh65NwKMlf7Sl
 AuMNTPBRzA+k5e/ImDq2oXlToDsbW3KW8cYtzL7mUToYjtiwf8ZvKpQW7c7tVall
 PlogO2qroFEfHJqwmitNeI6Ms1dx6V13yfOqP6SgNvQffTGIRQYTyogRNA1YRMGx
 +TcsR7CppLYzAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Yi2zCizpGHf0vwpqEEGIQNBqvDjwX
 t/SDwJq6iykhBI=; b=oPSbu2lEZI6UL3bd1pYW1kWYEEKXwMls3HXkh9LMthOuQ
 J0wTK6jxDi4oKNOH01ogM+Wn5SyqfsP2cEH6EvM+22irYJ4MH0qihhmYbVCX6IQs
 HM6vxOF4c2AypTXIb2Hcgk8/6qGT9PDw4OIWNBL2xDwPuq7x3PILJAd/cscBxXi3
 gevp3FqfdzrrRtJJKEjlpZJoFJDvIQK7aXiBvrECasYJM43lF698MVfzt01RWna/
 3yeMs8m1YaKK52zoRu9rSs4BmFgfYlUkSR0TT10MckcIMJCeiqDKOdS1uH+laGFF
 +MFW+HyfWl/XIpB2K8pEhP96Fq4SJzigKF4MhR14A==
X-ME-Sender: <xms:76jgWbYejWd07JvopyWXYCOCuBYKaDgtG_7Jn4Nfhlfq5MFg25WbHw>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F8907E3DF;
 Fri, 13 Oct 2017 07:52:13 -0400 (EDT)
Message-ID: <1507895530.5452.210.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Chris Austen <austenc@us.ibm.com>
Cc: openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 22:22:10 +1030
In-Reply-To: <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-H0go52H5TaJOfCt9P6dY"
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
X-List-Received-Date: Fri, 13 Oct 2017 11:52:18 -0000


--=-H0go52H5TaJOfCt9P6dY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-09 at 13:00 -0500, Andrew Geissler wrote:
> With https://github.com/geissonator/openbmc-events, I was looking to
> build a bunch of small tools, that had similar command line interfaces
> to interact with the different REST api's in openbmc.

I've pulled this into openbmc/openbmc-tools.

Cheers,

Andrew
--=-H0go52H5TaJOfCt9P6dY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4KjqAAoJEJ0dnzgO5LT5yfgP/0S2wvDxyGw8MPlv/GudpS3P
CIVAQ9bEHx8ZsICDOu38uafxOrGkSipb55kZEz/KqRK/JlHdcP1Pl9pgSV0gVEl4
0Dmd5/QjlNlYtn1DHTH0nEMUnvjKqz4pYhwagyWDUOLusIu8NUkQvetgqGZG6I8I
NFSHEEjf0mmN5Bpa29RogSSjeM8fO8YXdP3HaRsZu6Ic3h18Oxqbx9fPdIf/YrJ/
Lb3WZrWMR+kM2AtiRutjbhURhTHL3jhauprlkTQtEz4/xyP/8algrB6nzY1kUcKJ
2XHHpyFejiIeOSodpREGrDmxY1CFB5j6ZvxMUBy0dGJpmlFcjOm+EKxZIFOJXicc
WTQBGkPGq8xsKLiRzoym+04qnrdMsNaf89XY6o+/M+c/lz1yjPjYN48qB2QCVqqf
lZFQqdICwCn1/L5/u7E40pvcqHJ4dtXXyp5s0RSs+Uoq7L3g86h4Nr2Y0IpXLMAx
v0lxCRtdisbkngFNVvn7dUl4HXMBCVaQdO0IYhWgvSnNa1zg1KyCOsD6zDJHqiE1
CefhuMPa9pr1CeN7giDXIigs0FIYOndfdJlW+c/i1mXPzM+n8kLsvNB2B02sTi/o
QIaYPGp7nf+ryyNvfLcrGp9HIUPSuhw4B0bpMTBT12nlbUQOp4mwvqQVwfK+X+Ym
hSRILa6pSXV2Qqlt6kex
=eVoT
-----END PGP SIGNATURE-----

--=-H0go52H5TaJOfCt9P6dY--
