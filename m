Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZqXOr5+Y"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C+MVn5G6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Sh046l2zDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:52:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A12020AFD;
 Thu,  5 Oct 2017 18:51:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GNobp7MKc/OzH3VOXw7gUFGFzuJfAZBOziAG7qzGU
 BU=; b=ZqXOr5+YJv1g7B+p19Y4EofiX/05k/r0QMKSCva4nASJsILvkMxu9rlPH
 4925yb536kdS2x2VLpBxWJv7ZLDXOatuB0LkzT6r+0xI6umiXphrhQ8uaGzNtbJX
 VIxceylXBNj88/wdk4V/6KkBvqPHVx5oGKfnMSLL2fRRZb2gWBasqitmPWSjmQBi
 wxssJx+WENJ+KMX7KX5N3FlpnwurWZ7q5n0ZFosmiZoMXeHLCzy7lyxgzB0ibxZH
 DmhRyYar1MgdQXGdpL2AwlIyTwKd3VcoreSJjKkMC5fPVHCCcXtGqO2+9v/4iNqY
 zgL/MwGuuHSRqW2cignIE756vRnnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GNobp7MKc/OzH3VOXw
 7gUFGFzuJfAZBOziAG7qzGUBU=; b=C+MVn5G6JfS0GcLhhrYBUqNY5WzaUB7Xjj
 zgmbLCQQYrLgR1aauqlorxNvXzojuWIqyFRSeIagZ78x9iopu2rpKzbJSl2EtBGV
 47+ZInPfCs3I1+Ph5Kx4Q9k647/N9s+Ww0E32642xow+FrU7shbD85g3XbMWCuOy
 BRLMDIqfAwYjar7ReechWAEeGG+6Dz144wJnlJxZvD9T1dbXdiRP0h4AspTxodl7
 qCNBAXkCUN1RAKmezEte+TZG2AShj+jKVextQKmNGvGf1MiNMZbNfVPNbiJuQPIJ
 uFzHQDQoM8vU3CSlquQrIwi3hTTgPd4t+cX8kbccFYYQnwHIy2Zg==
X-ME-Sender: <xms:jrfWWeWpA5W1Vw6-6MR3LTdl0AUa5zintsO4wD3_2JTcn1fkjmBuYQ>
X-Sasl-enc: 5enXLF2KQmORh7h4q3uQyonTF0viKPjNYqiqWbrnQMlm 1507243917
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CE7524009;
 Thu,  5 Oct 2017 18:51:56 -0400 (EDT)
Message-ID: <1507243913.5452.97.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 15/31] drivers: fsi: occ: Fix includes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:21:53 +1030
In-Reply-To: <1507231464-13635-16-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-16-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8SPaF2DbjJeVOBtBqaun"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:52:01 -0000


--=-8SPaF2DbjJeVOBtBqaun
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Need to include everything we use and not rely on recursive includes.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 621fbf0..2d7df8a 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -10,16 +10,21 @@
> =C2=A0#include <asm/unaligned.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> =C2=A0#include <linux/fsi-sbefifo.h>
> -#include <linux/init.h>
> +#include <linux/idr.h>
> =C2=A0#include <linux/kernel.h>
> +#include <linux/list.h>
> =C2=A0#include <linux/miscdevice.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mutex.h>
> +#include <linux/occ.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/uaccess.h>
> =C2=A0#include <linux/wait.h>
> =C2=A0#include <linux/workqueue.h>
--=-8SPaF2DbjJeVOBtBqaun
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1reJAAoJEJ0dnzgO5LT5AyQP/25Qq49YdP88SHZBLOqIjaMj
YyG+UzvkxPjoMsW3rL2ZXezczo5pRnkJMiei9kpFbs9k8Szvfj1o59gB7hxSQx5Q
xAY7h6+Cfcs5gNsw8vK8XqnxZGYvhBOb71NuglCGL2AMmFsL8IYV+Cs58aOhZcTA
XS5XHHBjH9jTuTFl7U41WPM25wEx52ubnmqu0363Lu6O8Z8F8iFY5kUtY0/qWNdT
ClbM68v5TJi7cvqAF27kq2GIdlsboik9UUHenZ8AVUz+G/Z+Op4u7YUkbeSgv++s
UWJcW0nsjTSTSvMVXUTy/WgyJQSmFKHQDPtw1sSY2KRETaPoGrmuLez5cNOPq+dX
+Kt1yI2ppI/+UQGE8LEVSP28yXUGDkoQhJKVPyyW5N++QARZeKqoUwVTl2Wc1o9e
P09gg3jJkCqSaH2I9CIfhho84wXOLt9U8KbbARHQ9veSAJ59CuUjOfWR76nrB+DD
JFUlZcrz1tUs2C+1OKW+bBYXZEsou8jApVc/Oaz5Loty0bqBNNq4/es+fpSQiESR
1YOF2H9RxbW9jTSRtxGy1c4WNGDQAB4vp9Ewq+c6Wpb9+7Eqm6jhnvz5nIya4ueA
baplHy2/gvDXFKPgjGzJZ9L97C8xfavNxwbDG027lwwtMpY8L9rKsy/3IxVHPZUr
iUaPWg6kqBWNTT/oeYdr
=CEz2
-----END PGP SIGNATURE-----

--=-8SPaF2DbjJeVOBtBqaun--
