Return-Path: <openbmc+bounces-2358-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9FC55184
	for <openbmc@archiver.kernel.org>; Tue,  4 Aug 2026 04:23:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDgPq1knjz2yYs;
	Tue, 04 Aug 2026 14:22:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785817287;
	cv=none; b=Y3wM1ClVKnbWJSC31MPqT5MM9I4t8Q6BenQU9pCRPkRypKynwF9JmBuv/JC8h0JlnEiWpyKLvsG7GOiqDZmQYYeDe2dD9O22XhQLs9d0q5mIRBTGI7LCeGcqarT8S4tWYHGz2wqSUlHLp8yHi71i3EF6uu8251l0Z/iTKUV361VsswkN7UXdpETg2LZaMQiGlGYmLYufbYmoHCT31udlZ7CMH8I6aEgFK7TbuhX21Q95gfi0IjqVYYk4KLyhGvGngp0xI4U8KGKhVQ/iUDBdcyBOgY91C6jg3Wo92sBtfrPIPoiMHQPUnxlnt9luNOfoWYnUqyGc0pjFc488PIJrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785817287; c=relaxed/relaxed;
	bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibWiX8PdRSMIo4mrP1GzjPxGv0lLO8YmvrATmatuYhvZFyphoXNRKbbNF3SsLEfUG35mnqYW/ni+pLKYTVtOSEWQAAjrNT5DlxjzQhG5S8RTqeGOSdPjZJ1h+FQN0M2SvVDPXubw4xUAPQ0e+28++J5PlZP/NLGEMlv0mumsMFRpyretvWkgt+wNoOb4sfcpdsCCqTZIQlp1mqySLrjKAfGnHkDMXiAog7yaBtfLueIjgyMleCLuzg/u9LxkxTXuNt2HXjx5tDVB2UBkqeAJSZcqmZP+mAZaisVfgNkvAl5n0038jKyGa0oqMNmdlyDQRgQ2ZBpBI2avKOxTEuNxDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rIy6b2R2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rIy6b2R2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDgN65qw2z2xpn
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 14:21:25 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3811f512167so4195269a91.3
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=rIy6b2R22rwFNZlf/5xmWiEbu1mdoveN5wPttqasOit1Uh1PjZ6n8JQn+g8XoxJ5aI
         a0sEWurnUhlQrH8kkpDd8BkDMu5PrTY81JM35zQmYEslHbCZp3t0+Q+qtCTSZvHAFGUB
         3ehmwLRrqpNwxq1VqNXLoFyEkKWsiDs4HM378E7mjzhwqR2vVeGk0J6vXWl6k7d58ZjH
         cPRD2i85h7exMPDLpfeFVlZ4yp05KI/2a9VLgRUC7ImU1wLtWo12DWWC1hHZZ1wl65BI
         9ueB4LB9sR0YooyCA/sg2WsNk+uTIlWY5ZVRGZTuPrVvRNAVgmjUrpwApT99HqhDSzSZ
         OxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=tDKcmpO21XDu+YmB2TicwAB+yMXSs+sBV8QVyZJsv7HmEbeG+NAdWYIe/4j23IOWdv
         /ZcmzFUwcrkz6Go/LOMiU9qeWLdLV2IFuYJcEiNQXqi8wHx5clEYPG5bcyTDz586RmfC
         RDhsl2DV6BD502VwfH8bSKopOv/CCElOMpTohR56/3ehGl1DSGOaOeW1C0+2V4ob44hM
         kXxmGkBN2pjk9SH0S6kN/oTMuPPEo8ClMt0PBU7IXOdqakEokUWb4bum9/yaQd8prZXG
         qhWZM7W3iBN0P7G4cftTi3H7YeVE6jJP0QoVYE0UC//5z/W64ALrSSpSy8t67+GZvRcq
         xw7w==
X-Forwarded-Encrypted: i=1; AHgh+RoTvIAQJDh2gbkYQFK89TuSMPh27RbwuTbxNOJaSFJoGdVH/8tEMf4Bt+Qe9NxSFZBNUhYvIN9Y@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpFSprak6r36sSJrleqpEpbSInN5tBwFz4yS6wUFbu93ZcWCji
	SluO8GAWvzo4c1QqRlTuyjz2e+RlKGQHWDd4eyXS6l1O//+nw2TXomklUBvjVQJXglc=
X-Gm-Gg: AR+sD13YDAc7VIpAiXC5xw4PRqAfi0qGf8wgOYdY09o7d/AYjFSjaWGJnuRy2H1Iy4M
	bB4MsPagzuZ/GZCk2Fz4Vyyi6tcN9x7brAw/zzahHbXAC0WHvv1dcdipRUOzZ7EuM3NU5tOCktf
	FJjvO/jBRaZAs8gFn4ESZSOZVRoHfjNbUkswhiDp7F6GgWQjKS4ltk2B+n7Ur79zAffTkhapsCU
	TqdYVBHJUeWIeaQjwipKmpUhy8CK5bGjEX1WX552oDbBapbCE2dTBe+0OKG5XlW4GyPPgNS74nb
	ZytmlpM26uYKjMg9IENfmmZRkbwqGB+LceImadtJ4XtaOBrIOZx5jrDRSUyvTfmZdLZ8CvaZCRy
	rtse/JZf69cTkrqTfmnYCRgfTUKU7KWQbseLAebH1XFjepKZg00gu9NY3WxCabOR2L2MDSJVaLU
	UXwLYZeCoSIP+Y8e+q+Dzd6PMyOCrs/eA1FmIfDxAq3kYWACgD6ZlyKAUMmaEc
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

