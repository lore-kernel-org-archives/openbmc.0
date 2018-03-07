Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::242; helo=mail-wr0-x242.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="fPfzsOj0"; 
 dkim-atps=neutral
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxLG21r1gzF1cW
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 04:28:26 +1100 (AEDT)
Received: by mail-wr0-x242.google.com with SMTP id l43so2990253wrc.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 09:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LzEImWxlTrETwptTyVO06xl+YgX/mf5jaUz+noHKN94=;
 b=fPfzsOj0x/G7SfP2xqxRpJEBrGE2wlV52An/FZavUfXRNVP23R8nM9XgivrUV4cOYz
 SXUXLMoumyzva7743r8y5ol+m3c788FvEt95AAfKevQ0QS7UirM8kSdep9aSV49fulxf
 PG5lMJboHmCT9XDU4vD4gClAeDI+pQBWUxoVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LzEImWxlTrETwptTyVO06xl+YgX/mf5jaUz+noHKN94=;
 b=cL9zUb5jtZe8NZDnO7kwHMNniqn3GYAmeo4t9/vmzFwiYwbLolNjZ0bWJcPNNBEjFr
 0s2k6xU4EiOzxWxQltAKNPnObiVak+yCHOIwFLhL/RnanfoZJLkKS1m1MtkU3nEFcFQy
 0w34rfLNEJuBl3D5dH9lDK39clPB+GWl2Z3olEoB5ga8KKj1Lt0gnH4jkqN49c0cZgD9
 Uov18BU0oVzWf1RIbxwNmT+ihu4kW4y7pwcrY4wioAJVeUxBR6CexKlb67leu3NiV0EO
 pGbQw3SBbAfDYDIuryruCy3cZB10taRC0N0u0Prym5vuFsVBHS2vW63pg3v9i1O0MJik
 jfGQ==
X-Gm-Message-State: APf1xPDumM+zvA0KqKVDQC4dmLSPuVKJ6IHumSxElX/FWhcOP62Zqc3d
 XoeqmJCJG8jJ9TawTuzcELptMJyl1Sg=
X-Google-Smtp-Source: AG47ELuALuRMOZzcLL0A+xo3FnQpINV9HdQ3oveAhSzDjZ56n8ue5uGVzpPfEIIq0e4vhkQ9qN2tBQ==
X-Received: by 10.223.152.228 with SMTP id w91mr18863639wrb.74.1520443703148; 
 Wed, 07 Mar 2018 09:28:23 -0800 (PST)
Received: from [192.168.1.75] (lft31-1-88-121-166-205.fbx.proxad.net.
 [88.121.166.205])
 by smtp.googlemail.com with ESMTPSA id 1sm5608166wmj.35.2018.03.07.09.28.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Mar 2018 09:28:22 -0800 (PST)
Subject: Re: [PATCH v4 2/2] clocksource: npcm: add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com,
 brendanhiggins@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com>
 <1519655769-25836-3-git-send-email-tmaimon77@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f0330114-1704-a464-94ce-aeafb43115ea@linaro.org>
Date: Wed, 7 Mar 2018 18:28:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519655769-25836-3-git-send-email-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 17:28:26 -0000


Hi Tomer,

change the subject to: clocksource/drivers/npcm: Add NPCM7xx timer driver

On 26/02/2018 15:36, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx timer driver.
> 
> the clocksource Enable 24-bit TIMER0 and TIMER1 counters,
> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>


[ ... ]

> +config NPCM7XX_TIMER
> +	bool "NPCM7xx timer driver" if COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select CLKSRC_MMIO
> +	help
> +	  Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx arcithcture,

architecture

> +	  While TIMER0 serves as clockevent and TIMER1 serves as clocksource.
> +
>  config CADENCE_TTC_TIMER
>  	bool "Cadence TTC timer driver" if COMPILE_TEST
>  	depends on COMMON_CLK
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index d6dec4489d66..b16c1a2b9e0d 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
>  obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
>  obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
>  obj-$(CONFIG_SPRD_TIMER)	+= timer-sprd.o
> +obj-$(CONFIG_NPCM7XX_TIMER)	+= npcm7xx-timer.o

Not mandatory but if you can change to timer-npcm7xx that would be nice.

>  obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o

[ ... ]

> +static int npcm7xx_clockevent_setnextevent(unsigned long evt,
> +		struct clock_event_device *clk)

npcm7xx_timer_set_next_event()

[ ... ]

> +static int __init npcm7xx_timer_init(struct device_node *np)
> +{
> +	struct clk *clk;
> +	int ret;
> +	u32 rate;
> +
> +	clk = of_clk_get(np, 0);
> +
> +	if (IS_ERR(clk)) {
> +		ret = of_property_read_u32(np, "clock-frequency", &rate);
> +		if (ret)
> +			return ret;
> +	} else {
> +		clk_prepare_enable(clk);
> +		rate = clk_get_rate(clk);
> +		npcm7xx_to.of_clk.clk = clk;
> +	}

[ ... ]

See comment on DT binding patch 1/2

> +err_timer_of_init:
> +	if (!IS_ERR(clk)) {
> +		clk_disable_unprepare(clk);
> +		clk_put(clk);
> +	}
> +
> +	return ret;
> +}
> +
> +TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);
> +
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
