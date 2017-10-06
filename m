Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Wiuac9kd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UKdEYcJS"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y9p1HcNzDqlv
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:14:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1360020AE2;
 Thu,  5 Oct 2017 22:14:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 22:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=dxgHr+6HzwkY4DdaQErMyPqzvR99h+TMz9HW9w68r
 Pw=; b=Wiuac9kd0t+nkf86hir5fsF7T5VdA2ogSBwgixPteRyhkMCS0uN2D0Cz9
 4xucBeEgDRRkCb3M1+E7zOPEVmzSiymI9BTbCO5N/uZCqf9LyO9Ext7juhlkgCRs
 HjK3hv+lddC8poSEJMCHkmrN4uxQyeXc4A3WWCbChPoA9NdNjX8nOu2rtgmgsNsX
 Idv22GrwT6B0//IbUhgJ5OCOg4SvDamviGPeSiRhsysT5ClwbFU1owIUeTrmjf9o
 8X2CaTBJfaCJXskVnivsWWRCtLNtzkZWsWD6jZtWmQ945pHMR35R6Gd9cWuYaCS4
 uajwjLgPW/zWHM2wXfWRwpM+slBwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=dxgHr+6HzwkY4DdaQE
 rMyPqzvR99h+TMz9HW9w68rPw=; b=UKdEYcJSLgCMzcki5QG+uyXqyMVSicv1GS
 rBxCzjQI/c1GHHPx1JVH6GXHrzdLIqDcp8Lzqk8CLcs6tjp0WSIlzdWS336MxhYO
 Agmc7VVtDuYofbhEsQiijXUuRtnG9H9XnLSWbemDgksm/7yEs7lM9x0Dleq1ifUU
 6h78x+qKxUuB/K3DTyp66CoeOS64Na4juGBJvvEApuVSra7ufmr4XgQJF+cMuia/
 WB/FABL3J8FepgS2jcls8Yf2+zCIAqNcpevk5UCwaYUYPXVcTelcbjY04qIQmaaJ
 t0i1fsSAHfex4scBPLSuAjjTokisMqMuceTgPe17kbLZp1EGETOQ==
X-ME-Sender: <xms:C-fWWWauBppBWSr3qfKC8CbjIPgObWaKn_lWYyyMO2f-uv7amWKrQQ>
X-Sasl-enc: fN6xF9n/oga+TOTW48Ky1jVHEhSeQ7tJErIEaKqdg8eo 1507256075
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1BE777F9A9;
 Thu,  5 Oct 2017 22:14:33 -0400 (EDT)
Message-ID: <1507256070.5452.133.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v4 22/31] drivers: fsi: occ: fix white
 space and bracket problems
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 12:44:30 +1030
In-Reply-To: <1507255553-13301-23-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507255553-13301-23-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Ebpnaf/jmY92wGamPIcB"
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
X-List-Received-Date: Fri, 06 Oct 2017 02:14:38 -0000


--=-Ebpnaf/jmY92wGamPIcB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 21:05 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> For better flow and to meet Linux standards.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 28 ++++++++++++++++++----------
> =C2=A01 file changed, 18 insertions(+), 10 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index c2fc14c..6e20bb3 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -132,9 +132,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
> =C2=A0
> =C2=A0static struct occ_client *occ_open_common(struct occ *occ, unsigned=
 long flags)
