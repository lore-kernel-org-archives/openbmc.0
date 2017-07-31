Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLYFf4WmFzDsPy
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 18:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JhNcVRAx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W92ZS/67"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 515D12094E;
 Mon, 31 Jul 2017 04:55:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 31 Jul 2017 04:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=bLm8kEHaLKdBbTNhy4JZsPFFxPyfmyeSS4sP626el
 +U=; b=JhNcVRAxPKI/r1RwwYsANNlrf80uT0e7k89f4XtwGgbtwVSVWTygcDS5j
 yiY9Mw7/I7L6KkT40VkC+uCnTWiRf/Ancq/if3JKJ50dIU5gQnsJYONUYxfk9W2C
 ws9zpcunItBGsXcQAEhLIXa18ijdDcXhmWJsfVRAbNofKa1N+rPauKNbSB7mG+0K
 yrQETSGElTmqiwIoaHi7//kmg9+vFsHukx9Qa5d0AkEv5jcV3DFvQqfLH/NQn2E2
 GGzUzQv6/z65HDDXN9DAhwUYQSxwXWzo9Yy08g8m1yjSl5h6FCKkQIRO+4vaNlqJ
 DGEDsXIPZITQ6GfuHS13R1tJZ2SZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=bLm8kEHaLKdBbTNhy4
 JZsPFFxPyfmyeSS4sP626el+U=; b=W92ZS/67E+6k3pCUK/dwo0/xr6n5Ze52iZ
 HcWKOtiqW0mb+kUiXBjugmREVAx7Z0rnoIxKpQq9LHqXgnCV1liPzYPt21JeNMDQ
 y3O2N4O1SXTlxBpWWbpzRSOoPG6u/i2BdPkhCbdIEbZ3cgpPN4q5hwqwmT7I4naH
 tTOPdnwdL2PqvGZApA4U7uuZXbO1k/+6kVtVpqoxa1MlSrmp5mMpFvtN/U9q5iiA
 SGq6zr4P2LCYG3kbH/eOIK+CBb7f1H722nSAL3bOtV9jSNtRYaWmknOMpicjEBgM
 hSihQ3JKU9DpQLaeXyN8pOJph515dY7jEzsSzV7EULh5OJ1+ThoA==
X-ME-Sender: <xms:lPB-Wb5Nl2EjaePXA6xyb2rSgiPvhMK_HC6MwZs-2ZPoACANvSnLZA>
X-Sasl-enc: +++E6R9+tUwdoVMqo/sM3Vf3P/Iav/CnQkH3cVLbKQvF 1501491347
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1BB47E4F0;
 Mon, 31 Jul 2017 04:55:45 -0400 (EDT)
Message-ID: <1501491339.5179.30.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/6] dt-bindings: max31785: Add
 mark-fan-installed property
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, msbarth
 <msbarth@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 31 Jul 2017 18:25:39 +0930
In-Reply-To: <CACPK8Xf3DfkeoSGowZvAX8Bzd2i9bda=9ARdUS4rNj1W_EnH2Q@mail.gmail.com>
References: <20170728162249.9145-1-andrew@aj.id.au>
 <20170728162249.9145-2-andrew@aj.id.au>
 <CACPK8Xf3DfkeoSGowZvAX8Bzd2i9bda=9ARdUS4rNj1W_EnH2Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nFxPuz9uq3E4lCt/pf5F"
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
X-List-Received-Date: Mon, 31 Jul 2017 08:55:52 -0000


--=-nFxPuz9uq3E4lCt/pf5F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-31 at 17:42 +0930, Joel Stanley wrote:
> > On Sat, Jul 29, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > It's a system design decision with regards to managing the default
> > values of registers such as FAN_CONFIG_1_2. Do not assume the hardware
> > is configured such as the fans are marked as installed, rather expose a
> > devicetree option to inform the driver of whether it should mark the
> > fan as installed itself.
>=20
> I think we would be better served by making this a property of the
> device (instead of each fan).

> The property presence indicates "check the register to enable/disable
> specific fans". For systems that have this bit configured, we have the
> existing behaviour of the driver.
>=20
> Otherwise we just set the register based on the fan child nodes that
> are present in the device tree, which is your proposed behaviour.

So I'll attempt to rephrase what you're suggesting and make it
concrete:

What you're proposing is something like a 'strict-fan-check' property
that *requires* that the device has the installed bit pre-programmed
for each fan described in the devicetree, else the driver warns or
errors out.

If 'strict-fan-check' is not present at the chip node level, then for
each fan child-node, simply set the installed bit on the appropriate
page.

Have I understood correctly?

Alternatively we have a mark-fans-installed at the chip node level.
This seems less attractive having read your reply.

Andrew

Bonus round: In some systems we have presence-detect GPIOs for each
fan. Should we have a gpio property in the fan controller bindings to
describe this? Given that we're in the process of trying to export the
GPIOs to userspace, maybe not, but it's worth a thought.
--=-nFxPuz9uq3E4lCt/pf5F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZfvCLAAoJEJ0dnzgO5LT5M08QAJn1LVIEQiXZNICZIF9X2xLY
Waf0uPkCHvY5CLDIeaZZnFahZzmz2tpljslMClam0o5fp0ICq6brojlD7ZWgmYUu
FI8KuU37BWPzfIG2FIEM/DZJUXRxiWVNfjtB2J8JgwB1IiPXKS22z+toJG+wQ53d
sUQO/Ww7a33V3hS73SW1/dWZgpm6cu+/XXcKG1Fnt9v+AIkQH8Yg029+V5L1b2s8
TbPrnOAMaIytFIR1px9wO1mWcqBMXqC8AnvGfKGNcskYyBVX6ElPaFafalis4A/9
TDOkXsL2XzpB9R2i4No5bDjoh+iC8WuyH+Lh1mQrr3KZud4GsX7DFuR8GyLUXWbI
J6tmhpykS/lYjvB4zovrSvGkUXhMhsIvRbADXm0LeXLl8f1KpjmtgOlTPK8hMI05
jA3zIQhGydDoImEHDO5cNr/vVd+HQRP9Z/GbW39FFdC72UGHUMTNxRqaHbKfxLQB
fyXom1Wuk3k2L9kTWx4bZ0zzjzH5PZ6bz6GxcJ0yV4Y5WUIdwvdH3KGsf+U5AXeK
OpEAUr1kY3n4/O7RgZlp8IeG/pBgYshbxXEO+8GcpCHTRWBmSlU+kOkpejYgN2J1
eQ2MX7oXJlMhxOcfbhsYnoCkBPceK1MFoswtiJftK+h83+WLp72j4avVvwhai6gg
ovGgr9TfTrgRMXMO7xIa
=b5Jd
-----END PGP SIGNATURE-----

--=-nFxPuz9uq3E4lCt/pf5F--
