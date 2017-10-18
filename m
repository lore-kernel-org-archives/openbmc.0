Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b70wrSgd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UzDz52aD"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHDDY4V9jzDrG0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 00:58:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C88F21077;
 Wed, 18 Oct 2017 09:58:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 18 Oct 2017 09:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=guWkBQq9ftXBV0kzffFLD+Zj38LQdZcqvvWrgCuJkrw=; b=b70wrSgd
 +bQ5O6r/J8aPVoBT827vX6FokASiZfS7N1wKauNQP2GHcHDAPrRvwnKxCV2uWnS2
 L5UEyYhbiNLfOooWJaZuRaq/KHUtSrMta3da2R07AMVswPvJu3aubwNfY56P3gW+
 saQG56bIJLzuSVyF4oklDX+lJpGu+u1Wrs5r7AsYMjdy4o8Lnrwpv/HNuiA2r12q
 v5FTyKOt8DEpDjKYa89vlVSVAFdu/lKD2KOl4dxPBYedo0dL7rpJFQ7lDI1QpmCD
 6fDIEkol+3afT4stMJ60RhQE4Pf+QgBHWi3BznebHoNz6ovRaIED+T13oMlgbPz+
 1A54mmHzpvGX5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=guWkBQq9ftXBV0kzffFLD+Zj38LQd
 ZcqvvWrgCuJkrw=; b=UzDz52aDtfuoBabhyGyfeP9dknYWjV5CU0eRgHmTqiKuz
 JlutIl5GjMYwjt93TU6da6AA4HPudEvLzO8deMNYoH/WcGlvCwp0WpWC+O3BBSTv
 BqpLKk3uZmI8XDNBAfuvtTZ1c4d2f2Pe52AebT7XrlngfwvTuEaNGXEgz3Sz/cr0
 Nx9DJwM38kwLIPIOTBZMhAtDul+R05aFTs5l1sjwQaTynnww6onkr+q/+cIaiEL8
 GEEYJb8xN6N5y+F9x/r+Q2yiedOW97twxoIYUHC08S5Jx5DwF17PMjzWCp9C7V7K
 nfs2+gn8DsGH/FtbS2OBHlH+FQ6xYaPkQC/Z4GUWg==
X-ME-Sender: <xms:Cl7nWTsLQYMDA6bKsK-P5GZVNTkh563XkdeCP1tZHfjn0TlQvJt5UA>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2989D7F9D0;
 Wed, 18 Oct 2017 09:58:29 -0400 (EDT)
Message-ID: <1508335104.24322.27.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 3/3] drivers: fsi: sbefifo: Attempt reset
 request during probe
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com, "Edward A. James"
 <eajames@us.ibm.com>
Date: Thu, 19 Oct 2017 00:28:24 +1030
In-Reply-To: <1508276153-3779-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508276153-3779-4-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RuLN+40/ZmBRLKxcraCo"
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
X-List-Received-Date: Wed, 18 Oct 2017 13:58:38 -0000


--=-RuLN+40/ZmBRLKxcraCo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-17 at 16:35 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> If data is found in the FIFO, the driver currently immediately fails
> the probe. Instead, try a reset request and poll for it's completion for
> a while (this protocol is defined in the SBE FIFO spec, though the
> timeout lengths are my own invention).
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 53 ++++++++++++++++++++++++++++++++++++=
+----------
> =C2=A01 file changed, 42 insertions(+), 11 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 764d8f3..f756822 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -47,8 +47,10 @@
> =C2=A0
> =C2=A0#define SBEFIFO_STS		0x04
> =C2=A0#define=C2=A0=C2=A0=C2=A0SBEFIFO_EMPTY			BIT(20)
> +#define=C2=A0=C2=A0=C2=A0SBEFIFO_STS_RESET_REQ		BIT(25)
> =C2=A0#define SBEFIFO_EOT_RAISE	0x08
> =C2=A0#define=C2=A0=C2=A0=C2=A0SBEFIFO_EOT_MAGIC		0xffffffff
> +#define SBEFIFO_REQ_RESET	0x0C

Bit of a nit, but it would be nice to have consistency between RESET_REQ an=
d
REQ_RESET. I don't see any reason for it to be inconsistent from reading th=
e
documentation. However that can probably be left for some other time.

Andrew

