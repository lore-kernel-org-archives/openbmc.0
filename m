Return-Path: <openbmc+bounces-2486-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFA9C5DF81
	for <openbmc@archiver.kernel.org>; Mon, 24 Aug 2026 15:40:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hTFVg02wvz2y8c;
	Tue, 25 Aug 2026 01:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.203.200.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787586042;
	cv=none; b=NyGsMJVlxOD3o1p+ch2Xj9fb07ntw6ae9DEygLKQyHE1htiS4vMKXY1LSV+qOI/3qvGgUVhcTOSRewaprCT+o3CuR0znuR+zZ4PrjnpOM4JA3QDT5vMzHLmL29MOjAM6asRLHjamPGEdrliseMJwYejyWdnGOIXcgo5I3yf0WB/V7RuhYOcawAD4n/zfM0MpDIyVX5VOO3hwdRriPN1oQ/MsxA2+ZyGbLCdYtsbTzTRCNSA6JlHs/olFbHtfhyLxAg7ipnMQmaLKt2swqSQX6d2e3NGVjIi9JLEz5D5u7+3w8bxZVfQfdwb7VmnbVxupK/7qxQCAG+YNgyDA7RoM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787586042; c=relaxed/relaxed;
	bh=m93WWasZDeL8P3xfxnXr9E+Q6j/e1mlv0XnZZsIFzXY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gG+sw7YvSbGCBg0nC2KPIBOCKq5xzAqrU02eYeeXXOrcU7AcI6rZNCj9Z6M0Ezg0uJULTfhplkwdfkV6hMP24mwxnjljpc+3v3ELn1vjtIO0v3C9JuaoYLx+a6Tn9sZoZLaRt7EH0Aa/wOwCe2uR8HONFvnQs9ypQgzZsNM+ZFyGqiE5TRlPkEd7hfgIn3ulL5RfyWMpBfWOmSp+dykoow8sMdH9Yk5NWRQEfedDWAsNHwvKkorcWCg5WqUcfW5HbuN88hggpp05LCy31czZF1W5PskfHLP5hNW9F+ZLNKaft+ZV5J0Wgt+ZgDD+L93Q3v3iS1drOcvsA1A38REIjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=185.203.200.13; helo=mx1.white.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=185.203.200.13; helo=mx1.white.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 418 seconds by postgrey-1.37 at boromir; Tue, 25 Aug 2026 01:40:41 AEST
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hTFVd3dpJz2xGt
	for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2026 01:40:41 +1000 (AEST)
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 256EB2010D6;
	Mon, 24 Aug 2026 17:33:25 +0200 (CEST)
Message-ID: <699de61dc2bfebdf18cdb0e377d1ba63886b4e12.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005
 UDC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, Krutik Shah	
 <krutikshah@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Mon, 24 Aug 2026 17:33:25 +0200
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
References: 
	<20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
	 <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

On Mo, 2026-08-17 at 22:57 -0700, Naveen Kumar Rajgiri Bassappa wrote:
> Add a driver for the USB device controller integrated into the Axiado
> AX3000 and AX3005 SoCs.
>=20
> The controller is based on the Corigine USB 3.1 device IP core and uses a=
n
> xHCI-like programming model with a command ring, an event ring, and
> per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).
>=20
> The driver implements the USB gadget and endpoint operations, including
> endpoint enable and disable, request queue and dequeue, halt and wedge
> handling, and standard endpoint 0 control requests.
>=20
> It supports High-Speed and SuperSpeed operation, control, bulk,
> interrupt, and isochronous transfers, and scatter-gather requests.
>=20
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> ---
>  MAINTAINERS                      |    2 +
>  drivers/usb/gadget/udc/Kconfig   |   14 +
>  drivers/usb/gadget/udc/Makefile  |    1 +
>  drivers/usb/gadget/udc/crg_udc.c | 4491 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/gadget/udc/crg_udc.h |  355 +++
>  5 files changed, 4863 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/cr=
g_udc.c
> new file mode 100644
> index 000000000000..bb3ed394d984
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg_udc.c
> @@ -0,0 +1,4491 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(crg_udc->rst))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
> +				     "failed to get reset\n");
> +
> +	ret =3D reset_control_deassert(crg_udc->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_reset_assert, crg_udc->rs=
t);
> +	if (ret)
> +		return ret;

This looks like it could be simplified with
devm_reset_control_get_optional_exclusive_deasserted()

regards
Philipp

