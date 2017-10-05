Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uK/XKIO/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="blEmCciY"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TFd2SyczDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:17:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C89420BC3;
 Thu,  5 Oct 2017 19:17:39 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=RQ7HvGwGAkqPkeS8d5rUK/baYm4X+Mc2Pc9y3qUrB
 Ec=; b=uK/XKIO/BwBjpOSvBCZG0B0pm+MfTRdr5nXKDQ9qRIXIv/E7/j7U8Ob//
 HOTni3S5yjiv6s899vZI4fKR7y5JlZVdAvEBUHIZT/+H7LK+za1ZpE4UaXDgF5Ux
 sMX4bLyo4PvQ+QKo7wKj6wdyK7jiJU2O6QGgU2fbMie7UOprmxWNc+E1vEf57qlr
 4P+gOS/4UpCoFzvMAMjDI5tuZZQldqwcDBRoPx/jzWeCS+O9HIs+j/HRt8qGy0fF
 1PIZBkPpYHvx4uGNEl/c5iYNN4KQNGrReWsCcGDHdFocipd53zP1cO7zdk3RwzFp
 yrukU11G9hbGmA4pd96phEu8/7nBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=RQ7HvGwGAkqPkeS8d5
 rUK/baYm4X+Mc2Pc9y3qUrBEc=; b=blEmCciYj2b8NFH2EMeZ2+c8+pTo54dOjm
 N6IOk2B0qTDaB2C+FGTzLmC8VIK6UObyjyFJFAvkdJy3scpyUgTuNBcvQrzNOzNJ
 kSRwR4mozbCR6BwgDGrlIyXUHh1ZY2vhM8g+tgTefpyq4PjKGbANAEqVDnBCfOOV
 vCCe/YCvd6Z2DffiazE1cniklR/mRQpkNRvU//O+r0kWduL6jUeP/LDtLuM4uBQF
 qAN+Y1fTscOHUxJHF1hnx/75kWhsKT257gC5/GWi0DOb0in1yvzPiNpBQmo16cn+
 Yv+J3OaHxyjOItyvZYRlU0qJ644mztCAgwM4Xv8lTCiBuoM/6pEg==
X-ME-Sender: <xms:k73WWWOChrHMNuayeHWYVEc0tq9m4T4tQ89-sIdcB-FnkAfa2wwYzg>
X-Sasl-enc: RjOm3ym69hR3iRgsB0Slx/iy3kWCOv73ABm6hm9pJtxb 1507245458
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42D7B7E4ED;
 Thu,  5 Oct 2017 19:17:36 -0400 (EDT)
Message-ID: <1507245453.5452.112.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 25/31] drivers: fsi: occ: Add comments
 for clarity
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:47:33 +1030
In-Reply-To: <1507231464-13635-26-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-26-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LFKHdl+9A0tDIaWHUXZT"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:17:41 -0000


