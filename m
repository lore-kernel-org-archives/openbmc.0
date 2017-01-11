Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyrqn2dJkzDq5s
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 12:28:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QCrgbYn6"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Hr52BL9g"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A2B020980;
 Tue, 10 Jan 2017 20:28:00 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 10 Jan 2017 20:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=v1sEIkaJ8aHRgLxDD4ml/NKypEA=; b=QCrgbY
 n6c9H/l5twn5xCTCq2TBcFzpGgqRlVUdCWA15IP7ibKq03eZOnYSZfwr0JLJndHd
 6xf9dEqULSsSrwAAWGGKuMnnPKCDD3TGf0QaVhGrXoVcKZK1dxLJ+q93T5+4FWW5
 Y1hMIUC7qJH61F9Ef2xXDS0n2XQGt402sb7Ek=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=v1sEIkaJ8aHRgL
 xDD4ml/NKypEA=; b=Hr52BL9gTN1kVpH7dPUemdyDYtkPZP2oR6y0QdLYDsyi8B
 HrzPcrVQQipuGpaAtAzDWePW7KJgGh+Y3DcIk7/V7vUyYl1qhLmwmeEO9JkNToGE
 902do+I9FOmzQmt+ny9AYt+NGG4lxRHqObWg3mVekBybH+is24QzIOVZ0QlGE=
X-ME-Sender: <xms:IIp1WAPFzCaOv_UvKpMS3gZau4KqFQzmDOLUS2Ddi814k_hpyasEAA>
X-Sasl-enc: Ru+y43vDlhPEEwn8Zel4e8VBPdJXaMHHHeeHrfLPAGR8 1484098079
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C66E42443E;
 Tue, 10 Jan 2017 20:27:58 -0500 (EST)
Message-ID: <1484098071.12800.14.camel@aj.id.au>
Subject: Re: [PATCH v3 5/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 11 Jan 2017 11:57:51 +1030
In-Reply-To: <20170110090640.12608-6-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
 <20170110090640.12608-6-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8BKuNqkJQcslE9YHFBOa"
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
X-List-Received-Date: Wed, 11 Jan 2017 01:28:06 -0000


--=-8BKuNqkJQcslE9YHFBOa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-10 at 20:06 +1100, Cyril Bur wrote:
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/timer.h>
> +

Given Joel's feedback on various issues, please also audit these
includes, we don't need a number of them.
--=-8BKuNqkJQcslE9YHFBOa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYdYoXAAoJEJ0dnzgO5LT5YrsQAKcIpy9RXdMgGRAMCH8e/UfB
2Fl0vYXIDpF6hh7+ZOVse7+hIKInLErGzdHXeTsxQphb527L5n1cB08knS+boG6s
gmsdqN7rRMPSNIyj4PYx8KsQtcJV6P+1ks37QRLa8ANRp0YmnmL5RCJ8SZJAOJ9A
2mFtDk0bq7WE5L+OghrFnjAZDasqUyeOmFRz6gStxnw35tYxXMfEdEtA8m4Bngvv
2g3/A3AZzG54Q97R8Z2qyHhtWm3aI0yQln1tQaYX/LCS2aoxaAiSQwIISj/P0ej/
AXS7ErPI7i/CfPx5HapXplPgLNd+yBJ/oh5mO7rduHszIzVOuEN4shG1gyMSU00v
dKgNqRlWO/48Bo67gk88/Or4P3UblHe1C37Uq4peOmomcQXtkcsi3R/eqD/ic7l8
2IVYyLnNQATpifQP9XzOtLp/JzSWDSSMpiFu0OmIwbMlKfacJdM3ksm81iflG1Aa
gq7dxg/rtx1aloJ5tflzHgA/WtGf5zrt3daYuDV4tf1GaasTCQxXpNU3Bxc8dZeA
t794MSipNHILqvlY5gSMb5DRoGgxYVXx/ak87IumogNbpSTRUTREOKRg2nE6Hmg8
GBPuUImxYF5Ids40E6sT4a1RdJsHVOeYUCD1a3u5mgh5dlg2BDrceVkT+cCoqysJ
HxIaVlaVrC6b2B5qTcKI
=Xh9m
-----END PGP SIGNATURE-----

--=-8BKuNqkJQcslE9YHFBOa--
