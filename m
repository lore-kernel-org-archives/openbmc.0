Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fZPt1guq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o/Wc0ULf"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7T4X0kvtzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:09:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1240520EE2;
 Thu,  5 Oct 2017 19:09:46 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TulMvXt0PBBoXGiKat0iEJ8nnGbbYHSFl1gc1lamH
 wQ=; b=fZPt1guq6t3m/WuTPgQUkX3N9ScJxyqhkSE9AbhNOVEnIWiD6IEupRfA5
 vBkzmPmII6xc9RF5VnwvxiL9PasBwMl+nugDYoi/NGzDm9afp98DHFT294xV58Km
 +5ud4fQtP23waOZ8tdhrzj+JTUk8MuhY8de2bN2K1CrBl0j0sNx3ExgDzu9mReL8
 C4PhsYoqvpRBNw97d1L6a2tg/M7EyaeBoT1lHn2IP1aHJSMtWHfzziN98vfSg8VT
 tObR9jnwVBs/q2xeerKIJCiOU4vnydaJuLfHdsWZD8eHSvrbf+A0Y87HbSbLdMVV
 E3nTunsEz3VkbXYDSzLCverGEtOeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TulMvXt0PBBoXGiKat
 0iEJ8nnGbbYHSFl1gc1lamHwQ=; b=o/Wc0ULfiK+0wSB0eYY9Cvh72E0sHgb8KR
 FuCHv1c4Hi0BoRbXyK6RKAkRgTKpJC6Z/ihh66SmIuTLR5KUkF2xFZ7rNwZ+HpOw
 JH8Xs51XlpcO848gJXWZgetrtoudBl0Yy1BvwE14tnwMICcBoXe5NHlspSQlfIFr
 cVTAVz1zY2lVdFMt1RBe1JkCZpAwYAANyNz1cO3xGPw4OPBnTXMg3Pe8ZyCt7Eu4
 PcQfItSxYi2AX6Fj9wzsokzE2ganx2VLxrookfIfYmpEJvAgQwpCPZJXydBPb7iP
 lRxs79nAbLqPxaiToPZfcSrcaD4P4iB+OXh0kDkcv3d4La6Mq2FQ==
X-ME-Sender: <xms:ubvWWSBPbM7zwBAWYImD8Ys-deuqb25G7eJBN3vimNERkNP_dgxTng>
X-Sasl-enc: HoB5woILh8pnaggViJwkm3pxtN5jUp2GuZtB4nIqPsas 1507244985
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE8197F91F;
 Thu,  5 Oct 2017 19:09:43 -0400 (EDT)
Message-ID: <1507244980.5452.106.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 21/31] drivers: fsi: occ: Switch to
 more logical errnos
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:39:40 +1030
In-Reply-To: <1507231464-13635-22-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-22-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8wMED77+20swHw7XLJ1G"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:09:48 -0000


--=-8wMED77+20swHw7XLJ1G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 7ced9b6..4e677c6 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -386,7 +386,7 @@ static int occ_write_sbefifo(struct
sbefifo_client *client, const char *buf,
> =C2=A0		total +=3D rc;
> =C2=A0	} while (total < len);
> =C2=A0
> -	return (total =3D=3D len) ? 0 : -EMSGSIZE;
> +	return (total =3D=3D len) ? 0 : -ENOSPC;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_read_sbefifo(struct sbefifo_client *client, char
*buf,
> @@ -405,7 +405,7 @@ static int occ_read_sbefifo(struct sbefifo_client
*client, char *buf,
> =C2=A0		total +=3D rc;
> =C2=A0	} while (total < len);
> =C2=A0
> -	return (total =3D=3D len) ? 0 : -EMSGSIZE;
> +	return (total =3D=3D len) ? 0 : -ENODATA;
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_getsram(struct device *sbefifo, u32 address, u8
*data,
> @@ -450,7 +450,7 @@ static int occ_getsram(struct device *sbefifo,
u32 address, u8 *data,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) =3D=3D 0xC0DEA403))
> =C2=A0		memcpy(data, resp, len);
> =C2=A0	else
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0free:
> =C2=A0	kfree(resp);
> @@ -498,7 +498,7 @@ static int occ_putsram(struct device *sbefifo,
u32 address, u8 *data,
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D data_len) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) !=3D 0xC0DEA404))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -535,7 +535,7 @@ static int occ_trigger_attn(struct device
*sbefifo)
> =C2=A0	/* check for good response */
> =C2=A0	if ((be32_to_cpu(buf[0]) !=3D 0xC0DEA202) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0(be32_to_cpu(buf[1]) & 0x0FFFFFFF))
> -		rc =3D -EFAULT;
> +		rc =3D -EBADMSG;
> =C2=A0
> =C2=A0done:
> =C2=A0	sbefifo_drv_release(client);
> @@ -583,7 +583,7 @@ static void occ_worker(struct work_struct *work)
> =C2=A0
> =C2=A0	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> =C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> -		rc =3D -EDOM;
> +		rc =3D -EMSGSIZE;
> =C2=A0		goto done;
> =C2=A0	}
> =C2=A0
--=-8wMED77+20swHw7XLJ1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1ru0AAoJEJ0dnzgO5LT5PnYP/i/dYIQRPLRLT3byfpJjSANF
if3WSKn09/9pR1XNyItcSORd0USsftQxde2U38bIuCnjNbCrFXq8grgo+AjPaMPD
shnl7qn12OQ17q57IGtRhAThxO4jUCmMgdctBWCqQn6OGtGlx7X6MbXKLMR0Ravw
6SBcIsJWcAxQ6sI9vPpWiFjv65gyp9qEfLpNdVaYjJzSAsrkv312SC/aljfkXACj
/yk6GqeFxIs8vdoQj8DHTOOrzDsVDnqMPmgYyATUFL7mL1BhRbIX/r3LLxCkXXfC
qOOA9hc7QZIKUhL4ZRpRVaYnMHNbRexiLQ+zqq1GkBdVU/gfRE0aOlK6KPlaQAKE
Ja+5G/aamCS9+4NxfBcWbBp6lz+SeJZM3uDNunPCh6sRP9Qd1zY3iAKjMbNSoNq2
PeUrMyHaNofez74d3ncxov04URZIFNkrfZPfvRx2Ye9513f5adQzOzklea7bKVcO
e5jw937YyhJYI5P+Ow0Pb/bAZvPStkD/4ckkqG1duicQpo3sFIf2Qgw+EshIPWJO
WX/xiR6mV6McmLB7lVatzn1biwHrv6iAbR9TYOJmfDAwqOQsNUYIFQa21JbxiQKa
BxMZU37NQi+6Gol3pWfKTDYUClllh1+dQ9VoQuedBbHaJ9T6TAMS28VP+0kChOyP
ybrPVnRyGLssejEr56hB
=D27/
-----END PGP SIGNATURE-----

--=-8wMED77+20swHw7XLJ1G--
