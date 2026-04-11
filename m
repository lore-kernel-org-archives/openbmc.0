Return-Path: <openbmc+bounces-1832-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC3F433D0
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:02:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwyqG6BG3z30B4;
	Thu, 16 Apr 2026 10:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775915151;
	cv=none; b=ftPQBzJDRXpmsu+3bPz8EKVAO3ZMkXJPQmx1yKi9oeCWYRbL88ciXKMzCO8bX+VOuMKJ5wZY7VJ3MJ/88k2gKHVI53Dhtl4CBYv+ebmwtFYDi3IYouyBRxCGIL6LKXJjiOk1mXTRFq0yChOEqiXaI8nLe5WR/bK/SGtXdM5GKNQI0IA7IX3+1UJQzWV9WaFQ/OZqkXTfgO/KyJAIZyRpdHdhbHZEGJRN6E+qf61uNo+EBM3O0cCSK19Z0GlThUFdNGmqlZ8PAC+5zh/G+xhX0OrW0q1meY5sSN2UQ1csTJdN6vAWGiFCa5kFUbsOXbPDLAiDgxCNhCsq6r8pvdVudA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775915151; c=relaxed/relaxed;
	bh=0UFwY4repTmIKGT+XQZhuhyN1RmFMzV9M/LAa3y/j0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B8+lvHJzzmIX2VXxxtOqJ8bCENs4A2Lu65dBM0T+KG+l7I2+8R+0lXNUw3jvYFutEkf2OGQSPxqBV59AeAznt2Jxt3BU/IqihcIeAQ+8cSSLWNZRLhtBBrwmTSViAwNmmjZZJk2wCc+mX5lJVWHTrHDiL05MVWJnEVgBjSkDyoPbsu703iQ6i7/OXEdL4M/VAll2MiFprLmv8P9NY7TZb4KBMNyI+aSBitY/08XUlhN7YFkcHlu1BgkXkEFIQb/f1UeXYTEIoHkbXBuwYnMuGrr5jjHnBXAN3+J9m1qYERS5p8ddtMn4S2+seya6DrVml0ZPM5aE/kzuc14fhNvDGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQHC85JU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=noname.nuno@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQHC85JU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=noname.nuno@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ftFLP2dZcz2yhV
	for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2026 23:45:48 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488971db0fdso29150545e9.0
        for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2026 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775915140; x=1776519940; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0UFwY4repTmIKGT+XQZhuhyN1RmFMzV9M/LAa3y/j0g=;
        b=CQHC85JUg73ypI5QfnXo1EsEmTgYKU2lyGeuTix+Dwwk5LAed5DG/AuwOClDKe2zaU
         k1digsEkf3GwPfuRdz8mhVhk0iUp00+OgA7h31ur9NGKgbyKae/Xx2loFs0F5GmNGetx
         fB9X1WVTMUifWQTIs0opOkmAhBLl76wcVeGfJWsmAD7m6Y+BTm3rQlPFqcx7FR/KTiPm
         Rg+WBBFGzluDYLoGRRl+Y2h5p4xYv2ahUhgT5xnjsNXdfHLiBRtNHkOk8zvAmIrvKFBU
         WsGjR/aUSzMBIEQmfuO2GIzMwaZqMWeybgVUXWl8Bwpj1xJdBSbNqDhcw8ZkK9bSYCRi
         5aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775915140; x=1776519940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UFwY4repTmIKGT+XQZhuhyN1RmFMzV9M/LAa3y/j0g=;
        b=Cjihu6lJL46MidldZLMGKIXzJB3MTg267JrJaUDmittr8OzlW6BgZ88Y6rxATd/B7H
         kLBC42X7kKI8kg4MM/zy2dTAfK98mOCC4yWREbcRAKgmYDdk7lcWW332zDnZ+9KczKCE
         oKzMjFj3xHuecfPU9nBGr8Ms1/EgSjHFVif5VJLBcRBgmxCaLAXAqDvZer2fnA+9Quy8
         5P9ko6BUWZsYAFye0QrxMXskcUII7+eh5NmamU9ErlyiiF0YUDwJUPk09XmpE76zDg1q
         FgM3UQ8iZOz53lSzPWJYpbQ1r1LgezNvQxGGiEezdkccwP1+Mobn62kIe+0Q9kjw0Ds7
         gSfw==
X-Forwarded-Encrypted: i=1; AJvYcCW/vcOjXXr2h1Gef15RJNYhhLH5TqJ+VifjNotsUhs5J2xmY4iGx7Uqeesi8jmNav0p0JTCCwn3@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHt9EbV1c2it99wOZu/VLrf0t8IqhtbfvcEUVl95fxlZiOqIRP
	4dLYsGNAPNp6uWnLFhBWbUmu7km3BZ1cI6oj+cBFvB7BVQshrAzcpHXS
X-Gm-Gg: AeBDiesseryWX4wc5yYNpT9n8WXE6gkDtjYIsQ18Z+NLinawcYwJYzgE1m1MtKMcC72
	KzMQnrsr0nj9ZaLFVX48cOZVA+WfP3rGbCwHgPdQbrbq0R0zWo1HWVi9dQ6P4TdXn4lsb7016Q5
	XYAo1ldE7L73NEuVnYUsj4HbS2Db69Nu3f74YPA21kAnIOLGfbfrdrwti6W5v7r30ZSY1QT7Gq1
	D1cu1qkQqsXfQN6DoQrJmR5CoL2LEPz1fTRK05IFTpXPUTD443ed2XE4UmpvotYp0HtwCwqv8H7
	0Dolbx10/S0LeDADgQk5QU0V/vsF5VSisaBPZZflOQ+jP93YGTHs3XHD8CWHYvxAM77uNY4QdUc
	K+wRNi50cOa0H4qqxAeSoaU7f9nO6GMOZeU5cbvIySeGSc9HfsMS9U1XxHOnNLRrhO7+4HH7JJ/
	Jcs/PNhBxRVCiMOCpw0zD6lMEpNEWqPdb6HnKNQcCOYN5d0sJ8qxRfoWQc2EbhMFpww4/vXQIhg
	Q==
