Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F89OXMK5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XU2HN0nC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RYn0bDZzDqhb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:01:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A08020EE2;
 Thu,  5 Oct 2017 18:01:30 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=1yo0njl8n1piOFF+Yb1Vcpky2Sg1doatbE6nZ9u+J
 Ws=; b=F89OXMK5c9H60j+MgMYudlSkDiQJmk2SmP4wubkWXjxYS18f0qtM6ODFm
 bjRlWwy0isVieVQeGJGD+gHtAwS3JvQhuvQXOLMQuCfR/3+eXJuZLMEqFjbRBqhB
 1QTbG3B25xOyCWFqkwLv0dbkbkKECwc8DrNy309QSkCW/mQC8qMlIJKoQAg6hGBV
 G1hXzR7LKMrVlUXJJHqgNnGna9MLmnHI4RVdMJVl6nQqj1wwIG/MpeVGcTYvJpBk
 hJ4/krlvSK9jfCNHj2hEojhHvUdNU+5vlblaaZZbZ4xCqTjgYkqFtzc9Qe2YSbTl
 YnAsWTSEu7cXecwHBHibvw8B6kKHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=1yo0njl8n1piOFF+Yb
 1Vcpky2Sg1doatbE6nZ9u+JWs=; b=XU2HN0nCuLKIlGxoJ2laogiNAMb1YG92f0
 NGL6F9hUu2RWlxjS3Yf7SWSmHJsAzGqkGbQRZxbXDzIhRpzFSr+OtePYk1FYUaVg
 DlfcdBmHP5WJNXR0v8ao+Q1HDJSzzslNHEtyRCMJyAcFAOGO1Vi2XrLdBamepCtd
 p1HdI3ak5ShQHRg78s8ET0xBumksLcWiXmfsoneXfPBRmQ4g4Z3iwGOyss4gRNf0
 bl7TshHjpqcsfc/Sy93NOjISVXwhJX4tnGKzZKQlO2O7rqAInSvHRuKbKWx10xEI
 rjsW9n60ApSUd0YjtMo0oUmVFlJBbwb1sUpuqcRtbKbqc2RTtkaw==
X-ME-Sender: <xms:uqvWWXG-al-MESdJzNIP3kUFwo8KkkXcpWgmq2dYsfFmNchSAI_P5w>
X-Sasl-enc: Sl8rmIaG6vVeubS+9D9B3WwJJpMJ0OKO//JnYOTBjpwV 1507240889
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id C35CE242CF;
 Thu,  5 Oct 2017 18:01:28 -0400 (EDT)
Message-ID: <1507240885.5452.87.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 09/31] drivers: fsi: sbefifo: Remove
 warning and user data access check
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:31:25 +1030
In-Reply-To: <1507231464-13635-10-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-10-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xXZrm9Kl6dG6GP6UO99G"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:01:33 -0000


--=-xXZrm9Kl6dG6GP6UO99G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> We check for user buffer access when we copy the data. No reason to
> throw a kernel warning if there is an offset provided; just ignore it.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 10 ----------
> =C2=A01 file changed, 10 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 5efba30..60b133d 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -621,11 +621,6 @@ static ssize_t sbefifo_read(struct file *file, char =
__user *buf, size_t len,
> =C2=A0{
> =C2=A0	struct sbefifo_client *client =3D file->private_data;
> =C2=A0
> -	WARN_ON(*offset);
> -
> -	if (!access_ok(VERIFY_WRITE, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return sbefifo_read_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
> @@ -748,11 +743,6 @@ static ssize_t sbefifo_write(struct file *file, cons=
t char __user *buf,
> =C2=A0{
> =C2=A0	struct sbefifo_client *client =3D file->private_data;
> =C2=A0
> -	WARN_ON(*offset);
> -
> -	if (!access_ok(VERIFY_READ, buf, len))
> -		return -EFAULT;
> -
> =C2=A0	return sbefifo_write_common(client, buf, NULL, len);
> =C2=A0}
> =C2=A0
--=-xXZrm9Kl6dG6GP6UO99G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qu1AAoJEJ0dnzgO5LT5yhEQAKyUPV1Ue9aI8jTawsu5AO2Z
g03rqw6lOPHT0h43onxfmk4GMO2R/1rp9J/TXwlwbNsyRf7ME+ah24Nzo9VQGKLO
vqEhvls1I7Mt9ebJutiaadMEcAdPofgqUauNvEXCuDDtQxoE/zFFZBFUGmzVPkBp
NlqwIopFtoMdh3SLLyOgzxxpv2RnF1u/0Dx199ltUjiXlIh6kIEwAfD445EvmfV+
eQh0vieM37Cd9RLGZqtEMMchVnNsR3wMAaclh759O3dqHF6jMI2YCsVX/i50YF4m
W7BNWUSSFhxoD/5eNra0JwfUzor2pe0lXaNvAcmo65H5QJA213t8oynbvg3+SBRM
agW7jswt66BSE0zX7TBeDftczDwJ9mP8jQ0Pv/JcmpKnBlJKjCL/WPxQLlXgn5Z7
nIgqc5j5zALHsbgQO7JpYqyW8X8Uz1Hwp8fCmoL9i9G0RVJx+tpm0TANY+zWRTFW
TTAmDHHKoPJplVVWrEj/05bDVNUqNTfDMzUYCuZ5exXvhKwoaw413cuM7kl8gskP
IQg80IOcY/adRA2uF8EhlDHlp6Y/x4Be++lrI495R7Ag5w4DD5tORTl00fBrGhwG
Fuggz+Tc9YtMbrgz1fP/KqIFjiw8/u7VfEfSZr5xNBSDWtlSJLNTXnQCZshRQGl3
HCP/Ta3OP0NcHNLzJ96r
=YEIs
-----END PGP SIGNATURE-----

--=-xXZrm9Kl6dG6GP6UO99G--
