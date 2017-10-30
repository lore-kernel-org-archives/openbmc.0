Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cCSwxPRu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Je15f0O5"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQNHx56xXzDqmt
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 16:26:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB21E20C71;
 Mon, 30 Oct 2017 01:26:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 01:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FsivqouarQx75uPG00k+faFGE53d9F+jDwm7rsNZc10=; b=cCSwxPRu
 n9BA6Xe2ocftc1wWsbenYj8D4OovE5hSJfwbXC7JMrybfEanzLFq2aWA66VtLOSm
 aMErPy2YjA5kZvWKDERYe61JK1nUCLADFtbCXOEgnPXkCE/P1WfKaFMOmbfskkUV
 ki3Aqwsq1D+/yKAgJhkQOxwSsTRVelAfDWo/ZQcsJWCsuZkUZ3CxNdgHkdNSVkfg
 MLV6gJyy8I7dKYs+WL9LqVTppU6Ch6WAg27iAHUExd5oua9G5HAgVfcsAq63gelS
 CHDWX9C8K8rLT1bvxFLu4nEq4KQgVJZ2Ebk1YVcjEEHwzU5FHlWX2B0V7q0bn4Ug
 VXucHTke9N1Iwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=FsivqouarQx75uPG00k+faFGE53d9
 F+jDwm7rsNZc10=; b=Je15f0O5h+Z43ETreiBucGazmBtmusJ3BDjpKgn9ovtz5
 C7BApSFhlLpl4ZzZWmYCsBG3uVGv357CmGBGgD7ZgJxp1X6WFEsLTPjIMDV6H05b
 yni8ueRTq0Fyxy2hKwRd7KvTQDgq0YHkMYcuFWHOxRQXO9i9gMZUbRP9opZj8tMb
 9hO260Ndb5JIDlDjxWe8Eval6KHpi5GPJmNbF4iClwPAx5/pYVrJ4duSaQ+tXdYI
 UElKljw6lQqXtq0ygFzK1DrASVa5frx8fiZb5UirfNynVYiP2/syppbwaj8zv8Zx
 W03VRAlPKhsk8iz2aiY28KZnyyOlXzk/iZR0EeUTg==
X-ME-Sender: <xms:-bf2WUTTEpgIqztY2_BbfHxvF1MUk3bmFI35RZNRWXDeoAIPXwcLvg>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68350242CF;
 Mon, 30 Oct 2017 01:26:15 -0400 (EDT)
Message-ID: <1509341171.13477.24.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] drivers (fsi): sbefifo: Add timeout
 for waiting for data
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 30 Oct 2017 15:56:11 +1030
In-Reply-To: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-x+A4mIDxxNK97ekGWN5/"
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
X-List-Received-Date: Mon, 30 Oct 2017 05:26:23 -0000


--=-x+A4mIDxxNK97ekGWN5/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-26 at 17:34 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> During a transfer, in the event that the SBE isn't running, the driver
> will wait for data to appear in the FIFO forever. This doesn't work at
> BMC boot time if any transfers are attempted (by OCC driver probing, for
> example), as it will just hang the boot. So add a simple timeout
> mechanism when the driver reschdules waiting for data to show up in the
> FIFO.
>=C2=A0
> Tested on witherspoon by rebooting the BMC successfully with chassis
> power on.

So the thing is the BMC *does* successfully boot *without* this patch. It j=
ust
takes an *insanely* long time at around 870 seconds before we hand over to
init.

So it seems there's an existing timeout mechanism in place, but this patch =
adds
a new one on top. Your commit message implies to me that the BMC should nev=
er
complete the boot process under these conditions, but given it does, can yo=
u
outline (in an reply and in the commit message) why this new timeout is the
right solution?

I tried to understand the behaviour myself but did not find an obvious
justification for 870 seconds.

Cheers,

Andrew

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> Changes since v1:
> =C2=A0* Reset the wait_data_timeout field if we get data. If we get data,=
 the SBE