X-Received: by 2002:a05:600c:4443:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-488d686be7bmr90636995e9.20.1775915140383;
        Sat, 11 Apr 2026 06:45:40 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538a296sm148037005e9.12.2026.04.11.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 06:45:40 -0700 (PDT)
Message-ID: <ced8767f3e26e3e4c92f51cdffa3b967ab6eca28.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: David Carlier <devnexen@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman
 <avifishman70@gmail.com>,  Tali Perry <tali.perry1@gmail.com>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Patrick Venture	
 <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair	
 <benjaminfair@google.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, 	linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 11 Apr 2026 13:46:49 +0100
In-Reply-To: <20260411123517.15083-1-devnexen@gmail.com>
References: <20260411123517.15083-1-devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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

On Sat, 2026-04-11 at 13:35 +0100, David Carlier wrote:
> The driver acquired the ADC clock with devm_clk_get() and read its
> rate, but never called clk_prepare_enable(). The probe error path and
> npcm_adc_remove() both called clk_disable_unprepare() unconditionally,
> causing the clk framework's enable/prepare counts to underflow on
> probe failure or module unbind.
>=20
> The issue went unnoticed because NPCM BMC firmware leaves the ADC
> clock enabled at boot, so the driver happened to work in practice.
>=20
> Switch to devm_clk_get_enabled() so the clock is properly enabled
> during probe and automatically released by the device-managed
> cleanup, and drop the now-redundant clk_disable_unprepare() from
> both the probe error path and remove().
>=20
> Fixes: 9bf85fbc9d8f ("iio: adc: add NPCM ADC driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/adc/npcm_adc.c | 17 ++++++-----------
> =C2=A01 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index ddabb9600d46..6acafef3e7c7 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -231,7 +231,7 @@ static int npcm_adc_probe(struct platform_device *pde=
v)
> =C2=A0	if (IS_ERR(info->reset))
> =C2=A0		return PTR_ERR(info->reset);
> =C2=A0
> -	info->adc_clk =3D devm_clk_get(&pdev->dev, NULL);
> +	info->adc_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> =C2=A0	if (IS_ERR(info->adc_clk)) {
> =C2=A0		dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
> =C2=A0		return PTR_ERR(info->adc_clk);
> @@ -244,16 +244,14 @@ static int npcm_adc_probe(struct platform_device *p=
dev)
> =C2=A0	info->adc_sample_hz =3D clk_get_rate(info->adc_clk) / ((div + 1) *=
 2);
> =C2=A0
> =C2=A0	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret =3D irq;
> -		goto err_disable_clk;
> -	}
> +	if (irq < 0)
> +		return irq;
> =C2=A0
> =C2=A0	ret =3D devm_request_irq(&pdev->dev, irq, npcm_adc_isr, 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "NPCM_ADC", indio_dev);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(dev, "failed requesting interrupt\n");
> -		goto err_disable_clk;
> +		return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	reg_con =3D ioread32(info->regs + NPCM_ADCCON);
> @@ -262,7 +260,7 @@ static int npcm_adc_probe(struct platform_device *pde=
v)
> =C2=A0		ret =3D regulator_enable(info->vref);
> =C2=A0		if (ret) {
> =C2=A0			dev_err(&pdev->dev, "Can't enable ADC reference
> voltage\n");
> -			goto err_disable_clk;
> +			return ret;
> =C2=A0		}
> =C2=A0
> =C2=A0		iowrite32(reg_con & ~NPCM_ADCCON_REFSEL,
> @@ -274,7 +272,7 @@ static int npcm_adc_probe(struct platform_device *pde=
v)
> =C2=A0		 */
> =C2=A0		if (PTR_ERR(info->vref) !=3D -ENODEV) {
> =C2=A0			ret =3D PTR_ERR(info->vref);
> -			goto err_disable_clk;
> +			return ret;
> =C2=A0		}
> =C2=A0
> =C2=A0		/* Use internal reference */
> @@ -314,8 +312,6 @@ static int npcm_adc_probe(struct platform_device *pde=
v)
> =C2=A0	iowrite32(reg_con & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON)=
;
> =C2=A0	if (!IS_ERR(info->vref))
> =C2=A0		regulator_disable(info->vref);
> -err_disable_clk:
> -	clk_disable_unprepare(info->adc_clk);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> @@ -332,7 +328,6 @@ static void npcm_adc_remove(struct platform_device *p=
dev)
> =C2=A0	iowrite32(regtemp & ~NPCM_ADCCON_ADC_EN, info->regs + NPCM_ADCCON)=
;
> =C2=A0	if (!IS_ERR(info->vref))
> =C2=A0		regulator_disable(info->vref);
> -	clk_disable_unprepare(info->adc_clk);
> =C2=A0}
> =C2=A0
> =C2=A0static struct platform_driver npcm_adc_driver =3D {

