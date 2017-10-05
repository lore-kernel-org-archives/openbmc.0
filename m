Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BCdQ/614"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d1AYGvCL"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6vbp2KNkzDr2M
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 12:01:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D93ED20FD6;
 Wed,  4 Oct 2017 21:01:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 21:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=gjX/SvDsN+T69S8YiIQbjm66/C2dktpuzyxfyUHDj
 UY=; b=BCdQ/614t7QQ+39wlnxFTELUwNyvSlYBD8zHtDM04w6iBWHo13bIAAinz
 iHnqyHfhfRFihY667KFwb/AncaK+WuX39qOKmjRRIjNP4SvOgJ1l0WiSxBwHnmwo
 vw/87OUsezvs9l3s1FkSx6KPIVjg45PtDahS1GDPEkI3btCRf9uipoDIVQm9By0e
 xjR00Rb0b1DQhhnQO+uGqBHAClz/k3gCJy+QRvHuLtTJfKP8ebx+OPr640Xps2nN
 Auf6vFPjk++Wx/ljEGSdMstzTG0x25EosW1EudiZC7h+j9ra6/Fw+9xByXZ/IPZb
 4NiVNdjkPPcXg2TEfY+n7wvYmh4ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=gjX/SvDsN+T69S8YiI
 Qbjm66/C2dktpuzyxfyUHDjUY=; b=d1AYGvCLNiHiNCOXu8F36WyFGbpjBe8cei
 fQqmTLiJgDN6S53Rsn+tgjVbp3FIWMu97okw4llRRMo9MiMEkqKDCs+UA9EPwlU/
 5nVqGgq5BHQFI04/eErINfKqA3mOw6ifUxbkhVVSQgVrdHvuVCziGJfFNaIdBJvK
 vWUD1CSmtJzBIMVwzR3gohymoe9jPU/ybv3cgvXnif178A21zhjRL5CxggqzxAWe
 E7RAHu8pNsU49DEydqYThUfGO1+tLJsYOCJuxvW0H+GUjC44imFUr7Sf1LKaVqXo
 vHzu8Y+YLjHqScDku7+BKkiNJ1Ey8HX6KTjy87rBN4taERvlTn4g==
X-ME-Sender: <xms:Y4TVWesGTKm8FJngVEDjtkPhgRuDjAVfCJ22l6nNrL6xe_vQyJAluw>
X-Sasl-enc: RTd21gwtnW/2i3GvYa8VSSfSXLe799BnXk5nCpP2sANJ 1507165283
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id C81AF24724;
 Wed,  4 Oct 2017 21:01:21 -0400 (EDT)
Message-ID: <1507165276.5452.47.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 5/9] drivers: fsi: occ: Poll while
 receiving "command in progress"
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 05 Oct 2017 11:31:16 +1030
In-Reply-To: <1506724868-13010-6-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-6-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/N+zQK16m+vntxYkEs46"
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
X-List-Received-Date: Thu, 05 Oct 2017 01:01:27 -0000


--=-/N+zQK16m+vntxYkEs46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> This should only be done at this level,

Bit of a nit with the grammar here: You're using 'this' in multiple context=
s
and I feel that explanation of the contexts is a bit lacking. Can you pleas=
e
expand this sentence to cover those points?

The intent of the change seems reasonable though.

Andrew

> instead of clients repeating
> the entire transfer when they receive "command in progress"
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 27 ++++++++++++++++++++++++---
> =C2=A01 file changed, 24 insertions(+), 3 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 3313e35..a554550 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> +#include <linux/sched.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> =C2=A0#include <linux/uaccess.h>
> @@ -33,6 +34,9 @@
> =C2=A0#define OCC_CMD_DATA_BYTES	4090
> =C2=A0#define OCC_RESP_DATA_BYTES	4089
> =C2=A0
> +#define OCC_TIMEOUT_MS		1000

The SBEFIFO spec defines different timeout periods for different classes of
command. One class uses a 1s timeout, whilst another uses 30s. Does the OCC
only use commands from the former command class?

> +#define OCC_CMD_IN_PRG_WAIT_MS	50

This is less than the 500ms reschedule period in the SBEFIFO. Does 50ms mak=
e
sense here?

> +
> =C2=A0struct occ {
> =C2=A0	struct device *sbefifo;
> =C2=A0	char name[32];
> @@ -565,6 +569,9 @@ static void occ_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	int rc =3D 0, empty, waiting, canceled;
> =C2=A0	u16 resp_data_length;
> +	unsigned long start;
> +	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_MS);
> +	const long int wait_time =3D msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> =C2=A0	struct occ_xfr *xfr;
> =C2=A0	struct occ_response *resp;
> =C2=A0	struct occ_client *client;
> @@ -586,6 +593,8 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	mutex_lock(&occ->occ_lock);
> =C2=A0
> +	start =3D jiffies;
> +
> =C2=A0	/* write occ command */
> =C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> =C2=A0			=C2=A0xfr->cmd_data_length);
> @@ -597,9 +606,21 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		goto done;
> =C2=A0
> =C2=A0	/* read occ response */
> -	rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> -	if (rc)
> -		goto done;
> +	do {
> +		rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> +		if (rc)
> +			goto done;
> +
> +		if (resp->return_status =3D=3D OCC_RESP_CMD_IN_PRG) {
> +			rc =3D -EALREADY;
> +
> +			if (time_after(jiffies, start + timeout))
> +				break;
> +
> +			set_current_state(TASK_INTERRUPTIBLE);
> +			schedule_timeout(wait_time);
> +		}
> +	} while (rc);
> =C2=A0
> =C2=A0	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> =C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
--=-/N+zQK16m+vntxYkEs46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1YRcAAoJEJ0dnzgO5LT5m5wP/1i/1s1ZGG8exGiOmYAT/DpH
ZCt5luoQa2u0aMY8v8/4ynBroZtmh1ziwZsfTRxnpi5285nBftX/oQ0nLUm00w4P
6qbqFzJLrbrfcZds7yiiBKldfGoSziQFgnQ/wvLfK9pZYh3aBfYnJ00m6017DOyD
8qT2mzhccyWcY8MgIsFXuCvXAVTltvnE97pVvghjh2fPvE3ssh0AnepUcJ3gyXBn
kanvCUTjvmhTFJs8xEw4CTCkjJieZyG5yEapG3wxUr2voEjZWqtte+1uehiRH/i3
rU7nX/aoci+mYrohr50RVKsXBi2zEdvbMW1f0BQR8FhVvzkJX0+CVa78LzXNen+e
38V7EmcLkz4F10P+SVqLcumfWJbOccBRdbivZPEJ2D5FwxuHYdBIJcB8CFe6jlye
BxUti4bFp6ZF29r2xlwawlPUzFwmQcT7YFpqNjzBOIDS7PQIgXSYS2vrGg9UM6G5
RYD2TT3VdQDJ5dN7BxbPRWbaGQ+BF4d6RPmzp3s2z4QMpGRKO8uX/VSlQbsAtpbD
gDLS25/Aq6towOVhCnMj4R+cX9VAwq2zTwW+LD2i6VRbE49ZvDGT2VTIopDqOikL
0YIOgjypPTUOIoSSR2PCOyghMVQQQD0f8JaFhRSHqJvqV89A3dMI5l/yd5TT28Xq
OFTM9TL8ZF0k16sz1tkw
=nrXY
-----END PGP SIGNATURE-----

--=-/N+zQK16m+vntxYkEs46--
