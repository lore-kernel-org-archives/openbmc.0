Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KIKBnjhv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B8D4ULeQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TQ76rgGzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:25:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 284E520DE1;
 Thu,  5 Oct 2017 19:25:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=o7yq1M+KPRC4pS0MYDISKqt98pUUDT7RyrqbPoL1Y
 1A=; b=KIKBnjhvyoSZ7s32cFGRE/XNvOTZ9Bf40Ly0uHJ8F4otlRWxJbrpx5No0
 NVxO9/lh+gcSrskkNc466XuGngLOhn1MnqPv50W77DW6fo01tULLaitsKhFv14xD
 e3lWU76UtkkIQZ3QwgVFpj+sWnm6M55ajJVjKUkG0R+JOageYmg8PuB5QpdRoDf9
 FdtBG9ihxD6IsFj5LhWGuqNtL5NtbSics/zh3LZW2o0rlKGquq2VsFzd6/KT8WYl
 bHm+DVeN3iyg3iA5zQKrbK+WvInNcQXDBH6JykW9iGY5fY6rypnaP6pDNj4nphGm
 soJNAkuYhIdy0xS2BumtOg/M+iSWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=o7yq1M+KPRC4pS0MYD
 ISKqt98pUUDT7RyrqbPoL1Y1A=; b=B8D4ULeQczsMje/LKaMgpjOtOjMn7WrPr9
 6TbC8NgEvGJBJ+D+RPPos6Ku/Hf2GResGMz/Asjt9fae1EO/5WwfMYbTCTEDR0ma
 CsEOzJ5gkaZRKZEwRfOCNuHo51G+e4yINz85kGTeWNz2NzkPWtBmHXkVJH4jAN+0
 HzRyvNx4SiRRIkn712kItJs3YBpPQY3PFZUpgf2R+H20KOY5WuarluzUacRL3DPZ
 A35hlh1OngYhAotyOplWtoOr7XJDUDU8w0Uf7nw3Q4RhU84gMd21T+4Buz6CXhXM
 j542CloJlhXdY68prTTKf73JpPAAm1Tg91HF1jGJRxGw+zkz2qDQ==
X-ME-Sender: <xms:Tb_WWYgj3ydbQ9xoUx0r-pTs_EmixHJdy3lpTjXFLQ1qosOAZtbo8A>
X-Sasl-enc: SiQQVEBgIDzQaSVGPcQofDCJjzzoacGzKKZANER+p18V 1507245900
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 732DD7E4ED;
 Thu,  5 Oct 2017 19:24:59 -0400 (EDT)
Message-ID: <1507245895.5452.115.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2 5/9] drivers: fsi: occ: Poll while
 receiving "command in progress"
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:54:55 +1030
In-Reply-To: <e86e3a2d-84dd-de2d-bc1f-7d5c8a243553@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-6-git-send-email-eajames@linux.vnet.ibm.com>
 <1507165276.5452.47.camel@aj.id.au>
 <e86e3a2d-84dd-de2d-bc1f-7d5c8a243553@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QW/cnRJWmLoj/6Mmw7xF"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:25:04 -0000


--=-QW/cnRJWmLoj/6Mmw7xF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 10:38 -0500, Eddie James wrote:
>=20
> On 10/04/2017 08:01 PM, Andrew Jeffery wrote:
> > On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > =C2=A0=C2=A0
> > > This should only be done at this level,
> >=20
> > Bit of a nit with the grammar here: You're using 'this' in multiple con=
texts
> > and I feel that explanation of the contexts is a bit lacking. Can you p=
lease
> > expand this sentence to cover those points?
> >=20
> > The intent of the change seems reasonable though.
> >=20
> > Andrew
> >=20
> > > instead of clients repeating
> > > the entire transfer when they receive "command in progress"
> > > =C2=A0=C2=A0
> > > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 drivers/fsi/occ.c | 27 ++++++++++++++++++++++++---
> > > =C2=A0 1 file changed, 24 insertions(+), 3 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> > > index 3313e35..a554550 100644
> > > --- a/drivers/fsi/occ.c
> > > +++ b/drivers/fsi/occ.c
> > > @@ -23,6 +23,7 @@
> > > =C2=A0 #include <linux/of.h>
> > > =C2=A0 #include <linux/of_platform.h>
> > > =C2=A0 #include <linux/platform_device.h>
> > > +#include <linux/sched.h>
> > > =C2=A0 #include <linux/slab.h>
> > > =C2=A0 #include <linux/spinlock.h>
> > > =C2=A0 #include <linux/uaccess.h>
> > > @@ -33,6 +34,9 @@
> > > > > > =C2=A0 #define OCC_CMD_DATA_BYTES	4090
> > > > > > =C2=A0 #define OCC_RESP_DATA_BYTES	4089
> > > =C2=A0=C2=A0
> > > +#define OCC_TIMEOUT_MS		1000
> >=20
> > The SBEFIFO spec defines different timeout periods for different classe=
s of
> > command. One class uses a 1s timeout, whilst another uses 30s. Does the=
 OCC
> > only use commands from the former command class?
>=20
> These are the long timeout, but I don't see that this value corresponds=
=C2=A0
> to the SBE timeout.

It could if the OCC wasn't responding with "command in progress", as
the SBE driver wouldn't be able to tell the difference. Don't know
whether that's possible though.

