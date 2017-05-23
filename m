Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXW1H6FhCzDqZX
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 08:49:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TiRcKKBF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D4Q3XdS4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 58F04208D2;
 Tue, 23 May 2017 18:49:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 23 May 2017 18:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=xm41PN1tnBbLDSFEyOVGTd4ipXbrKYZQwrI1gmiR2
 DU=; b=TiRcKKBFMNGlBdbhVbK007Lt6RcrKqOEBFnp4AKQDJc/pGKBNEL6zSpC/
 41OnDLNlQnTjU6ds1fZ2v9DjmVJSaU9MdEMGG58iG4gJAc2eRSM0vRMzufcDEY4n
 y4QdOIXqkcokeMb8H0cbYdd8Z3slyJZcfrhtnCVWE4rup7StKqQF4+cJl+NGfjLt
 OYZWPydPjZGBrXT7zzJGGIL+CGk8pq3IUEYypB++Zxv1XwOhSI0rK3MHi2hJnQcD
 GYvjUPXvSREi00wVXIPDeCzx7N9d9z5/WAWy9T+jUQ5afbgLF52fTbHEMnqxe4Rc
 WTqLWiZylk0xQE9Kja7dbCUPTs8hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=xm41PN1tnBbLDSFEyO
 VGTd4ipXbrKYZQwrI1gmiR2DU=; b=D4Q3XdS4tLvT1QrtQdZhUrzAzG7gSEkLCW
 9D+lsElmeMQySZsfX8jZR063NKt5ecowO2QcgOxRNXQeknOFOWt9ACKsle1P9X6i
 ABzUMovZpDTZp0oVfGPKKdqXxmwRZEYsypijtf+JpXz/52RGZHMcpdrtUaMq9W7T
 SKcEULpX2xLaaTobblyCuprYWZraUXtCOKUh/3UGIerchNmEPvhi9Cuv48U27Jfn
 8r/5AaXOZa1Sjh6EoK+OXFVxetyiJFpIldZgI9qT0HeIlzxQKXDnlMMts5DdsLkS
 2DSSwBQoabYjLxCZDSKXpgcFDo/v+IXmaagbXcHNG5KVCnilcuCg==
