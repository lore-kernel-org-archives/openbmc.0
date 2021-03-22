Return-Path: <SRS0=WscT=IU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AF9C433DB
	for <openbmc@archiver.kernel.org>; Mon, 22 Mar 2021 10:47:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84E76198E
	for <openbmc@archiver.kernel.org>; Mon, 22 Mar 2021 10:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84E76198E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3rmT0pncz3041
	for <openbmc@archiver.kernel.org>; Mon, 22 Mar 2021 21:47:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eYfP90bC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eYfP90bC; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3rm14GXWz2yjY
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 21:46:54 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11114185wmy.5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 03:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p4Z+wpe/vlKTP8y/0b+d0+U+PvDT/FlgjYt5lTllbW4=;
 b=eYfP90bCndlRF+00r9IZJOiHhMudTRzbsxstg4t3X6AzYHN9oYXfW3RwSYOUneya5j
 JT3/5iPETN2qrtY5SNH59Ebc8DISrjoiSfanSQdXOYn+1xOBNVURx0xQ9mc8N6hX8TKG
 IIQuWx86G/vRLw7L3nyWTv+GyIn7X/M6vNrJv1vLeMjNiSgRbqmuZdI3FnBEFFuYIUnJ
 ZTb68qljpYnOA5BaPnEHIkA/VK9n+DZ1KP0D9PQKgfwvr3e0gQgCJDdhOuBwH2jxZyIi
 mFVsjZuVzxa20YvtuaBbepuQ2o6Y9L3GjtXsi0/VGDS1Fzc2XtHXw8Lsgqo8+jBYlJpQ
 FIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4Z+wpe/vlKTP8y/0b+d0+U+PvDT/FlgjYt5lTllbW4=;
 b=o3BGhYes5Z8PrXFFUluivGivJcAOeZXIho7LLHxpLopaCL8eIN783mm8YuSAuGJl8A
 /O3ZcQ5otaUy4u5+kSFXbM9hpSIfGspfh2EMUkMk4E+KJQ83U6u4SX91VD9+OyLX9nvc
 fsUXBOH8Zh8wI8naNl/Xg/rUMk3ZHb7m0jChtAD1ukke/yd49cyJyy5iGpbK0jtdZaAK
 aJlO1TMeE6geRo+XLfSVrfxv7nwMgO6Bn3PMGUX5iB85l95Yf4HRvmt5um8aP/Ga1vtx
 83AJPjWzBHZ0a6M66toWoT3g98lLjc8YoSQL7r49dW7UiW8BMr0yDNSDUcPbTzQNmQfx
 kpKQ==
X-Gm-Message-State: AOAM533zhOt3nPM0FUv0+q0NMhjOmb8LqOOw4TKao4pZZep9YpRtysDs
 ppDiNT83XRsHCqaqkxfEsV8gOA==
X-Google-Smtp-Source: ABdhPJxTICOn4dREAmCJlaSoXT3/chc3t/SLyvSy99RFM/zEpURlFKD2twjaC7AN+aVj3xlziA5Nig==
X-Received: by 2002:a1c:bdc2:: with SMTP id
 n185mr15561214wmf.128.1616410006852; 
 Mon, 22 Mar 2021 03:46:46 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d8b:d5f9:2138:169c?
 ([2a01:e34:ed2f:f020:d8b:d5f9:2138:169c])
 by smtp.googlemail.com with ESMTPSA id 18sm16024198wmj.21.2021.03.22.03.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:46:46 -0700 (PDT)
Subject: Re: [PATCH 10/14] clocksource/drivers/npcm: Add support for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-11-j.neuschaefer@gmx.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a0ddef86-c94b-f474-df0a-38ea3f66ad80@linaro.org>
Date: Mon, 22 Mar 2021 11:46:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210320181610.680870-11-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 20/03/2021 19:16, Jonathan Neuschäfer wrote:
> Add a compatible string for WPCM450, which has essentially the same
> timer controller.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
