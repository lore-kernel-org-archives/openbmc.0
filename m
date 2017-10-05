Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VcS/2bLR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Nktbq1KZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Swz3sKTzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:03:15 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C012C20914;
 Thu,  5 Oct 2017 19:03:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=7PzuCwK6i7USnt82wOV4GjQG/JNuiUwwq4+IS8WAz
 sE=; b=VcS/2bLR2aKGLITbbgxMapu9cKXzgJUPzAQA+rQs4jv56x6zUWeBe2fWX
 5vw3JEiwIMdImb2LG3G3xwRhHSwioZXHAGShxemqrNDqCPf50URZkeFbkYGsS+eY
 5OwEeD/A1JCR8zu+4o6f3XU+VtoNaGveRWcviZvUDkx0UnIB88GkATHZL+OE1dX8
 taJa70kzJ7xEaCCrmU+Lc6M4jmN9/zsokdqU+cMhyK4tH/nWST9DaP281JloC3sC
 LP0GXiIiDePVV+e8EJNuC71+EAjWT6e2Shl4/AxV1kNL4Ffnx/zHmmtPCuSsqYtG
 q6nmeV+lg1aGiFwpjKEpz0EunpZDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=7PzuCwK6i7USnt82wO
 V4GjQG/JNuiUwwq4+IS8WAzsE=; b=Nktbq1KZAtPvvaqNpmmfBYjnUegyuaM3yw
 kHJfhWbrq1fE5JSmnmbOlCdN4ubtPI3WfqMZaj6xY+4FeZDlpeRp7OvEloSerCNe
 v2AashEzVGkLUYvq/ek8/f7RfBshopLnYpGoyHhmg6R78friju3PfanyREsP0PQk
 wf13f28VnGX8eu6H1D3T/ALLsQmNqqMt9yQG3PdfIYTEA8uByf2Ck2bp/ZpSOxAG
 GFpmpNSgzzh5Ldf3LzOp2nzk/DJ3Si8SPKiO5G5h0I7OXpgPFGwSNMUJxN3sqtHM
 aClX+Xch8owRlDkIBwbOfFGkKQqB0HzBcFVJWLiMkaSZIDjXnWlA==
X-ME-Sender: <xms:MLrWWf-wGImsohMwXvRgRQpTjKOk3arxQkzatFEBEi-0mIutZqRNSw>
X-Sasl-enc: Z0KHqKTdndScYtBN45SjfkUuziwp11pTlZdcbDFd/D4+ 1507244591
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8B297E4ED;
 Thu,  5 Oct 2017 19:03:10 -0400 (EDT)
Message-ID: <1507244587.5452.101.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 18/31] drivers: fsi: occ: Use
 big-endian values
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:33:07 +1030
In-Reply-To: <1507231464-13635-19-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-19-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1ROtu+SUNZsVsIVShO83"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:03:16 -0000


--=-1ROtu+SUNZsVsIVShO83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Switch to __be16 from u16 and __be32 from u32. Also, use kernel access
> of unaligned be16 instead of manually creating a big-endian value from
> the occ response buffer.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 14 ++++++++------
> =C2=A01 file changed, 8 insertions(+), 6 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 82a60c5..55f293d 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -50,9 +50,9 @@ struct occ_response {
> =C2=A0	u8 seq_no;
> =C2=A0	u8 cmd_type;
> =C2=A0	u8 return_status;
> -	u16 data_length;
> +	__be16 data_length;
> =C2=A0	u8 data[OCC_RESP_DATA_BYTES];
> -	u16 checksum;
> +	__be16 checksum;
> =C2=A0} __packed;
> =C2=A0
> =C2=A0/*
> @@ -425,7 +425,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0	u8 *resp;
> -	u32 buf[5];
> +	__be32 buf[5];
> =C2=A0	u32 data_len =3D ((len + 7) / 8) * 8;
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> @@ -476,7 +476,7 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t len)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 *buf;
> +	__be32 *buf;
> =C2=A0	u32 data_len =3D ((len + 7) / 8) * 8;
> =C2=A0	size_t cmd_len =3D data_len + 20;
> =C2=A0	struct sbefifo_client *client;
> @@ -522,7 +522,7 @@ static int occ_putsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0static int occ_trigger_attn(struct device *sbefifo)
> =C2=A0{
> =C2=A0	int rc;
> -	u32 buf[6];
> +	__be32 buf[6];
> =C2=A0	struct sbefifo_client *client;
> =C2=A0
> =C2=A0	buf[0] =3D cpu_to_be32(0x6);
> @@ -560,6 +560,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	int rc =3D 0, empty, waiting, canceled;
> =C2=A0	u16 resp_data_length;
> =C2=A0	struct occ_xfr *xfr;
> +	struct occ_response *resp;
> =C2=A0	struct occ_client *client;
> =C2=A0	struct occ *occ =3D container_of(work, struct occ, work);
> =C2=A0	struct device *sbefifo =3D occ->sbefifo;
> @@ -573,6 +574,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	resp =3D (struct occ_response *)xfr->buf;
> =C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> =C2=A0
> =C2=A0	spin_unlock_irq(&occ->list_lock);
> @@ -591,7 +593,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0	if (rc)
> =C2=A0		goto done;
> =C2=A0
> -	resp_data_length =3D (xfr->buf[3] << 8) + xfr->buf[4];
> +	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> =C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {

You need to do be16_to_cpu() before any comparisons.

> =C2=A0		rc =3D -EDOM;
> =C2=A0		goto done;
--=-1ROtu+SUNZsVsIVShO83
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rorAAoJEJ0dnzgO5LT51bAP/ApwZMz4j/q0/oRd5hYDZpNH
Y2x7ssfHOGkoxKCQZOjAvCyy1t3xOY7BrJgUz1orbMcA9DiYGzEIgVfo/WnTX0/A
2Hhf/KTzM5t0hwIciEN2F+jyvkd+CRgGuriDSJ+AOL1OxDI5u3V1/eQbK/Q+MkJ3
/KWdEfK09IZSerP5Smc2HKyrgZdE4R6CbjSOSHAMteM8UfYLmmTVZxhYYdtdf045
8JtLR6Vnmnf/F12EwnB7i7Bs7hVP3lU2HVyvwUwXgrmSnbw1kkuaOQHVq6pbpeUk
kh2w464QnzGEROcMfs+5t6CT3mp0iow1AsRIMuEcrU4iUQA4RlwnEYKlwy07yEyl
sZngjgcTri0dOtZnjLq05jpQNm+H1jroH/6u24gx2Iy9xCAuEyl7o2wEsxIdZ7kN
cjbDP6xx92aHGIip/j6EYLnqPn5DBSJ7JVZGa7+iAvIHiPR/UmuvYbf/L7AFq/z1
umEhww6jhMJfF/KWSNOV10JwSxQ72mH/NLidIH4+5s30ugKy+d5pXEhTYeTNB++4
OplibKfAAwU+XWhDYXodlsSQgX939dwn5OGC99BxapNKHaBaH0Fg3PbHb3t3uw6U
835PDPPrMbnySPOtK6dagcrr0sFEWOfKNX22DVOpX2yaM+PeNUywWR9lfqZCfDvA
WdapXW/UzuxJxChgcky6
=1vtu
-----END PGP SIGNATURE-----

--=-1ROtu+SUNZsVsIVShO83--