X-ME-Sender: <xms:cLwkWe0IKC4nBOksaoDoeTMWlOk3OfIvrOHwCzOA9OJGA1646plB5A>
X-Sasl-enc: zXmhjK+TcxEimByQxdKnv4cipYgGYc4+gxWDMwiSXcpo 1495579759
Received: from keelia (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E2C4E241E3;
 Tue, 23 May 2017 18:49:18 -0400 (EDT)
Message-ID: <1495579753.7794.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers/watchdog: Add user space access
 to aspeed ext signal and reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Wed, 24 May 2017 08:49:13 +1000
In-Reply-To: <20170523212845.89898-1-cbostic@linux.vnet.ibm.com>
References: <20170523212845.89898-1-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MF71mLyS6CJ2PgbxetdG"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 May 2017 22:49:26 -0000


--=-MF71mLyS6CJ2PgbxetdG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-05-23 at 16:28 -0500, Christopher Bostic wrote:
> Add sysfs files for 'ext signal' mode and 'system reset' mode within
> the aspeed watchdog device driver for wdt1 and wdt2

This commit message explains what the patch does, not why we need it.
The code change already describes what it does, so can you please
instead outline in the commit message what the motivation is (or
potential motivations are). Ultimately what I'm interested in is
whether this should be a platform design decision (and so should be
managed via devicetree), or userspace policy, which is what we have
here.

Separately, given it's fairly generic and assuming the motivation is
reasonable, I'd suggest also sending it upstream.

Andrew

>=20
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> =C2=A0.../ABI/testing/sysfs-platform-aspeed-wdt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 40 ++++++++++
> =C2=A0drivers/watchdog/aspeed_wdt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 89 +++++++++++++++++++++-
> =C2=A02 files changed, 128 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-platform-aspeed-=
wdt
>=20
> diff --git a/Documentation/ABI/testing/sysfs-platform-aspeed-wdt b/Docume=
ntation/ABI/testing/sysfs-platform-aspeed-wdt
> new file mode 100644
> index 0000000..a582176
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-aspeed-wdt
> @@ -0,0 +1,40 @@
> +What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
> > +		reset_system
> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0M=
ay 2017
> +KernelVersion:=C2=A0=C2=A04.12
> > +Contact:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Christopher Bo=
stic <cbostic@linux.vnet.ibm.com>
> +Description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Value indicates if a watchdog time out results in a=
 reset of
> > +		system.=C2=A0=C2=A0'off': no system reset on timeout.=C2=A0=C2=A0'on=
' there will
> > +		be a system reset on timeout.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Default: off
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0- Enable 'reset system' on watchdog timeout:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0echo on > /sys/bus/platform/devices/1e785000.wdt/wa=
tchdog/
> > +			watchdog0/reset_system;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0- Disable 'reset system' on watchdog timeout:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0echo off > /sys/bus/platform/devices/1e785000.wdt/w=
atchdog/
> > +			watchdog0/reset_system;
> +
> +What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
> > +		ext_signal
> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0M=
ay 2017
> +KernelVersion:=C2=A0=C2=A04.12
> > +Contact:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Christopher Bo=
stic <cbostic@linux.vnet.ibm.com>
> +Description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Value indicates if a watchdog time out results in a=
n active
> > +		high pulse sent out an output pin.=C2=A0=C2=A0'off': No output pulse
> > +		generated on watchdog time out.=C2=A0=C2=A0'on': output pulse
> > +		generated on watchdog time out.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0Default: off
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0- Enable 'external signal' on watchdog timeout:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0echo on > /sys/bus/platform/devices/1e785000.wdt/wa=
tchdog/
> > +			watchdog0/ext_signal;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0- Disable 'external signal' on watchdog timeout:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0echo off > /sys/bus/platform/devices/1e785000.wdt/w=
atchdog/
> > +			watchdog0/ext_signal;
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.=
c
> index f5ad802..277948b 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -145,6 +145,93 @@ static int aspeed_wdt_remove(struct platform_device =
*pdev)
> > =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static ssize_t aspeed_wdt_reset_system_store(struct device *dev,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
> +
> > +	if (!strncmp(buf, "on", strlen("on"))) {
> > +		wdt->ctrl |=3D WDT_CTRL_RESET_SYSTEM;
> > +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > +	} else if (!strncmp(buf, "off", strlen("off"))) {
> > +		wdt->ctrl &=3D ~WDT_CTRL_RESET_SYSTEM;
> > +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > +	} else {
> > +		dev_warn(dev, "Unknown reset system mode command: [%s]\n", buf);
> > +		return -EINVAL;
> > +	}
> +
> > +	return count;
> +}
> +
> +static ssize_t aspeed_wdt_reset_system_show(struct device *dev,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0char *buf)
> +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
> > +	int ret;
> +
> > +	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_RESET_SYSTEM)
> > +		ret =3D sprintf(buf, "on\n");
> > +	else
> > +		ret =3D sprintf(buf, "off\n");
> +
> > +	return ret;
> +}
> +
> +static DEVICE_ATTR(reset_system, 0644,
> > +		=C2=A0=C2=A0=C2=A0aspeed_wdt_reset_system_show, aspeed_wdt_reset_sys=
tem_store);
> +
> +static ssize_t aspeed_wdt_ext_signal_store(struct device *dev,
> > +					=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +					=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
> +
> > +	if (!strncmp(buf, "on", strlen("on"))) {
> > +		wdt->ctrl |=3D WDT_CTRL_WDT_EXT;
> > +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > +	} else if (!strncmp(buf, "off", strlen("off"))) {
> > +		wdt->ctrl &=3D ~WDT_CTRL_WDT_EXT;
> > +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > +	} else {
> > +		dev_warn(dev, "Unknown reset system mode command: %s\n", buf);
> > +		return -EINVAL;
> > +	}
> +
> > +	return count;
> +}
> +
> +static ssize_t aspeed_wdt_ext_signal_show(struct device *dev,
> > +					=C2=A0=C2=A0struct device_attribute *attr,
> > +					=C2=A0=C2=A0char *buf)
> +{
> > +	struct platform_device *pdev =3D to_platform_device(dev);
> > +	struct aspeed_wdt *wdt =3D platform_get_drvdata(pdev);
> > +	int ret;
> +
> > +	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_WDT_EXT)
> > +		ret =3D sprintf(buf, "on\n");
> > +	else
> > +		ret =3D sprintf(buf, "off\n");
> +
> > +	return ret;
> +}
> +
> +static DEVICE_ATTR(ext_signal, 0644,
> +		=C2=A0=C2=A0=C2=A0aspeed_wdt_ext_signal_show, aspeed_wdt_ext_signal_st=
ore);

