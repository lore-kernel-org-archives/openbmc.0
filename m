Return-Path: <openbmc+bounces-2512-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC22C61DD9
	for <openbmc@archiver.kernel.org>; Sun, 30 Aug 2026 23:48:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hY82x4HHYz2y8d;
	Mon, 31 Aug 2026 09:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787922416;
	cv=none; b=fPy39TVPiG4rmfKP7Z6zHfGRDtHbMPGMmDtvUEKRw1XsTr7Tw54EbXWxZBy0JX4oNVwmaKMjAIPrtAczJtH4nF2QhVN8vh3ZdbXGwqOWtmQ0XgPfsaCeBd9krL/5wRZ3+ln8YohwdbHvw2r/PHtRbmVpuPP7GyRfXw27h/+FNYP28bGDb+uJKOuPdJXOwYIl6c77EqCHykjHSwWqUERAjJmQpI+ncLIsdZ4YSDacTTPdYBIBs7E+lJwZ86xnXW0pMFeUsVf6/9LO7s0rmS004VHpx/kkOMNJ6yrremxfhSh1TkrzGLOasMofoQuOg3eFXYBWtCWQBQRr6XWXyfVyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787922416; c=relaxed/relaxed;
	bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPPuYYWVYzDBU8lgfFsukr8NYy4Av4LG1/QV5UMCVPyqpqmS1XOxETsNiemsz6fM5D1elEmobUQBWnXhEi+aLw3MSvspZtwyx1kmkfk9l2RSNmRsQoSjeHcaISjfK1rl6tCamZZbko+VW5OMg/CAhMZ56/ec0F9Fz0pn3fOTkxM+l9rT34HaG0tvclgpqa/cABhYzjuH6ZrJ1cT7KP7D6jyRm72llfwtza4+No/QC19yKj4xLDc3Rj3kIcyESLJVC/jW2wG5FXU24oD8fb8xXQ5+UFzq9ungtjrivY+pQAFq3qvqDI8wIbCYOtZ3kT54RPeU0IEYPP0HOiv0eIiJnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sUAJR+U+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=joshua.crofts1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sUAJR+U+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=joshua.crofts1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hWdvL3r9Jz2y2T
	for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2026 23:06:53 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so6531665e9.1
        for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2026 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922409; x=1788527209; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=sUAJR+U+zWJc1hpuR+b1Ia018Trpp0TT2vrZB/6YPuiisY/D17lkhv97o5Gr83+pt6
         Gl4JAnmshYogMzIad6NJjId5LiP00JwCOjwC2PzlB7NLkLRfg5YkQMLSVLux3I34maM9
         qsKwnZvrlMEQl3qFc73qJAEmW0nKcksQo+MzN1VBEtNBrVt0QstQp3qRTgxJQLXkG9zx
         xSZ/KSRcHm1IEvI2jKdWKCnPPNAHYOj4qOfOvCHleo74/HoWPt3XHqd1Uuq4m6ebXFTC
         N1sUAD4MIY7xVRon84g8zdBGcTAcgOqVpH7eI08a5kYgWd3r92bwLV6ic1+OcqUsU2ox
         68ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922409; x=1788527209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSe5hUo+anN+B3supDKWk8oyF7C/bYQ978Bx8sQdufY=;
        b=E9kGd3g7znJ5wMmEwlAxZiJv5NJoB1tqzFHzx1dhr/d7RL13YIJSAqCeQyuzUw3sjw
         SsHFNSG1aDp4dwxDKA0mCM2mhIBthK79d1eIQOwH4NFsnW3hrO2dJTbnFYgYMfT6kBzj
         wQcTatHYKu4QF+bHpMdTJ/sXIzDz74YMFrHqQBsU63wzzfHKLjItjIVbC4klUsQYKo/7
         YKCj9EUz6DO/hq+7g1jUiB5f4NPo4VcF4aGhhQvm+h2MutIjSpMsbBYw6kz4GkDWF6LF
         3ah12KDLhuo7x0zjyX6hSmjATFONWjV10e735nEfVHxasNN07BXje2rbpASkTfIhCZUV
         MC3w==
