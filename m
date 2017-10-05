Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oWkPnxkA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J7ffdaO+"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7QtH1dClzDqG2
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:30:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D93220BC2;
 Thu,  5 Oct 2017 17:30:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=h9cJK0E/r1t4hXeIg3vkS4Wbw2S5X1WZFtnbEHEan
 Js=; b=oWkPnxkAEt6OmHGhJuF9b+lPTuRhL0L/paW7HefAYKaPtVtmoY43YUw3+
 KZo9V6Og3w/n22e6GmAYep/pHZtgImFFbX18iSguCfKI1o7uRrW9B16ktC8J2PCw
 GRdGwjidDYLRB0POL8sfB+0fkGHuYFjAm/CT9B4Ro4fFyvJEYkCnDVs+uvkBoPHA
 7vIIB6ldae6m7cK7OGns2CMHLnC2+18z+aTLcorVBc4ENfFTuu1DswFZ5mN7K70d
 c3R0A1MASAcPHtXiMUulS8V9tV1IW3GWSKdDNSe1iRiY7X2j9hnJJZ3uL5KrmTGy
 zK6jLDUl2oYgofiw1rSc+/+ICmbeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=h9cJK0E/r1t4hXeIg3
 vkS4Wbw2S5X1WZFtnbEHEanJs=; b=J7ffdaO+PP4a1oXLS1fvfK0GTZcTKKNmmv
 iI0yGVssbo7jvRAlBKOsIjU+IfgnqoWqIPMDzy1aArfpEscb3zwaDjm8XJMsf3T2
 fIKuFI7nQ4rZX19vB/2oDpgc0wusTLSCecFm7eSOqz/furtVK6xkmwMj4gjDFjIY
 Pq96BDE8+T8InZbJdR2tIjMSu1auylWFk/+2lCA8jRx36hR2Qi75gL2OCq2wUGvX
 mrphZwC8AUhYnc60iDGblqGoSEAX9OnesbD+hNkO05Rp8BvYg/Qa99qVm0GMm2SS
 hU8waVdz5YXa5XCJC3D+6R97NzS5nZJdgXPndbMCbAxAER0l5Sdg==
X-ME-Sender: <xms:gqTWWY83OWYai-BQz2miH2nGxjd-HJIP6vR8NsuAmSYSfG7Wsjt5Cg>
X-Sasl-enc: JA3YKfxVtm/Ce33+kQ/b4c/dxEEqw8GhOID4vaGeITHX 1507239041
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6865E24009;
 Thu,  5 Oct 2017 17:30:40 -0400 (EDT)
Message-ID: <1507239034.5452.72.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 01/31] drivers: fsi: sbefifo: Fix
 includes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:00:34 +1030
In-Reply-To: <1507231464-13635-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-afnnS9GS3VrQqfa4Sg9f"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:30:49 -0000


--=-afnnS9GS3VrQqfa4Sg9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Need to include everything we use and not rely on recursive includes.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 11 +++++++++--
> =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 1c37ff7..6fa75a8 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -11,20 +11,27 @@
> =C2=A0 * GNU General Public License for more details.
> =C2=A0 */
> =C2=A0
> -#include <linux/delay.h>
> +#include <linux/device.h>
> =C2=A0#include <linux/errno.h>
> -#include <linux/idr.h>
> +#include <linux/fs.h>
> =C2=A0#include <linux/fsi.h>
> +#include <linux/fsi-sbefifo.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/kref.h>
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/miscdevice.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> +#include <linux/of_device.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/slab.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/timer.h>
> =C2=A0#include <linux/uaccess.h>
> +#include <linux/wait.h>
> =C2=A0
> =C2=A0/*
> =C2=A0 * The SBEFIFO is a pipe-like FSI device for communicating with
--=-afnnS9GS3VrQqfa4Sg9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qR6AAoJEJ0dnzgO5LT5AsQP/2XdBWv2tYNQefN0cku2JM7g
ylRp29iZRXXCzKCkTlF6ovJDb8B7/t+4E2hSDETZn2QAqGteGZTAXtnOmLpAerIE
fLCkLYpIuMSbkcyF5zcc7GqEvj4ws/y4iSj0CR5i/R3Y9nFgaP+/BoFbYm29veNF
toI3H/mrwhQR6SkDuC1XhZ1Svughg4qBjfQ0XrCMMdB1kAUtm8OMonA1Y10N6vKJ
9+2EBUyMv9VH+AEnyuwOoCmPYPkQCN1fQQ7u5HKvbqqXn5+AJAyIk0xPa6e3FpJO
tfb8O6tPQDlBBZuVmMNCfd4SJmmHz29vZAeNQx9JjfddnURjAjD0F8JGP6kKv6r3
LQLYfawsVsz/Rj7JuWQA4FXuLWLowef6M+hQKwMmxG465LR7d2UVEYF9KgoBBkL7
P6NoJKZll1w97Y0rVMoy/bIEccsijgjTYE8OSRF60RiWpSM42gtLkbuvSE0vSmJd
M4Sw0bQiuw3dvq3GxCrAempeexxGag4mpwH6qCglSFq8aEZVXeF5Ajv8be3HbBzg
SUzFG1X5ArJgXddq3GuYibtI4QoaYzMf39FFUyD/l+K007QQ5we5JJBa9nb6s0HO
brvgnd08TEoNcaocde6/mkcVy/7y9aYWO7MA3mOmjsty3A2fZCBjFdaXLwa/+NfN
H6153pWLVZZ1ZCCsbzVF
=32da
-----END PGP SIGNATURE-----

--=-afnnS9GS3VrQqfa4Sg9f--