--=-LFKHdl+9A0tDIaWHUXZT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Fixup some existing comments as well.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 55 +++++++++++++++++++++++++++++++++++++------
------------
> =C2=A01 file changed, 37 insertions(+), 18 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 561b029..29a17ed 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -39,8 +39,8 @@ struct occ {
> =C2=A0	int idx;
> =C2=A0	struct miscdevice mdev;
> =C2=A0	struct list_head xfrs;
> -	spinlock_t list_lock;
> -	struct mutex occ_lock;
> +	spinlock_t list_lock;		/* lock access to the
xfrs list */
> +	struct mutex occ_lock;		/* lock access to the
hardware */
> =C2=A0	struct work_struct work;
> =C2=A0};
> =C2=A0
> @@ -57,17 +57,17 @@ struct occ_response {
> =C2=A0
> =C2=A0/*
> =C2=A0 * transfer flags are NOT mutually exclusive
> - *=C2=A0
> + *
> =C2=A0 * Initial flags are none; transfer is created and queued from
write(). All
> - *=C2=A0	flags are cleared when the transfer is completed by
closing the file or
> - *=C2=A0	reading all of the available response data.
> + *=C2=A0=C2=A0flags are cleared when the transfer is completed by closin=
g the
file or
> + *=C2=A0=C2=A0reading all of the available response data.
> =C2=A0 * XFR_IN_PROGRESS is set when a transfer is started from
occ_worker_putsram,
> - *=C2=A0	and cleared if the transfer fails or occ_worker_getsram
completes.
> + *=C2=A0=C2=A0and cleared if the transfer fails or occ_worker_getsram
completes.
> =C2=A0 * XFR_COMPLETE is set when a transfer fails or finishes
occ_worker_getsram.
> =C2=A0 * XFR_CANCELED is set when the transfer's client is released.
> =C2=A0 * XFR_WAITING is set from read() if the transfer isn't complete an=
d
> - *=C2=A0	NONBLOCKING wasn't specified. Cleared in read() when
transfer completes
> - *=C2=A0	or fails.
> + *=C2=A0=C2=A0O_NONBLOCK wasn't specified. Cleared in read() when transf=
er
completes or
> + *=C2=A0=C2=A0fails.
> =C2=A0 */
> =C2=A0enum {
> =C2=A0	XFR_IN_PROGRESS,
> @@ -89,9 +89,9 @@ struct occ_xfr {
> =C2=A0 * client flags
> =C2=A0 *
> =C2=A0 * CLIENT_NONBLOCKING is set during open() if the file was opened
with the
> - *=C2=A0	O_NONBLOCKING flag.
> + *=C2=A0=C2=A0O_NONBLOCK flag.
> =C2=A0 * CLIENT_XFR_PENDING is set during write() and cleared when all
data has been
> - *=C2=A0	read.
> + *=C2=A0=C2=A0read.
> =C2=A0 */
> =C2=A0enum {
> =C2=A0	CLIENT_NONBLOCKING,
> @@ -101,7 +101,7 @@ enum {
> =C2=A0struct occ_client {
> =C2=A0	struct occ *occ;
> =C2=A0	struct occ_xfr xfr;
> -	spinlock_t lock;
> +	spinlock_t lock;		/* lock access to the client
state */
> =C2=A0	wait_queue_head_t wait;
> =C2=A0	size_t read_offset;
> =C2=A0	unsigned long flags;
> @@ -273,10 +273,15 @@ static ssize_t occ_write_common(struct
occ_client *client,
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
> -	/* clear out the transfer */
> -	memset(xfr, 0, sizeof(*xfr));
> -	xfr->buf[0] =3D 1;
> +	memset(xfr, 0, sizeof(*xfr));	/* clear out the
transfer */
> +	xfr->buf[0] =3D 1;		/* occ sequence number */
> =C2=A0
> +	/*
> +	=C2=A0* Assume user data follows the occ command format.
> +	=C2=A0* byte 0: command type
> +	=C2=A0* bytes 1-2: data length (msb first)
> +	=C2=A0* bytes 3-n: data
> +	=C2=A0*/
> =C2=A0	if (ubuf) {
> =C2=A0		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
> =C2=A0			rc =3D -EFAULT;
> @@ -354,7 +359,7 @@ static int occ_release_common(struct occ_client
*client)
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	/* operation is in progress; let worker clean up*/
> +	/* operation is in progress; let worker clean up */
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	spin_unlock_irq(&client->lock);
> =C2=A0	return 0;
> @@ -419,9 +424,13 @@ static int occ_getsram(struct device *sbefifo,
u32 address, u8 *data,
> =C2=A0	int rc;
> =C2=A0	u8 *resp;
> =C2=A0	__be32 buf[5];
> -	u32 data_len =3D ((len + 7) / 8) * 8;
> +	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be
multiples of 8 B */
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> +	/*
> +	=C2=A0* Magic sequence to do SBE getsram command. SBE will fetch
data from
> +	=C2=A0* specified SRAM address.
> +	=C2=A0*/
> =C2=A0	buf[0] =3D cpu_to_be32(0x5);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa403);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -470,7 +479,7 @@ static int occ_putsram(struct device *sbefifo,
u32 address, u8 *data,
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0	__be32 *buf;
> -	u32 data_len =3D ((len + 7) / 8) * 8;
> +	u32 data_len =3D ((len + 7) / 8) * 8;	/* must be
multiples of 8 B */
> =C2=A0	size_t cmd_len =3D data_len + 20;
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> @@ -478,6 +487,10 @@ static int occ_putsram(struct device *sbefifo,
u32 address, u8 *data,
> =C2=A0	if (!buf)
> =C2=A0		return -ENOMEM;
> =C2=A0
> +	/*
> +	=C2=A0* Magic sequence to do SBE putsram command. SBE will
transfer
> +	=C2=A0* data to specified SRAM address.
> +	=C2=A0*/
> =C2=A0	buf[0] =3D cpu_to_be32(0x5 + (data_len / 4));
> =C2=A0	buf[1] =3D cpu_to_be32(0xa404);
> =C2=A0	buf[2] =3D cpu_to_be32(1);
> @@ -518,11 +531,15 @@ static int occ_trigger_attn(struct device
*sbefifo)
> =C2=A0	__be32 buf[6];
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> +	/*
> +	=C2=A0* Magic sequence to do SBE putscom command. SBE will write
8 bytes to
> +	=C2=A0* specified SCOM address.
> +	=C2=A0*/
> =C2=A0	buf[0] =3D cpu_to_be32(0x6);
> =C2=A0	buf[1] =3D cpu_to_be32(0xa202);
> =C2=A0	buf[2] =3D 0;
> =C2=A0	buf[3] =3D cpu_to_be32(0x6D035);
> -	buf[4] =3D cpu_to_be32(0x20010000);
> +	buf[4] =3D cpu_to_be32(0x20010000);	/* trigger occ
attention */
> =C2=A0	buf[5] =3D 0;
> =C2=A0
> =C2=A0	client =3D sbefifo_drv_open(sbefifo, 0);
> @@ -573,6 +590,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> =C2=A0	mutex_lock(&occ->occ_lock);
> =C2=A0
> +	/* write occ command */
> =C2=A0	rc =3D occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> =C2=A0			=C2=A0xfr->cmd_data_length);
> =C2=A0	if (rc)
> @@ -582,6 +600,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	if (rc)
> =C2=A0		goto done;
> =C2=A0
> +	/* read occ response */
> =C2=A0	rc =3D occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> =C2=A0	if (rc)
> =C2=A0		goto done;
--=-LFKHdl+9A0tDIaWHUXZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1r2NAAoJEJ0dnzgO5LT5/aEP/RrQtKEpauK2uC/hVinAdBFD
Dpvq805B5iPQnCdW6i4LmBgVxe3uyurYtENkPAcprlbZ7OEgkMvCKHlZtgQmc+DT
dsgHuJrAckFzLoVX0REuKySBukOpTD45DIENl6xsLQ0eASglAdpQFaSXV3K8BSh5
Jtrqc/EFyBaLNAOx/2QBM2AWPpZdvoJhMM2w/7kDR/Me42b6fUWiOstSDl9huzrb
2sT2QMB+bVCOyWyy8Gdwm1fj2/RPMQOAAuM57K/7veicPoUwJwU6UMGSNw2w8bH1
IwfmJnvfkm3i5KokM8xKRmP0PbuypkbWKQpWwp7ZSKWcvtgI8h7v2p4h3TO4BWSy
0zoxEPu+BgiWP3TZSHx+2ZvANPRR5+E+LzODraH8eTOJ+60Zgi4mtcs569ZWOftu
+ftDl08NMZRAtcq4N3yHKKyLFM0gg+dkMT7giX/hjqfZG7fMO6X9q1Bt3lGlRr/i
/izL399LM5V93OwR5VQXYL6/Ziofgw7gUB61xR6k94S2TQkvf6JfEMPrBP96ixed
hQkV2N6GkYLMAK70+s17QB2huX3FsWQku4L6ByzjDBJfWK3JZrVIWBjiBYp17bUt
69odZWzi22OY+LPbCRXAFpjCii9RzOxkJWCQUIBj0l4emWRu4UrzUgmBlxR+UDr+
pfKBvl9SsCGqKH9GF9Bs
=Soua
-----END PGP SIGNATURE-----

--=-LFKHdl+9A0tDIaWHUXZT--
