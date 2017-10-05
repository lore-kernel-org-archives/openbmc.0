Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jiWM3BDd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RmrX/wFS"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7RGq0t7fzDqG2
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 08:48:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 168F920BBA;
 Thu,  5 Oct 2017 17:48:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 17:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=A0p+iWYOLfYtxPw2LbvHHtrRk4vwCueYfiAqiv5d/
 Zk=; b=jiWM3BDdzVESS8kirErEjEl90d2goz+DVq7I1eL81UDbakD6rvpm7fvs1
 WXA4SaXy6+Qfs8f7cBG9BnJUfXWEQsGU+LYXUFv8I/mPw7oDUBQZH0ezknR7MiJ1
 jWr7gg27/elhiM0EVIZAVAepSxMm2XKZUi/jucnHUi4k8ucoev24vlT1YzDQxhEA
 fkqYxlGO52y89n/0M59aUG9U40H4L4C/0qjxfTgcP5a+pgnFIgtpDq72f1s5+lZF
 pee5caJwVYBYzNvjcD3wrfQzDLORw/nRCyAPksEUfO7duYSSpB45aJqKscNxaREI
 hNbFDG6dFA++uYgMD89HbVNcNptsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=A0p+iWYOLfYtxPw2Lb
 vHHtrRk4vwCueYfiAqiv5d/Zk=; b=RmrX/wFSvRJ5lKPHUZaoAyOp9JoEU07VOU
 jBcpweXyTECPF+DeFkuYQHSwDNssnPgJnWIAP4P9vAtI02sYTUMm0A0UEi+tLYdV
 oL/zUCDS9z+ZgLEY0C6/DPcSMsMQ1HSiaxQhVcpHFij6K/1m0SEI3HLwyggtFyM1
 YS5egqUZp/BiEuAtgoQF9z3FCTh4gxXOwW53yljeinUgHHVZ90AYJDSnmUUy4ra4
 LmzcvA/aL0ZqbDH0Sm8Hz/YRoU9LsStR6U845qqf7XCr06ibQk36ZXC+E9nXxp2P
 PEpMFHD5O8/R893bgeYH9YjsXfrtizUMkCzSgiU/e45WqBkaAFDg==
X-ME-Sender: <xms:sajWWdssGvyKEVMzYzdscbS-Xr3xx2Wp1nLeEkfLB3saUnYUJxbGPw>
X-Sasl-enc: aXM5PhCizXcMLuJMp6PpPSHUDMjG1NXFBt6YWf9RSZgE 1507240112
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F5412489B;
 Thu,  5 Oct 2017 17:48:31 -0400 (EDT)
Message-ID: <1507240108.5452.80.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 06/31] drivers: fsi: sbefifo: remove
 redundant function
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 08:18:28 +1030
In-Reply-To: <1507231464-13635-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-7-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-msMDDdHPQOTF04KOUSnX"
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
X-List-Received-Date: Thu, 05 Oct 2017 21:48:35 -0000


--=-msMDDdHPQOTF04KOUSnX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:23 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> sbefifo_client_next_xfr function just does what list_first_entry_or_null
> does.

Any reason you didn't implement sbefifo_client_next_xfr() in terms of
list_first_entry_or_null() rather than open-code it?

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 28 +++++++++++++++-------------
> =C2=A01 file changed, 15 insertions(+), 13 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index dbac0c3..173cd03 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -279,20 +279,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct s=
befifo_client *client)
> =C2=A0	return xfr;
> =C2=A0}
> =C2=A0
> -static struct sbefifo_xfr *sbefifo_client_next_xfr(
> -		struct sbefifo_client *client)
> -{
> -	if (list_empty(&client->xfrs))
> -		return NULL;
> -
> -	return container_of(client->xfrs.next, struct sbefifo_xfr, client);
> -}
> -
> =C2=A0static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
> =C2=A0{
> -	struct sbefifo_xfr *xfr;
> +	struct sbefifo_xfr *xfr =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> -	xfr =3D sbefifo_client_next_xfr(client);
> =C2=A0	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
> =C2=A0		return true;
> =C2=A0
> @@ -595,7 +587,15 @@ static ssize_t sbefifo_read_common(struct sbefifo_cl=
ient *client,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (sbefifo_buf_readnb(&client->rbuf, n)) {
> -		xfr =3D sbefifo_client_next_xfr(client);
> +		xfr =3D list_first_entry_or_null(&client->xfrs,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr, clien=
t);
> +		if (!xfr) {
> +			/* should be impossible to not have an xfr here */
> +			WARN_ONCE(1, "no xfr in queue");
> +			sbefifo_put_client(client);
> +			return -EPROTO;
> +		}
> +
> =C2=A0		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> =C2=A0			/*
> =C2=A0			=C2=A0* Fill the read buffer back up.
> @@ -632,7 +632,9 @@ static bool sbefifo_write_ready(struct sbefifo *sbefi=
fo,
> =C2=A0				struct sbefifo_xfr *xfr,
> =C2=A0				struct sbefifo_client *client, size_t *n)
> =C2=A0{
> -	struct sbefifo_xfr *next =3D sbefifo_client_next_xfr(client);
> +	struct sbefifo_xfr *next =3D list_first_entry_or_null(&client->xfrs,
> +							=C2=A0=C2=A0=C2=A0=C2=A0struct sbefifo_xfr,
> +							=C2=A0=C2=A0=C2=A0=C2=A0client);
> =C2=A0
> =C2=A0	*n =3D sbefifo_buf_nbwriteable(&client->wbuf);
> =C2=A0	return READ_ONCE(sbefifo->rc) || (next =3D=3D xfr && *n);
--=-msMDDdHPQOTF04KOUSnX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1qisAAoJEJ0dnzgO5LT5N+oP/3XRx9FqboZhOJX2p+ltNvuI
WgO65/fOaCHio1AS8PrFUBjTq1xi3mImfaDlqjiEYphwZZVGruVhc7QRtlGkheI8
Fxca3YoXSAUfkgR7OWslVkxFmT//EVKX5Px+IqCQT2e25AgUdvBceDFz51sFHR6Q
hivRKD4a2nbeNSR/mEPg7Qk58xH1WSdJxFwySjKIId4JmcPgx/55iNmTML8mnqgg
jv9byLkXyMstfrpNNOJMHJ11huKX1ibS/vmVRBm5o0NgwhNlq3hC5S6LN41eMbwC
7b/jw60zm6A9O26sToPRY5pq4fzu6L3fM2Q69aVVBEqFe3kwO0OSoaSHZLP7NBt1
k7nd1wsEkqGTdE+jwHtwrxbz9tyRLDH1XvFoWlyz3H8mR4pKt6+pGw1hUANePr/y
Yrn1c8mZAQ55m7lJEvinz4Q95LkGwCHnGJRoWzkRqYT8wammYbFuexy2jNiiQgmC
mhk67z5LIPV/liZUdskp3h473i8QGvZLwxPKkCFS4mL4ivbQ4nq08XTNStcXXc7C
SAvGXZvunGZtFk6xIhzCaZgE4KRWrkYLSEw/EWm6+bNsRew+1q2n9TnUK3YZck+e
sLqpZadRnOlZAH2OuH8FbnsqYit+x4U74ksIAEByo2jaYCWPlxKSh0E916giy2kq
rGBkzoUH16Jdxq3LBE5s
=yBth
-----END PGP SIGNATURE-----

--=-msMDDdHPQOTF04KOUSnX--
