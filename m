Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="otMOBoov"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UUEA35WY"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFnG736SMzDrJ6
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 16:39:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E67BE20AF1;
 Mon, 16 Oct 2017 01:39:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 16 Oct 2017 01:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KX/b/rtvspsbrbjf9sdsjECmbhwkxB8lH1HUIrzV/Gg=; b=otMOBoov
 ph0gAUg3udbOHayPPicSCD21NJUnwoF1gCEw33kBuTrAM4qppWbeIQzHKw4yCcNY
 NpiuHREyzSeGpKeurBUS0ZJO83Aw7yVtos9fbDKc4okaev/Bw2Nr3sXVdWDX7BAh
 1yaxVlZrlwlx+CePpzkmbVJjtxPZDf1dPBnYkyx21fjZB/Eihhfh+5meaYzlhYZ3
 +sNOqWeNVD3DaFo97O8dSGcxhLXmJBz1SSt8OnPXJ5N0HK/QBPsdqDLnUwzeFQpg
 UuUYRrgN3EA/90fwOE1Y8fjcijrKOiCmv3NBHGEYbjRXglcq17XmdxXswEtGn5uX
 /bH7ZGTD/RBrbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=KX/b/rtvspsbrbjf9sdsjECmbhwkx
 B8lH1HUIrzV/Gg=; b=UUEA35WYGLv5gsNDIJizAo/qV6G14t7CfZLq4GXCrY/X6
 VNHMYDqp7l3R3FLcjbkWG8gW7Z+e98jXbqyAF3OKQ1YfPAWmJKAexA44+Y7QMT+q
 xkWX3gJ46LEi18m5q4uUUK8Hk9gAoQwDshVq7sp1ManK/nzAlOdrWyBnK75aJfn6
 UdmXBaKG1HoPd8579g5db7JFXcEf2Ec2xP8031Bq1paXkfj3wFWmO8imFxc75zQj
 8iantuglAvzTpn7VA++MnGPZnIB4FqgDjRVNcQk9lznhw6fGkNDPBL0ylOrjCbOI
 yoPYBVD1kHHVgqf6m9rqWHl/NJRQc22wB9WPEySOg==
X-ME-Sender: <xms:LEbkWcmJdwsUJtmErzXZRTXLQ-YaCdaBGsBIU7H-z_MdM-m8WsRcVg>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA77E7E3DF;
 Mon, 16 Oct 2017 01:39:54 -0400 (EDT)
Message-ID: <1508132391.24322.9.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/2] drivers: hwmon: occ: sysfs_notify
 and presence detect
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 16 Oct 2017 16:09:51 +1030
In-Reply-To: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8TSVLGdYP66t4bREtOlh"
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
X-List-Received-Date: Mon, 16 Oct 2017 05:40:00 -0000


--=-8TSVLGdYP66t4bREtOlh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-06 at 15:42 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patch set removes the error checking for the number of OCCs present.
> Instead, export a new sysfs attribute to indicate the number of OCCs pres=
ent
> from the master poll response. In addition, add sysfs_notify both to the =
new
> occs_present attribute and the throttling attributes.
>=20
> Edward A. James (2):
> =C2=A0 drivers: hwmon: occ: Add occs_present attribute
> =C2=A0 drivers: hwmon: occ: Add sysfs_notify to throttling attributes

Hi Eddie,

I just tried applying these to dev-4.10 and got a conflict. Can you
please rebase and send a v2? Whilst you're doing so can you incorporate
your reply expanding on why this was necessary into the commit
messages?

Cheers,

Andrew
--=-8TSVLGdYP66t4bREtOlh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5EYnAAoJEJ0dnzgO5LT5UEYQAIhOrWZ0jsSwBJpjszzYeApb
zx3cqT3MzTf0R3OdLHd3xP80oiV+8KsbAzFGaFsj0EsTMaVQbT9sDLmjWdobsPbb
4mycslslD6BsU3kMh9dbrsuE+vU+wXAA9p0IOUAQzg9XFHVN958ABRKZvbIh+wC7
OFm6cKOqK6alxdpUQp1hXnQKhi2yMZm8Bvsp5L9VC3xenq2UzycFh5s20EC3XD5K
lWR9nmywCdOrWt5FftTpXvIqWwLuvEadOpu3/XjJlbpTQOsLP47zDaQimUjO43GF
hLby+uiWc9HpKuV/RrTyQ5un1YAk+vRPzHuHOCjbP8uGSu7YVas2bZtTm0pdtSQc
xPdq3OoPINnDfHXVu6gzlEOnaLriIfh9hWe+VfXx6YFcAgka4uF8EX9IqXOACkO1
tighqNk2584w8f2eU56YRMozMsA3sMWBaWelie/sdrqrNbI3REDwVXjfKUGWhaUm
nz56qXzr8TKNQda8jPZmycg2mxNZWFRXu61At30dEAlxJiFa1N2fCNvNwfHXqhkQ
iFfOBOIs5BqCNMPR6/5poCPghnB2MAf1zXyq3r9462kxxvVp16NHZ+6yT0BNI4PK
2MFXWv6It0nxG3idwPkf7k8JRh0In6CW9EBRENlkvihZj8vyXNrZyBWM5gglP8YU
BhYzaXgpcSXAvTksel20
=Ef9W
-----END PGP SIGNATURE-----

--=-8TSVLGdYP66t4bREtOlh--
