Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r5HfThyb"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Lo2UtyLW"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7SqF6bDyzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:58:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C2E2120B77;
 Thu,  5 Oct 2017 18:58:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=sfqsxuyStc9PG4vMZ3yAO9eEGt1NFsjXkiuGQ/wqD
 gI=; b=r5HfThybP8OqDxr+TjVq/yB2H99IADIOeEaW9d3akGWOwS0aIZBH8AUcH
 9w5VvP5CKGSHzkUAzBZAeRjbepANhtHXU/wGbNvS4P69yXOyef090j0eIMcfZyuI
 Ni+Qt+yWWDz/1xIY4O9L19UJIrDVDzYRkSPBEf1ErI5R6/G4LC7BvfgR8czWG+K1
 SkM7qADG/Y6MIgyvWMLQt3QPKCwJYxtO1bu9YO4G4yYbUTeozIhZ2XZO3ib3j76X
 Kngnd+8N8xrG+azkFGSW25twilOEh4u0kVpqau594WPedc5To/ba5W4FJOjKtvPU
 t4N6fOOi41lDToiSWqQ9gLUZvFrSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=sfqsxuyStc9PG4vMZ3
 yAO9eEGt1NFsjXkiuGQ/wqDgI=; b=Lo2UtyLWeqr7UiQ219QcU1oMWwCoOxiVX6
 KFzvSgrSXu6LxczKSIF0fjP5GrbSw1LniHQLlOR4s9aVZsKwUG5gvNKK1gpNJCj3
 By4HUEz+rDuYc4csB0X42d6wqMdsQpNmHn26gu0Gv4FTH26tD9UN5z3oJPkbSieu
 wRGfPE2fYKJ1fK3CZjy0NwOocqTGeC+zidt19RIBNM3N2eKrA/MYUHnyjMp+EqS0
 uyf1cqcIhX0+k8qFrNch2YbHzovu5Sr/wCZg9888I92THxl9VDO5XW1Sd9//kxvk
 6lXbnaebgUNHXuWdtTPCS9L/vCV0oHjy88UFlBRmLC410ULovEbA==
X-ME-Sender: <xms:B7nWWVqtc628zdncxEibgm9onY4ULvCeFB-lsSQJv30b1tvlQaXeIQ>
X-Sasl-enc: qi0eOZCVnA9zZPLBTCQ22MgyCbH7qDAKRqNpASffCBQi 1507244295
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1D0124870;
 Thu,  5 Oct 2017 18:58:13 -0400 (EDT)
Message-ID: <1507244290.5452.98.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 16/31] drivers: fsi: occ: Fix errant
 kfree calls
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:28:10 +1030
In-Reply-To: <1507231464-13635-17-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-17-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qEN0ienvR+aC2KjisYyn"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:58:18 -0000


--=-qEN0ienvR+aC2KjisYyn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Left over from when xfr was an independant structure. Remove these
calls
> as xfr is a part of the client struct.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 2d7df8a..cd60c5a 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -289,7 +289,6 @@ static ssize_t occ_write_common(struct occ_client
*client,
> =C2=A0
> =C2=A0	if (ubuf) {
> =C2=A0		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
> -			kfree(xfr);
> =C2=A0			rc =3D -EFAULT;
> =C2=A0			goto done;
> =C2=A0		}
> @@ -298,7 +297,6 @@ static ssize_t occ_write_common(struct occ_client
*client,
> =C2=A0
> =C2=A0	data_length =3D (xfr->buf[2] << 8) + xfr->buf[3];
> =C2=A0	if (data_length > OCC_CMD_DATA_BYTES) {
> -		kfree(xfr);
> =C2=A0		rc =3D -EINVAL;
> =C2=A0		goto done;
> =C2=A0	}
--=-qEN0ienvR+aC2KjisYyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rkCAAoJEJ0dnzgO5LT5PDQP/3YCjZ3Xyk4qpprkePlZH+7N
z3V/tHwxX8xWc+zUIb+IAeqF4RXPJbBErfvlOjmXh6QD/kxIySTvSREPTtYpcnY8
woTQibanFmfVB+fXFO21NMdKEJm29NZtuLdW8W/moekj7uUt8fVevDGaEg0vUiV3
sRtITTohXvXqUPrevOtO5bwn3bRE6Pt481dOq0mRKTznHktMx0PDJfwEfGMt6mMq
zoFAnMsNZ+Jylk8h/2TpxDEWOUq1sbNX7+ueNrAzPM34cn0HNVRl9SzmcyKnLtul
Id4MC3dgX87AEsRCnYJCGKkpI5KFfnuRgXVYWMfbzXMCK+XsUJ3jWhpJKf6nMLXb
Dsoa9NcghKRAqVPBMuE1MIoPTALTipuRc1MBbwHXF0OlvRoM76m7NXBzUxTdp0vc
cdp7blB7lktuIZosi/NxSfKQh75RQjAbwWcSKKnJj9e4zBOK131MOp4cmnBHrGur
2IGPtE02Uwhupj6llY6UjezMvyPf5FCf3hF16VOUGKYt5noE/FoJ6Y0+nkgG/TL3
HCMCWxeSbbyOkgFs6PslMRlBJSpB+D7UrQAKXIsnZ82L9CPIGxMKb4YY+dotWf90
YIQSezEruWbxVH9DEiT2m4DYZfeN56/psSobFAFqIW9fFziA5StApkNXX3di0Wst
BG13Vg3xEH0YaruiSEpo
=63OU
-----END PGP SIGNATURE-----

--=-qEN0ienvR+aC2KjisYyn--