> =C2=A0=C2=A0=C2=A0is running and we really shouldn't timeout.
>=C2=A0
> =C2=A0drivers/fsi/fsi-sbefifo.c | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index f756822..41b838e 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -54,6 +54,7 @@
> =C2=A0#define SBEFIFO_EOT_ACK		0x14
> =C2=A0
> =C2=A0#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> +#define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
> =C2=A0
> =C2=A0struct sbefifo {
> =C2=A0	struct timer_list poll_timer;
> @@ -77,6 +78,7 @@ struct sbefifo_buf {
> =C2=A0};
> =C2=A0
> =C2=A0struct sbefifo_xfr {
> +	unsigned long wait_data_timeout;
> =C2=A0	struct sbefifo_buf *rbuf;
> =C2=A0	struct sbefifo_buf *wbuf;
> =C2=A0	struct list_head client;
> @@ -450,11 +452,27 @@ static void sbefifo_poll_timer(unsigned long data)
> =C2=A0
> =C2=A0		devn =3D sbefifo_dev_nwreadable(sts);
> =C2=A0		if (devn =3D=3D 0) {
> +			/*
> +			=C2=A0* Limit the maximum waiting period for data in the
> +			=C2=A0* FIFO. If the SBE isn't running, we will wait
> +			=C2=A0* forever.
> +			=C2=A0*/
> +			if (!xfr->wait_data_timeout) {
> +				xfr->wait_data_timeout =3D
> +					jiffies + SBEFIFO_MAX_RESCHDULE;
> +			} else if (time_after(jiffies,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0xfr->wait_data_timeout)) {
> +				ret =3D -ETIME;
> +				goto out;
> +			}
> +
> =C2=A0			/* No data yet.=C2=A0=C2=A0Reschedule. */
> =C2=A0			sbefifo->poll_timer.expires =3D jiffies +
> =C2=A0				SBEFIFO_RESCHEDULE;
> =C2=A0			add_timer(&sbefifo->poll_timer);
> =C2=A0			goto out_unlock;
> +		} else {
> +			xfr->wait_data_timeout =3D 0;
> =C2=A0		}
> =C2=A0
> =C2=A0		/* Fill.=C2=A0=C2=A0The EOT word is discarded.=C2=A0=C2=A0*/
--=-x+A4mIDxxNK97ekGWN5/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9rfzAAoJEJ0dnzgO5LT5HVAQALjfUv2A4ISJ+L2KrLcY6GI2
u4nX6KGibIQ2bWtdjZxJf6k3Cfq6aLunIKj8xBG0cgAn6g8I0LvxfeN2bPStN9F1
nmfjdVUQRonXheDNOZs8WSsjv8XSjjqKlIKJ0vb7Eoy3xXXVIdK8Ylez3/Xe9M7T
rb6JSmtkU4fQ9AsmfohcdyEoF3b6TQ2DYRqgTHCrA+cas2uVJUKcAKXajpH8Sw5M
65bdUPxI93lFUUEXWO4R+PCKpUvheRZqyvBpw1wkZc/sb6yM97STJV4XPX9DkMbZ
qF0PpLjVG4c2NzxOrpwgBJEaAIe99Nbnq/QQxQf6KZzMUT8C87OjnoYtO1z7jzWF
oFwvlM4uoKjFJzwtP2cnFfyzl6/jDwo/rBg6t+d7kPKvFauxJf5qhXtFOJta2N4D
0Nmw/gFqmeMTijDjR1s8CNG9zUz1yWS8Z46U/b9jeyORoiKwc3VdNB85PsUqE+Mr
hSdHALnuyhcGKTxQxIS1CE3OAFsaEkopRtM8AN5AGSTyHyDBgwhDX19b/FjRgs5e
MB61uT5lSv7GEmaeQuR0P9/44DoqucF5PfqraCLGNg+iwCxymxZOf3CSgrjJLdZf
OnITzFShcDYX6ov4dOuYSzq0CZ9P4Tj41tHiJTqvnP/ocoaQSuvarUTTrENHMv1F
s2nBy2QFpGODjZ4YJlmU
=QheN
-----END PGP SIGNATURE-----

--=-x+A4mIDxxNK97ekGWN5/--
