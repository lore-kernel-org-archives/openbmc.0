Return-Path: <openbmc+bounces-2328-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB27DC53219
	for <openbmc@archiver.kernel.org>; Wed, 29 Jul 2026 16:21:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h9Hf151KZz2yDr;
	Thu, 30 Jul 2026 02:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785342105;
	cv=none; b=goIeXiB+GAwwwHN4W7IfeZdqJGHam0VQUVdET8k39fZWzpXNG2H9sPtotE1cwTyVYUHmll+M5S15gdvricrWrb2nLHrtAQ1+Gk/V42A8793WKkaWD0uSJtKY5HKEzYoD4ZHJ8k+NHRomrNKfVdM265eqTlWjyH792bNLCo9m1FU02aSu3+0LrjlMSpXkS8emO6PFcuJ8Kjo6jlNZrP27u340T0oF9XVOneUI0uCjDX+1IipVbM6WroON8OvarRhZj5M9i4PEvpIZcSDoc1QX9pZthZnUkbuL/+wxh0YhVTbEUCG4WRvXyTh7YE21D3u+Hk89Uc7EjSdncQ5df108WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785342105; c=relaxed/relaxed;
	bh=MGJ04DPjDp5NhuCKplYWqLlAi7JvCa6BgyiKARstS28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muFU5PluylTkx9Fcw41f3QUFliaf0ozokDI2/D5he/t9O2pgqmTd3NKQS5rZSL4LZmL8YrUiNKlyY4a2FxvsyBIzL0+Hh5DiBgQx1C0Du8z9m/TEaB9Zpi9+MnLTvtrooTwHBT/jRbj0G6i6rthZk6MLnbqRARsGJYSe/hDafpVt4c5f7xk4IFOQydhexmdIGDkhNZSLY13pR20yJAmbwZ7iifIAm/Wu5yHeqh6HyBQp2jIRyG/Citp3QzBPZhMJd2kmuFjhrCE/2pRogUgCqH0g0DMVXwZrYTrZuhy/O8ypAxmlTAs1FidW52FTHUy+CQOFqnLhHRoj9Q1P2yBLFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTFRS8MS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LTFRS8MS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9Hdz26flz2xlZ
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 02:21:42 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84867f07d63so1431287b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342099; x=1785946899; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MGJ04DPjDp5NhuCKplYWqLlAi7JvCa6BgyiKARstS28=;
        b=LTFRS8MSZGceoHjyyypoCdDRrAsRhyh/cwO3fkUbt/9slJfuf0PLfPwsRC/7UpFfjm
         6jk5TdfeSx78MQovFtuTS2t7ZLNQ26zT8cs1ExSuZGeqUhpI04GqqQHaCDWdxUGjmXa4
         ot+gTpfWpvPuhoZCbg5I3WrdAfeg+r7lsgSmHCwcsZFTCIL0YMS434HP/wQtJw6hJCQp
         0PJ+9UEW6L2GP3cpcbxEeZ4AmjG6/R9ZPSxNZY+2SSGJbXi55PJuiTq1pyBSQxmhleE7
         J6750E0PPa5h8ud8SI8gFTRZ5tlGkbeFbAFrJncWSQlD0s6rXOF14ZxYjNWAepMRCuMU
         g/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342099; x=1785946899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGJ04DPjDp5NhuCKplYWqLlAi7JvCa6BgyiKARstS28=;
        b=fa2/H7wDiQB+SwtrNo7N48oUsxoNS4On/iMAJYLvlpt4+tnYRaewstCRLiL9fZgMtp
         KxrBI660wEF3B2/qVWdvkmodkIiUs0irRnciHExWBMAnRs071Wahn9MC+XtAta161aog
         qPlMT/NcMyZ/anA67WzBv3VzAmHO9LPdRHA5dR/x2lJFkTpikM9WkfSVNpL17w7Hzgec
         vP6iifcbXrHM740Rfo1THK0EbOMVrU843g9GTE7+o51Tik5PG6XzFM0g1Sa4tgOJOGIj
         ywewE2LEIpaQkgiPAYCHTEux1ijZgLdF6u9ggt+PFaD3Dl5ZOTbMZUwtvKb1kcfT7YDN
         W9bA==
X-Forwarded-Encrypted: i=1; AHgh+RrIWyLzdc4xfz0X9jqLl/C4utzSM6jeexLdi216wHMCmZH0YMUenghP15QVMoJtLo2mUGTo82P5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnTQ8ftiTJPksZpR/oJ3Lq2t3niG1+FO9uCLGyqaC18eG6nBQQ
	EHXl2mZbV4OtIfg2pHgFjrttVCvJs6+A41qVZVrLn0Ep3yRnyjNu0r0/
X-Gm-Gg: AR+sD1394emX185eswb0aa7u5p+GVeSKuTmENC/04vaTUFKJOFdUY9Kl7VIgBZzn72T
	Glh8hG0Ug7lSsSuOvNX/CHx+WVENU/JHJwe38bFy7t/w2wnVqfN37AFBpGy8SqCY0Kauo+yl03X
	sb70DnUR4bw/1bIwG5EgyAgaOAT7Uh/2A5oi0LwP2CqinQjLNaUsSXYPRU3CntQxcaJaXxtxGmF
	shOQ/7UuGm+VBuEf7CsInb9X28sydYlRYnsSpJwXw2wJqvK1Q9NymZrJNz0z2IQvak1CnCz/23g
	UMEYV2+K12VXHTmVFHgxFgBCcNkim7WCKCh6gT0vA8folRaq8bJOV2xMbBZL9PXk0E9KvDyQz2F
	1rdTNKO8VfX4hh0Wt18Bwnuzo3+UOIN7cCNgKmu6PfebQiFp/KSfWAA/bRrkd7sZ2McAUlhzr+8
	fv0Abi2HM3vH1k3w50/vCpbMZPHkScIktXeHYFfZj7T2e4ZCCFxRS3rebuihKeIydmA6Sqse+T6
	A==
X-Received: by 2002:a05:6a21:7a82:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3c8ab0db549mr8766339637.28.1785342098975;
        Wed, 29 Jul 2026 09:21:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504db2c4csm11392516eec.28.2026.07.29.09.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:21:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 09:21:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v2] hwmon: (npcm750-pwm-fan): stop fan timer on device
 detach
Message-ID: <d3561ea0-87fa-4ef8-99be-e4600d6d07bc@roeck-us.net>
References: <20260729100116.790-1-getshell@seu.edu.cn>
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
In-Reply-To: <20260729100116.790-1-getshell@seu.edu.cn>

On Wed, Jul 29, 2026 at 06:01:16PM +0800, Hongyan Xu wrote:
> When a fan tach channel is present, npcm7xx_pwm_fan_probe() starts
> fan_timer. The timer callback polls tach state and rearms the timer, but
> the driver has no remove callback or devm cleanup action to stop it. On
> device detach, the devm-managed driver data and I/O mappings can be
> released while the timer is still pending or running.
> 
> Register a devm cleanup action before starting the timer and shut the
> timer down synchronously from that action.
> 
> This issue was found by a static analysis tool.
> 
> Fixes: f1fd4a4db777 ("hwmon: Add NPCM7xx PWM and Fan driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>

Applied.

Thanks,
Guenter

