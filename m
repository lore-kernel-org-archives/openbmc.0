Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="T+Drv4ei"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HZOITWZA"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TT76hNzzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:27:39 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D1CC320B75;
 Thu,  5 Oct 2017 19:27:37 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=gF50rwNy+wDz5/TOqySgxWLkNBDhIrgEr4gGN3+lq
 Kg=; b=T+Drv4eiKsIPATakDdQ8Z3GX4Vht6CttN6on/bM/JVPIJVFVAAj4KisW1
 cVr7lZDEM/DNxgWRGaum+BAtyFoQ8H1bbPHoY2PhTSdULLmUB7tJFGzYWrB7y5cj
 uUbarlLiKZ80/M3W8g6/+iCvtkPVezwGeKpjcYQxk7UUefD8zYCv7ZSUX7hmQWM2
 y2pF8DKzGxyRHItTbq8het9uoQKidLFyZGGBEIrjQakazr24mz8cqa61UEjnuftB
 7i0/tw3SGmF+67qcK/EMBW8VmML0OKcFIY0suRM0NYc2PIPQ+AETrKoUVyAnY86B
 ZR6Ol/3Bv5r6+tONawsNboGxMZtMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=gF50rwNy+wDz5/TOqy
 SgxWLkNBDhIrgEr4gGN3+lqKg=; b=HZOITWZA84V4LzMjioNyoH+f8moHaD0bWe
 BoZcUF/7CB1KzlkoIqnEBpjLBdD99FCmPmHVCZMUm1aY0F4N7neWL6adxxez8d6e
 KXdW0aBK2LeXEPbaiaZ4VLTXAyvAAYAIZt0wE0T/UCphCQaJPoWF/M7ZsIZXYLpf
 aDdIpPS3t07KIaNiBQthF4F50QhD84+BpQLFmWDEy7gofKaO+DIyXExBY32iKSpu
 CCLXNPtf9fXIAzHi4mzC7LxS9tAiQOOuGIGPUeSgL8EeJ2/sY9rkXmKlbH0ReUC9
 /PQEYjRg22GbT45oi1v6IPFgCJV6wczYjAShFWcoFi1MAaascsNQ==
X-ME-Sender: <xms:6b_WWZN4PK7HpsTVJoD9J1DbsJuoh9UAg1KecJtmoo1e8JkuQJl_Pw>
X-Sasl-enc: nmOZJaJlP9s7Zd0wsOhDjYamptDRhEhyzcVKcCxrgjse 1507246057
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD5EB7FA70;
 Thu,  5 Oct 2017 19:27:35 -0400 (EDT)
Message-ID: <1507246052.5452.117.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 27/31] drivers: fsi: occ: Poll while
 receiving "command in progress"
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:57:32 +1030
In-Reply-To: <1507231464-13635-28-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-28-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2LvY32VbW9D0apZHz7MQ"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:27:40 -0000


--=-2LvY32VbW9D0apZHz7MQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Waiting for OCC to return something other than "command in progress"
> should only be done in the worker function, instead of clients repeating
> the entire transfer when they receive "command in progress." In this way
> clients don't have to check for that return status.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 27 ++++++++++++++++++++++++---
> =C2=A01 file changed, 24 insertions(+), 3 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 29a17ed..8555e99 100644
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
> +#define OCC_CMD_IN_PRG_WAIT_MS	50

Where doe 50ms come from? Is it a bum-plucked number? Or should I dig out m=
y
OCC documentation?

The rest looks okay though, so:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> +
> =C2=A0struct occ {
> =C2=A0	struct device *sbefifo;
> =C2=A0	char name[32];
> @@ -569,6 +573,9 @@ static void occ_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	int rc =3D 0, empty, waiting, canceled;
> =C2=A0	u16 resp_data_length;
> +	unsigned long start;
> +	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_MS);
> +	const long int wait_time =3D msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> =C2=A0	struct occ_xfr *xfr;
> =C2=A0	struct occ_response *resp;
> =C2=A0	struct occ_client *client;
> @@ -590,6 +597,8 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	mutex_lock(&occ->occ_lock);
> =C2=A0
> +	start =3D jiffies;
> +
> =C2=A0	/* write occ command */
> =C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> =C2=A0			=C2=A0xfr->cmd_data_length);
> @@ -601,9 +610,21 @@ static void occ_worker(struct work_struct *work)
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
--=-2LvY32VbW9D0apZHz7MQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1r/kAAoJEJ0dnzgO5LT5PBMP/j4fTYlUV1vSe9r2IVVZvXGm
2xxsNT5G5xMIqlGXEhKDF75rON8rcHIcsXD3BFs7NQUHW/oMzfvOsILqVcT8GBR6
jUhNnVBMGdN/euhg+pirXItwqcm514epurAiPZb9XAJriHMcUfN/u16CvN9DcY6E
zAfrpxjTyA1P7a3owN3Y/yOPmRVrcDBeZKfR7i3XNbhHbQ72D7Wo8BepDdshyS8a
1jXFiorJINq5/XflggBJpoSuJxMjV6YcODbp99aWFYD4O0d5DPSAUZN4wkEoU4mH
iRDRLMpyR5bOfhaeGUeA3LJJpW459nny/eOa1uRHDCXeX/yotMT/IntJyHWwAkiT
1x7fcQ0NT6htDx0lYvWpfwve2Hfg8aVZJyrjjFacXQ+8Pvq8WO0IhUbCPKf3jqp2
gAuG3sjiUjdc4YhnIEC5xgxEUKRg1xwXgdoxc6DA+Txsi1FX5hMDWIznQPQo79tD
x6o6teaqX5jaBRQXfJnUeZQgnZlDqEi8Uh1Q9tmx+6EE/51NjOHyzACmZh3YAMA6
RPAKI2zd+N7Y6HEbPZ4owYEuGNnB+5Pie6m2LkMJFtje22ZO0YKrrBZ+9Wy0fOyz
PHTSBbvh7EoiJDthsU4Blu9TTtmWzCuuUx4IJWhShTx79ddgoY5ASXZesft7CRal
Efv8v+U5mYCmMqCRHu8k
=oH/0
-----END PGP SIGNATURE-----

--=-2LvY32VbW9D0apZHz7MQ--
