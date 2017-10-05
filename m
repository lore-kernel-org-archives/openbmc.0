Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TSjWVYQ8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rDwY8ilS"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TjK6Vz9zDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:38:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7059520A8F;
 Thu,  5 Oct 2017 19:38:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=e4Ak0npIWOCGjccGtIvrParJP7m03r6XunFvijUFm
 xg=; b=TSjWVYQ8J2qOYvoIme7J0vqGB8w8fRR/0YjtKHqQjj1du9ipfcmaht+R8
 xb8jF+k5vbuJjgoHnE4bDThWECq1f+HAO5MGPMxCSF1gIHJd865cfRndCwWrWCyy
 sfRDKybb/Hp1/U1eHEooYssH1vna2QOtF08z2e058rml4oyzBpBoQEhz5XEuv0v6
 udGsi8NBEEKJ4rQqmnZ+abBl7ABrPpiQ3IRpvLxjcJw2FW4X6JXlYOjL1jGT8nO+
 OuvrGQnVD0udB9mxG2ZYha4KJZphf930pdvU/+D8/NaQpRCpBv/XBx4Mz2lEV4zE
 MU+MTtttH7FNlrc7+6VLfsJv/6ixw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=e4Ak0npIWOCGjccGtI
 vrParJP7m03r6XunFvijUFmxg=; b=rDwY8ilS4bIHv06bu5SPB+3t8o+lHDGUNo
 KB38FtnSFjIJm/f/vvIge4XoVXvCQegZO2is4jxwc0TH5RqfkmEYf+osANG/THEk
 8r5LHYyCi0hHw+KcC1ygZ2PzK13CgKQFlhPg/5JfwToVKhoEFNzdqNNY7lPtP0ET
 zVkaf8bwI4H57J6ryS+nRLk3S2v/q77wdLpC0142H5BktLgoebemSc99xPhhcLWy
 GdW1SrK6hLLq56sTcgrdyEF7GEjA7n4sgCoPxaeTcQcaBPyUNSuMxwoIHDf+C7Wl
 6ZAH0/Z+g27dxlBc32787/YHw/6DcMwiWoHKA9yw1vwXBjmrx1fQ==
X-ME-Sender: <xms:YsLWWQkUXX2WUYTP6Az-LUpRTnFm4UCDN7wlJs8I9-5r11b7ZbFbIA>
X-Sasl-enc: 6h0+FTzLte4XaImnvJYu+xgrzx8XOisTJu0wHKnVu7WT 1507246689
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6C93C248DD;
 Thu,  5 Oct 2017 19:38:08 -0400 (EDT)
Message-ID: <1507246684.5452.121.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 30/31] drivers/hwmon/occ: Remove
 repeated ops for OCC command in progress
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 10:08:04 +1030
In-Reply-To: <1507231464-13635-31-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-31-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-IaoZZC8KPeePk6kWWbLc"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:38:14 -0000


--=-IaoZZC8KPeePk6kWWbLc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> This is now handled in the occ driver.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/hwmon/occ/p9_sbe.c | 14 +-------------
> =C2=A01 file changed, 1 insertion(+), 13 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 2d50a94..c7e0d9c 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -26,14 +26,10 @@ struct p9_sbe_occ {
> =C2=A0static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> =C2=A0{
> =C2=A0	int rc, error;
> -	unsigned long start;
> =C2=A0	struct occ_client *client;
> =C2=A0	struct occ_response *resp =3D &occ->resp;
> =C2=A0	struct p9_sbe_occ *p9_sbe_occ =3D to_p9_sbe_occ(occ);
> =C2=A0
> -	start =3D jiffies;
> -
> -retry:
> =C2=A0	client =3D occ_drv_open(p9_sbe_occ->sbe, 0);
> =C2=A0	if (!client) {
> =C2=A0		rc =3D -ENODEV;
> @@ -52,15 +48,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cm=
d)
> =C2=A0
> =C2=A0	switch (resp->return_status) {
> =C2=A0	case RESP_RETURN_CMD_IN_PRG:
> -		if (time_after(jiffies,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start + msecs_to_jiffies(OC=
C_TIMEOUT_MS)))
> -			rc =3D -EALREADY;
> -		else {
> -			set_current_state(TASK_INTERRUPTIBLE);
> -			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
> -
> -			goto retry;
> -		}
> +		rc =3D -ETIMEDOUT;
> =C2=A0		break;
> =C2=A0	case RESP_RETURN_SUCCESS:
> =C2=A0		occ_reset_error(occ);
--=-IaoZZC8KPeePk6kWWbLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1sJcAAoJEJ0dnzgO5LT5n2UP/1R+6fZXY7kB2ghzfQxkvYZ+
eofrnPAuMMcnoo5KAYgQ7dI30EiUQ5ALfixsvDpRFotCM/AB0E8XE7iKofVyigmz
m+OHjYHqcZfgvmCfQQPJOCS3V7nFl1I9zVfyMAA0z/k11OZAOSK1YevHL4zHtWwE
LRhcFzZecUvLT0XClNUUXMDwUfKs+J+tloeIZxBEB/sYDiwxOSweWnLetoTuDUfe
FXxr71bIBRQGyHvj45K/MloDEGSzlk/11RehVGMmvwh4/A7bgWWr04emRA8yHe70
b36QpKFqTAU7LZGBzPZPfWVacAW+QMdccQ07/TxMi6wxxi/7beDItHoFV+D1uORx
SAcco/KUFuomTyCqzcZVvp73LuC2/Mwlbn8cyc6XV35dNKlrBTZ0OAL9knYdoWj8
18Y8zzN0j+0KXHG2481lV5L4r/JJDydrWEdaprY77PY8RLoxwmeER/5aXIRv2hwd
yPRPxtKYy0H4VlI3KUyHy9uEvyOe5dCpyPiVJzduw1NQbqS5yVYe5Vl5gEa3XP3W
P70c/I95LxOE4MAxt5kpFB6/I/QTbE7KUQ3P9HKKMoY/pEjD/ck89M2gJ4gxRUU/
7m+5Tvy3uWyx6KtFUQy6FLH9Hjoc7AbZ8EX4OTOcqHrrteBtp4HXiaNLu7X8hI+5
glPu5uLx4wSXbCg2IJpp
=JHw1
-----END PGP SIGNATURE-----

--=-IaoZZC8KPeePk6kWWbLc--
