Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ww5fEcWo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LQjV2W4f"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Sf60pzkzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:50:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15C1320EB5;
 Thu,  5 Oct 2017 18:50:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=284GsEfBdLRizyKF/UZ71A+IlkjI1bUyJvrQ0YbDb
 ro=; b=Ww5fEcWob9R9ptTC7ShyRqBsr2VRefFAPDg74RYE7MS2nidc2GJ87SYZK
 hmRKc+zKG6k89aj703hUcxQMJ0Zlw5j52SHL73COOmxfZZuKSSPAEk5ad18KN8G8
 gPzGbJ/6AJGKynfVvhFRkb6TVapNLC0qX8zQbBPq0vNNp30rydd7aiwF+s6faAbS
 Vp11dkP6WuJvblXcA/7d6eLAqBg5nM5Iv+pomKc2AEzI+axReW79rJIAx/dELFkE
 /VGPh1d+s2/QQ3CZrcOLaXf1HWP0ApN9KSla+8uoi8TUDsh5kbpoZPnMbKVPSGaF
 mYG+f2w81z7a+Vpvzu2ND5D9zZN9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=284GsEfBdLRizyKF/U
 Z71A+IlkjI1bUyJvrQ0YbDbro=; b=LQjV2W4fPfj18SSLbqq4Y5cAvnMGmSp6v6
 xDDuevyG1oHQtAmP4LsbagX8myWpWTwu4iK8zLeaySvVFzWChXpG5EO/StVQLaLb
 eNqwgMR0RBj5OOHhy+FfTjuYWKchvpi7UrqhHBAkCIb8TKZeHVE092a/Y8QvGG/9
 QXMbBEMb+gToaArHo5sn/T7dHDi+aX/k3dSHIZp5Q3IXRyZmin5g8sjLW2Yu2coR
 LY1Z7kwG6ROUDa5Pmb/Ci8dEG5waBeghdLEcLvNECcSUn50XYnIxyRDKxi6/g/9m
 b6dT9aw3yzS97hq5ix6xr2ZoqptNBImm5my2Bv3IZd/f3SceFYXQ==
X-ME-Sender: <xms:LLfWWVH_C0BfKImPGfZipKNby-PdwpaLi9-ciiKWouTZ1wE04CvWQA>
X-Sasl-enc: +zTKfrH5SESVHuHm6eHsqc+3Uhni0MDLMlGcOPP+Dd6F 1507243819
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B69E24969;
 Thu,  5 Oct 2017 18:50:17 -0400 (EDT)
Message-ID: <1507243815.5452.96.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 14/31] drivers: fsi: SBEFIFO: check
 for xfr complete in read wait_event
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:20:15 +1030
In-Reply-To: <1507231464-13635-15-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-15-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-T1CJgNKcFVMMZDEpt7o5"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:50:22 -0000


--=-T1CJgNKcFVMMZDEpt7o5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> We should check to see if the XFR is complete, not just for a failure
> or for available data. If we hit EOT without getting more data, we may
> wait forever.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 9b560ec..5d73437 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -541,10 +541,15 @@ static bool sbefifo_read_ready(struct sbefifo *sbef=
ifo,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_client =
*client, size_t *n,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t *ret)
> =C2=A0{
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> +
> =C2=A0	*n =3D sbefifo_buf_nbreadable(&client->rbuf);
> =C2=A0	*ret =3D READ_ONCE(sbefifo->rc);
> =C2=A0
> -	return *ret || *n;
> +	return *ret || *n ||
> +		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
> =C2=A0}
> =C2=A0
> =C2=A0static ssize_t sbefifo_read_common(struct sbefifo_client *client,
--=-T1CJgNKcFVMMZDEpt7o5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rcnAAoJEJ0dnzgO5LT5xk8P/iIL1KQaXXjLTT8qkkl/GkFk
cyrFNojZU5TDu3uAmGZa3Dpj8QvA/gLYyMJKO81Vds/il+ZMUBSOZ5XrUR0Ny8jY
fy8TZ6qCefwpoxQFN06ULIwFEDbf1CLS3tUh4jyjYyU6Rf875ne70IAhk6sko3GJ
ha5o/0JBU/qrHVsALZtnIvNvC5eM2QTUUsvNTeP85vGoKAv8EOR4Q5HNHMMLvjJo
MGvMjVwuZH69SCn5mKF0XooRvXA2fX+9Qzc+QXEdKamPDPtNQ3vedq0w1VLkV2+N
ZAzBST89xsYuMSM0RPbdhVkDeORL+yydTQ5XYgTnZCT9ziGYHp5QE01wlPB8tjqH
TXkNaNQRxkkA9UVgamx3Ug3qu02M3jrOnyX9+5X9U7fvitf1AuTDqqeIqX8fvW8o
2hwscBOK4cLJJHUW2zey45YxKE/KRQ9/sdWcwJj9BO0EuXg4WbU9bmzdXdaSupv1
9kFcdpZQL4s7kPkp0z/wJhYd7Bof+jmhPy/ysZOg/iwkVgoHjHrk4SyANKVtR2qf
TH/aOBLBJXQzfAWf5E2q/hyt2tP6dsNRdI1KV0wY9rjviXu0fPh2V80wNP/o5XBw
e2Lni0QvLPaLZ7ln36rxU+F4MHM7eml09JBO8WCtIdZHw1rEa9mWg4fBu8z+zy0g
gjtR2z8N0uqGYhVXaRlJ
=asjm
-----END PGP SIGNATURE-----

--=-T1CJgNKcFVMMZDEpt7o5--