The on/off implementations for show/store callbacks are very similar,
only differentiated by the bit that we're flipping. We could almost cut
the code in half by parameterising a function with the bit of interest
and invoking it appropriately in the callback handlers. Thoughts?

Andrew

> +
> +static struct attribute *aspeed_wdt_attrs[] =3D {
> > +	&dev_attr_reset_system.attr,
> > +	&dev_attr_ext_signal.attr,
> > +	NULL
> +};
> +ATTRIBUTE_GROUPS(aspeed_wdt);
> +
> =C2=A0static int aspeed_wdt_probe(struct platform_device *pdev)
> =C2=A0{
> > =C2=A0	struct aspeed_wdt *wdt;
> @@ -169,7 +256,7 @@ static int aspeed_wdt_probe(struct platform_device *p=
dev)
> > =C2=A0	wdt->wdd.ops =3D &aspeed_wdt_ops;
> > =C2=A0	wdt->wdd.max_hw_heartbeat_ms =3D WDT_MAX_TIMEOUT_MS;
> > =C2=A0	wdt->wdd.parent =3D &pdev->dev;
> -
> > +	wdt->wdd.groups =3D aspeed_wdt_groups;
> > =C2=A0	wdt->wdd.timeout =3D WDT_DEFAULT_TIMEOUT;
> > =C2=A0	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
> =C2=A0
--=-MF71mLyS6CJ2PgbxetdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZJLxpAAoJEJ0dnzgO5LT5wJsP+gPyddq1aFsMfJgEVVvsBSCP
Eb6NGkYrFbQo9SRaV7Q6Z+NyRAwdb8yKoiPMj637qT/g9BOo+JjLry3PeHj0Uob4
6fcnE5o8hsQtzBecURGpSt8ZSJEislh2mAONopX9v7LEM6+CVyFtwB+zIecKsTVf
Lafug0cbXPCHyWlGivXCeqOa8jltGoCf+fnBMzoGlS+tc+xnsrVuV6Wr6zSax/kN
1npQlL+nw+A3G1rnk6My8i8itXJpYlXLOqB1ZsrZFngwcFxaIxPIHZYcLyeKwhcS
gd5NNt73CRegzaB/UvIXaHFv2R08JDYno3pKyCjNKNuJfP/BUrd1P9R98VLu9YBu
V3byd6hzl9R1Sy6E5+2QveDZjW7OYdJL4OjrXeb786SGXsj409Sr44K+P/LAeZPh
CceTO8nK/ss4rMzDnb4TmAwAiUSxtExpHrBAw7gdovxK8X43nAV9kkwU4vOnsure
pQQAfDAfnKpfwAT/w8W5GH2rvqiiJvGEP8m5wbeHLyf520xTXJRamwwuQ/xVPJYT
vP8EApRX0z9GxDscxR7SsDTIQwUZfhS8k9Ig/vtUP4aqYCsav2lyRAhijtnhEwdI
ujQXcmy8nz27zA13Bdu0HtxePtVpAdLXO3xlIqFK1nwMvzuSt10aLb/75OZVi1sI
GTwaqxqTq94TZJu4mdbb
=khbv
-----END PGP SIGNATURE-----

--=-MF71mLyS6CJ2PgbxetdG--