X-Forwarded-Encrypted: i=1; AHgh+Roo9BWgsvExQIomIgrUFxvPgXDuujnuqoycv/Rut7Mn0auMmpL2hCSXLQapKaoCK9Vs+LcVIz1m@lists.ozlabs.org
X-Gm-Message-State: AFuF++nQD1FukXE2hg8lC94tnLMgbPdDoJGdB/qS04vHd6slmVW39NUA
	/zufte09IZNdGjqanH2QDRjdJ/lLQR5JEvOULASXxozZ2XCB83pUS5BA
X-Gm-Gg: AR+sD11HmXl1RCc6YJGTrcKmkaFCtkTqhaAA4gXIVBhKP9hUvnUCqjMto0xW3MVOykZ
	vYEpCMTWSxrr15w6Z9rnKQfk7M7ncE2SUlOcFY7UsikzGDwusmAANQy0AJg7CpLxlF7JyJ+Ft4D
	B9p25OGaClnmQUt3z1m1V9j+e3qGX9SxDW0MkyS2+UQBmMeZgB17FLJwaKtlsPgT81YFa7bjqJT
	mVGRTLksS5aSxBVPfEINk3UHbInDoIVkArVko4o9FkMaDPnTi4B3GlQjyETEXlgbeJVjsv5vrpn
	gwHmX2ClJq3fmDqURrLRFSUGMSKZ1YMvv46lbDUSRz3epEOGTzNUsDLFJZEh6PicsTvZP0SfBLj
	v7/ve6hIlfc7wS7FIEPRsazO35XVGlRE6YdgL/oYcMGQinudBJObulwfqouXJBAGonObv/rZO2Q
	LVw7UgEGgF2edjIXw94MQWj9BBMJ2Y5/Prlq7SUuX/YEwJkusdRtgei1pvAoYG2pwMEa0jT0/99
	bpjVgiGdqAXHvwLw4GLOpDjuPt221kW76X+kqyG88gv8fW6aGZV3zVjn6GZX9LED7eyhyn1fn0N
	9epAvQacoOUzJ10SPXDPOt6nNpvZ/SKmlSSlhREiA30BoaGcCmRqjh2/86Jt3FAsvWp/fjd3GVp
	8GCZblMzlC4YvCtKXVo4wUSaAvIqeAbmaEBh5bAgbqEMdI+6Lz2G/AdfLDER9vn0UoV1Lx5M=
X-Received: by 2002:a05:600c:4715:b0:499:cd34:f7c with SMTP id 5b1f17b1804b1-49b91c26a01mr97741555e9.5.1787922408578;
        Fri, 28 Aug 2026 06:06:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm53999285e9.11.2026.08.28.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:06:47 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:06:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 0/2] iio: adc: Add Axiado SARADC driver
Message-ID: <20260828150644.00005d5c@gmail.com>
In-Reply-To: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
References: <20260828-axiado-ax3000-ax3005-saradc-v6-0-4cea467e4167@axiado.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 05:28:27 -0700
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> A new driver is needed because this SAR ADC controller is a SoC-specific
> hardware block used on Axiado SoCs. It has its own register layout,
> channel enable handling, conversion control, and data readout sequence,
> and it does not match any existing upstream IIO ADC driver.
> 
> AX3000 provides sixteen input channels, while AX3005 provides eight
> input channels. The driver uses SoC match data to select the number of
> available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.
> 
> The datasheet is not publicly available. Public high-level product
> information is available at:
> 
>   https://axiado.com/products/#AX3080
> 
> The register definitions and programming sequence used by this driver
> are based on Axiado internal SoC documentation.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---

You didn't have to send a new version, Jonathan tweaked the commit and
applied it:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=839dc31a0c6508354b18d09a9e5aa5d8f4c05860
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=testing&id=205f4aeaae3148848c153a0d98a6f604b39aba7c

-- 
Kind regards,
Joshua Crofts