> =C2=A0{
> -	struct occ_client *client;
> +	struct occ_client *client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0
> -	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
> =C2=A0	if (!client)
> =C2=A0		return NULL;
> =C2=A0
> @@ -163,6 +162,12 @@ static int occ_open(struct inode *inode, struct file=
 *file)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static inline bool occ_read_ready(struct occ_xfr *xfr)
> +{
> +	return test_bit(XFR_COMPLETE, &xfr->flags) ||
> +		test_bit(XFR_CANCELED, &xfr->flags);
> +}
> +
> =C2=A0static ssize_t occ_read_common(struct occ_client *client, char __us=
er *ubuf,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *kbuf, size_t len=
)
> =C2=A0{
> @@ -185,8 +190,9 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		if (client->read_offset) {
> =C2=A0			rc =3D 0;
> =C2=A0			client->read_offset =3D 0;
> -		} else
> +		} else {
> =C2=A0			rc =3D -ENOMSG;
> +		}
> =C2=A0
> =C2=A0		goto done;
> =C2=A0	}
> @@ -202,8 +208,7 @@ static ssize_t occ_read_common(struct occ_client *cli=
ent, char __user *ubuf,
> =C2=A0		spin_unlock_irq(&client->lock);
> =C2=A0
> =C2=A0		rc =3D wait_event_interruptible(client->wait,
> -			test_bit(XFR_COMPLETE, &xfr->flags) ||
> -			test_bit(XFR_CANCELED, &xfr->flags));
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ_read_ready(xfr));
> =C2=A0
> =C2=A0		spin_lock_irq(&client->lock);
> =C2=A0
> @@ -227,12 +232,14 @@ static ssize_t occ_read_common(struct occ_client *c=
lient, char __user *ubuf,
> =C2=A0
> =C2=A0	bytes =3D min(len, xfr->resp_data_length - client->read_offset);
> =C2=A0	if (ubuf) {
> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset], bytes)) {
> +		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
> +				=C2=A0bytes)) {
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
> +	}
> =C2=A0
> =C2=A0	client->read_offset +=3D bytes;
> =C2=A0
> @@ -273,6 +280,7 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0	xfr =3D &client->xfr;
> =C2=A0
> =C2=A0	spin_lock_irq(&client->lock);
> +
> =C2=A0	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
> =C2=A0		rc =3D -EBUSY;
> =C2=A0		goto done;
> @@ -280,7 +288,6 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0
> =C2=A0	/* clear out the transfer */
> =C2=A0	memset(xfr, 0, sizeof(*xfr));
> -
> =C2=A0	xfr->buf[0] =3D 1;
> =C2=A0
> =C2=A0	if (ubuf) {
> @@ -288,8 +295,9 @@ static ssize_t occ_write_common(struct occ_client *cl=
ient,
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> -	} else
> +	} else {
> =C2=A0		memcpy(&xfr->buf[1], kbuf, len);
> +	}
> =C2=A0
> =C2=A0	data_length =3D (xfr->buf[2] << 8) + xfr->buf[3];
> =C2=A0	if (data_length > OCC_CMD_DATA_BYTES) {
> @@ -446,7 +454,7 @@ static int occ_getsram(struct device *sbefifo, u32 ad=
dress, u8 *data,
> =C2=A0	rc =3D occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
> =C2=A0	if (rc)
> =C2=A0		goto done;
> -=09
> +
> =C2=A0	resp =3D kzalloc(data_len, GFP_KERNEL);
> =C2=A0	if (!resp) {
> =C2=A0		rc =3D -ENOMEM;
--=-Ebpnaf/jmY92wGamPIcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1ucGAAoJEJ0dnzgO5LT5UHwP/3IVdFHoyxg9Z2mdixpsR533
gQMwf7CfBCzHCVhPx+asfTU6YlBu+WykufIzl0dZ2v30Zx9I/oubF95a/iMSs5xV
lDmqbgI1MLHgDRqyG+MyoIWIMZEhWsFaRdJmgZgFiHFUeT2DoOGCU8PQoKM6fzZU
xrHrSJoiaW3b+4fMA2WtfI2NULP7c6yTqquecaQ8j8rakqipEgpja0T1DoC/odPu
N891jQC98cmtf9LlLQMCAruCaLFaOMHpvd6+PGelHo41zBQoZ/iMaTQBhgNF5ABK
7De0mqDCRGPMJi/Eu6CNphokQNSGCLyblDV+261BtAM17gGB/hEHB8NCYaPnmaQ9
xx9TZZNk1x36hZRqd9LO82P7LqMHocTNb8fikSkOsxppnOgijSXdVevhERRNaLm3
TJioh9V2LTl8tWESQcCseLp/VCzz/nLgutNE/dOWTrm9jNGKYiHCc0hhmdc2OF1A
GYPpT8E9ax4zkXzo5oB/+wZX61plxUTN+zWw3vLYpVf1oPud4bkata/Uirws6p+M
HBqU7azZtRhyVb4rT1njyHtV00XjUsR7C9JUgxYx7HIzca2riKq9ueJcISVwHAYq
i9d1HUlhTlDHn8ncg64eVDqY9sOr8jzExP4xtgkYsUcwzUgYEkcSk3n425QC25Dx
7MsnLZ7K9Gzngi2ISXmu
=erRs
-----END PGP SIGNATURE-----

--=-Ebpnaf/jmY92wGamPIcB--