> =C2=A0#define SBEFIFO_EOT_ACK		0x14
> =C2=A0
> =C2=A0#define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> @@ -831,6 +833,36 @@ static int sbefifo_unregister_child(struct device *d=
ev, void *data)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int sbefifo_request_reset(struct sbefifo *sbefifo)
> +{
> +	int ret;
> +	u32 status;
> +	unsigned long start;
> +	const unsigned int wait_time =3D 5;	/* jiffies */
> +	const unsigned long timeout =3D msecs_to_jiffies(250);
> +
> +	ret =3D sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_REQ_RESET, 1);
> +	if (ret)
> +		return ret;
> +
> +	start =3D jiffies;
> +
> +	do {
> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &status);
> +		if (ret)
> +			return ret;
> +
> +		if (!(status & SBEFIFO_STS_RESET_REQ))
> +			return 0;
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (schedule_timeout(wait_time) > 0)
> +			return -EINTR;
> +	} while (time_after(start + timeout, jiffies));
> +
> +	return -ETIME;
> +}
> +
> =C2=A0static int sbefifo_probe(struct device *dev)
> =C2=A0{
> =C2=A0	struct fsi_device *fsi_dev =3D to_fsi_dev(dev);
> @@ -838,7 +870,7 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0	struct device_node *np;
> =C2=A0	struct platform_device *child;
> =C2=A0	char child_name[32];
> -	u32 sts;
> +	u32 up, down;
> =C2=A0	int ret, child_idx =3D 0;
> =C2=A0
> =C2=A0	dev_dbg(dev, "Found sbefifo device\n");
> @@ -848,22 +880,21 @@ static int sbefifo_probe(struct device *dev)
> =C2=A0
> =C2=A0	sbefifo->fsi_dev =3D fsi_dev;
> =C2=A0
> -	ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
> +	ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &up);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	if (!(sts & SBEFIFO_EMPTY)) {
> -		dev_err(dev, "Found data in upstream fifo\n");
> -		return -EIO;
> -	}
> -
> -	ret =3D sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &sts);
> +	ret =3D sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &down);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	if (!(sts & SBEFIFO_EMPTY)) {
> -		dev_err(dev, "Found data in downstream fifo\n");
> -		return -EIO;
> +	if (!(up & SBEFIFO_EMPTY) || !(down & SBEFIFO_EMPTY)) {
> +		ret =3D sbefifo_request_reset(sbefifo);
> +		if (ret) {
> +			dev_err(dev,
> +				"fifos weren't empty and failed the reset\n");
> +			return ret;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_lock_init(&sbefifo->lock);
--=-RuLN+40/ZmBRLKxcraCo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ514AAAoJEJ0dnzgO5LT5QzAQAJWLwH00DMFFsqE6Jp3c4ilM
kQs4YQVn2iQpoCMt6KJ5VsJ7/2xYegsi6e7OSZGngeyRlxmJhdSCazly4XbWY3v+
6NsF3JWMjEvJpxCaLMH+KpWlfRFDCIiKHodlvAghAtM8OJQIEz2BFUM+vIRMoQZb
2TK37r/rO+9eGBcPZ1bP6sskzeYFE8N/SuwLLZM6oSAgv2Bvuz8qZ+WsiU+bcyDP
o7pNqJbrd5YhQFmmSH55MebftlesLfUW/Xse6hQdcVzX5uCgU2WFdgIH+B5n/RAL
wyoLnrGX077dEWNn2pv+FmXrAXBKC0WQjsosC78xw72Gt6pZsOPX1ghDosLXuH0A
GQLKhm+yaCL6dWOyjThf+Y5hgmFklqhfEl0a6WmUf1R0T9x9qDtOQfdBbyj2FD2G
6hyz6Bhe31xSpwMuxiiWAY7UuITBxnIvL416TS+Y+nIVcGSxysu+2BxKe0lDwPfz
oTCP4ucSzBhsqOVqFa3TjdlHQiVvrfM84HDWRrfMbz3Wp4+LaBzWvrbdxln6wwED
uorD+yc+nbRPbaiJGiPJmjqTXkY1etqm69wkGtnvHmtzmglOUT0LX1vBzTFqW4pD
wcKsIykgQzqzcCu1IrfAbDyvUvx9mxSmz4o/b5+eQK36PwnJZZmMZwTjDuWcmHYj
XkI1LFAU3qwbewJmSpTo
=r+Sy
-----END PGP SIGNATURE-----

--=-RuLN+40/ZmBRLKxcraCo--