>  If the SBE is timing out, we're done for anyway.=C2=A0

Sure.

> This is to timeout if we see OCC "command in progress" response for too=
=C2=A0
> long.

Right.

>=20
> >=20
> > > +#define OCC_CMD_IN_PRG_WAIT_MS	50
> >=20
> > This is less than the 500ms reschedule period in the SBEFIFO. Does 50ms=
 make
> > sense here?
>=20
> Well that reschedule in SBEFIFO is only if you have to wait for more=C2=
=A0
> data. A transfer doesn't necessarily have to wait that long. In this=C2=
=A0
> case I'd be hopeful that the op can go through all at once since it's=C2=
=A0
> just 8 bytes. Haven't done any benchmarking.

Okay, thanks for clearing that up.

>=20
> Thanks,
> Eddie
>=20
> >=20
> > > +
> > > =C2=A0 struct occ {
> > > > > > =C2=A0=C2=A0	struct device *sbefifo;
> > > > > > =C2=A0=C2=A0	char name[32];
> > > @@ -565,6 +569,9 @@ static void occ_worker(struct work_struct *work)
> > > =C2=A0 {
> > > > > > =C2=A0=C2=A0	int rc =3D 0, empty, waiting, canceled;
> > > > > > =C2=A0=C2=A0	u16 resp_data_length;
> > > > > > +	unsigned long start;
> > > > > > +	const unsigned long timeout =3D msecs_to_jiffies(OCC_TIMEOUT_=
MS);
> > > > > > +	const long int wait_time =3D msecs_to_jiffies(OCC_CMD_IN_PRG_=
WAIT_MS);
> > > > > > =C2=A0=C2=A0	struct occ_xfr *xfr;
> > > > > > =C2=A0=C2=A0	struct occ_response *resp;
> > > > > > =C2=A0=C2=A0	struct occ_client *client;
> > > @@ -586,6 +593,8 @@ static void occ_worker(struct work_struct *work)
> > > > > > =C2=A0=C2=A0	spin_unlock_irq(&occ->list_lock);
> > > > > > =C2=A0=C2=A0	mutex_lock(&occ->occ_lock);
> > > =C2=A0=C2=A0
> > > > > > +	start =3D jiffies;
> > > +
> > > > > > =C2=A0=C2=A0	/* write occ command */
> > > > > > =C2=A0=C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> > > > > > =C2=A0=C2=A0			=C2=A0xfr->cmd_data_length);
> > > @@ -597,9 +606,21 @@ static void occ_worker(struct work_struct *work)
> > > > > > =C2=A0=C2=A0		goto done;
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	/* read occ response */
> > > > > > -	rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> > > > > > -	if (rc)
> > > > > > -		goto done;
> > > > > > +	do {
> > > > > > +		rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> > > > > > +		if (rc)
> > > > > > +			goto done;
> > > +
> > > > > > +		if (resp->return_status =3D=3D OCC_RESP_CMD_IN_PRG) {
> > > > > > +			rc =3D -EALREADY;
> > > +
> > > > > > +			if (time_after(jiffies, start + timeout))
> > > > > > +				break;
> > > +
> > > > > > +			set_current_state(TASK_INTERRUPTIBLE);
> > > > > > +			schedule_timeout(wait_time);
> > > > > > +		}
> > > > > > +	} while (rc);
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	resp_data_length =3D get_unaligned_be16(&resp->dat=
a_length);
> > > =C2=A0=C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
>=20
>=20
--=-QW/cnRJWmLoj/6Mmw7xF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1r9HAAoJEJ0dnzgO5LT5kVsP/3TYCcTVhMwjDyeb/1W15vYU
rB/g5M1a5GaxrRUWCF6vjX6EcBfNLh5JIa7S0vSeGd2KEjR+Bg2w9l0JgyMKjOEa
RPqz/UsyXSFcRKOLu2KDojZH9u17lOcT79Ir6PNBdfZLyVbC6SUgoznCaO9R/Vlb
xFuG6qu2WSLuiX5Wen58AlV0GLT3FzfUqbJVmcEyzDZsue4YqWMJ0TX1T61ayoV+
139tTw1s5olB2tiHh5P53zWlZwoo5ZauCruLTHlRBW90poMXA4RiSmq1iMkggmh8
nuUaKZG2H5ynmF1P7t1r/4FgdRt7yBmAs6wX3HWEHIPzvAxmHrBYEM0Vkk4nHeHC
b4eLYvJgKhKDHSPRpg7UIOSiXq8lS6JjtJTWJYPQl7nGj1EILFeXNvtxdl9i/auc
0lL9x+uzH6EsWKOAs+Sm8aG8wcSNXWkyVK4mGI4bh/oMeT6JJQMsi9vmQy7+BrKu
CPOAwgtMikI6vkKJxR+vkWmPavLg/zo67IMqjWDeFywxLaVYznt0aFZ4QBnANHhj
GGq4nU/ndSFne+DLUg4MYbewxlK8dMfpGpmEs9hwXSNgBYf7JOhWBVn4M2GBPxrT
qUaYPu1xzvyCtH6QsSIKHlK43lrdpPwQLupBvDhH4DV85mYrg92EXPfuHly+q6J4
5kZXYkCBXfA6IAhH/3DC
=oE3B
-----END PGP SIGNATURE-----

--=-QW/cnRJWmLoj/6Mmw7xF--
