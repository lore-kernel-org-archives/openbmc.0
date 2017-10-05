Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Lb8xe5xo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pNxvziP6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7T1q3prYzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:07:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B16B20BD2;
 Thu,  5 Oct 2017 19:07:25 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GJInwqU/50s3Ki7ihHPUIjZNWLQD6rn14VH/icWAC
 m4=; b=Lb8xe5xo1GJ3WtrQ69OSDKzN+rk4za58ocfm7erMqgcUY8GXoNDgg9Zuk
 8iRJgYRtVYrHuiuO5YZMPrTnynHBX5/r3AFaBgXvZ08aWn+aKrnVRSZT/tOme9hs
 bWfvoCvKQi33lwzLH9RwQiECw/XAMhoz8YxR8aWJbEH0nZNQ8tckf/+JzFjjCovS
 ziAn8PIrFUseI03LEJGuUTneVBda8IQ3GQQrcUJp29uTh/EfJjnD59cxFLuUNOmQ
 Um5EoDxjnO8GZW0ZL9slF56k4UsOe7sruAEyoirxC7I8P1QKfRpKHlgMsHceKmU6
 SFDoow412SO19qrx/lBk23dPPpPoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GJInwqU/50s3Ki7ihH
 PUIjZNWLQD6rn14VH/icWACm4=; b=pNxvziP6k8osd/OzTHO4ORxMNGdAikdfPO
 zu6s1sMbiGWo/0X9EQ5V+rGB5Spi1kTK+73KQOwFRSBgUWw30KZqeVRacxdgHm21
 4KxkjN20Mj4KWtEaQynvICA9sSgUFIpqEwHx1E5q9cF46MAYLnhceyVRDEZgT/vz
 o/n7Y6zwhdIzAQcPBT7QCbNuvhdSuLbzsKDDloCZ+POOnfIO1bKEAtgs6ciWmx4e
 qTf3gjCqB9t8Cq/lwPBYco07iiCPegGhNA3x4L/NeyogYKT6H/5nef7ovTOhVOCl
 Ov92ycC/KLGRY5OGDpP/VfHRuUrzHZH5Za42CIamOuORCc6P9GOg==
X-ME-Sender: <xms:LbvWWSGLSmgSSYhSzoLBvVg3ynBaBsmSdiDjXL1UdQknqNBtMunMbQ>
X-Sasl-enc: Wga/GOVrYaWjw91BmF+7KSiWXb10zfx+t/f0wFvnpqCB 1507244844
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 860107FA70;
 Thu,  5 Oct 2017 19:07:23 -0400 (EDT)
Message-ID: <1507244840.5452.104.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 20/31] drivers: fsi: occ: Remove early
 user buffer checking
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:37:20 +1030
In-Reply-To: <1507231464-13635-21-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-21-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eu8MAUMwtaC3DHGh30Dr"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:07:28 -0000


--=-eu8MAUMwtaC3DHGh30Dr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> We check user buffer access when we copy the data in read()/write()
> anyway.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 12 ------------
> =C2=A01 file changed, 12 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index a551349..7ced9b6 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -247,12 +247,6 @@ static ssize_t occ_read(struct file *file, char __us=
er *buf, size_t len,
> =C2=A0{
> =C2=A0	struct occ_client *client =3D file->private_data;
> =C2=A0
> -	/* check this ahead of time so we don't go changing the xfr state
> -	=C2=A0* needlessly
> -	=C2=A0*/
> -	if (!access_ok(VERIFY_WRITE, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return occ_read_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> @@ -316,12 +310,6 @@ static ssize_t occ_write(struct file *file, const ch=
ar __user *buf,
> =C2=A0{
> =C2=A0	struct occ_client *client =3D file->private_data;
> =C2=A0
> -	/* check this ahead of time so we don't go changing the xfr state
> -	=C2=A0* needlessly
> -	=C2=A0*/
> -	if (!access_ok(VERIFY_READ, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return occ_write_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
--=-eu8MAUMwtaC3DHGh30Dr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rsoAAoJEJ0dnzgO5LT5AlcP/3+6QhaPn4uNOF9sBW7+nyUU
5H060z/a0OPar+r5rYTrv1ggsf2RagJI9OVK5q31NhoP2P/oh/MHAI47UrTy2Aj/
94Nx5kYWIiEAqk/1HYRX3zym1LUddOPNTCgpefQuiZEOuR7m1eE5Z5M8NMpuWmYU
lnlruvV0NnpxzWR5OWqxMmVOVt6NRJG7thZ/pIGo3jA74M/h423jvRhwjcRwTTP5
FfGw+wuPZ1oMoxgWmsCFClQ/s/kSmXbzYOccTmWya3kWPX/zEve1bnOzH696xZ4S
PBhEIurIZ5RV5JigqjrzXIuWABAZgTnSxv9uLtXYVvyLlH3MW2yugRzuj0ZVAc4n
+sSENuxxIMNgcdoYuIAECYpjSpinCAim6QErLbKoW+4CYW3GEJWo/CksqZ5pSyp7
MJmS2eS6nWwT6TtfvgW5wMXx9ksPOS3jtJijSRGpt+BT+EVjMX03pXh+x8zyCevW
HYXvDcA8iDMf/+ihQaVFunPlhDuzpe+Q05etfTBM4NrxL6bvFO6nGopPyp00nztU
vwF2Vvc/pZMbzKUHbHQ+cI8BUwz0scLqrTNbbL+AuJA6MUn7iRSH2RAiOzqg5Dqd
sKeu76HOxeNAJyQxnIn2R92d4+1WSrx+Ctvy2oXbHdm95LkVmY1/RFddHH3Q5uia
U7BCKiA9NZxyxCjdl5it
=M5ap
-----END PGP SIGNATURE-----

--=-eu8MAUMwtaC3DHGh30Dr--
