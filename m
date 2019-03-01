Return-Path: <manivannan.sadhasivam@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=manivannan.sadhasivam@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="nt1k1fUw"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449vCY07XgzDqCR
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 02:55:48 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r124so11636931pgr.3
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=jLIyFAifiRAgcvZD4ggavrGnBhF8t9ofKtSW3O8SPdo=;
 b=nt1k1fUwJM5poxCxYlEuws5SBVNeAlUTIEUk58bnjvn4bqDaBbUPnWWY9gbMmQ/wM6
 bGZEwLv4BPHl+SnqH3Jk5ehTLV/5HtuvoTBKYzpymvyrA9yqh2AiWzOqLodBkRAIOPWc
 lhQXgBObH4PtSaA6zW4FKU5+dSveES5jH1bmiV2PvzObWsAiTjoyaFeG8gIIQtjsHnV9
 JKa5raQ4yO5Xm72T97mn4jKpQr1FOArglRPv8vT7gam1j+QkJhht+MQBDPOp7uyeaUPL
 s/HjI+NFsHChvIY31DnDWQbj2w59Ga/F4Oidt/Ksf3bVg8u/i9Svib5zIm74DBKvFoNT
 hlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jLIyFAifiRAgcvZD4ggavrGnBhF8t9ofKtSW3O8SPdo=;
 b=TFvzt7QxrpgPldJuPNB+hSRePHC4dLSN6DYMPf/uq96miopDz18W8d+X8RuyoSJzCa
 VQE3F3XxZ1RhyupQYWVccxqOnMkrCY3G2IVnRA9mVXrRd0b34Q1yQw303JL68yPZKBdb
 FRkI6pPC/SIIzeD5X1CaFEVHESMEDnEbmAUkTrbzk8oka5GI1Vp3h/Tz7PZ4A3hj3jzS
 1y0VAwWwPSwxlMAMEv30UqJhd87B/Am+OAF2dowL07HdcYVPGRFr706nBsTemZV0y9Cy
 KCqoTAnft2Tg5vUbH07MZve066MK4GObOSTQPWlvLrCuiGvpcjk3wHHIdHg1iG8N6KD1
 zVGg==
X-Gm-Message-State: APjAAAUnwcr4lpQzSXOir7CPAx/p24pwgxe72CKj1pfnJ2jhIIg5axi4
 8WZxzf4fNC3FVTDi5UOT3De1
X-Google-Smtp-Source: APXvYqwKdl1qp9Psj2lcXh8SiEEmaJX0plH/RB2i6CpFukg+GA77tAJ9rxSY8+0yTca1CBEA64l8KA==
X-Received: by 2002:a63:d80b:: with SMTP id b11mr5440880pgh.168.1551455744564; 
 Fri, 01 Mar 2019 07:55:44 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:630c:677c:2dd3:3db1:5145:4da9])
 by smtp.gmail.com with ESMTPSA id b138sm48505561pfb.48.2019.03.01.07.55.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Mar 2019 07:55:43 -0800 (PST)
Date: Fri, 1 Mar 2019 21:25:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>, linus.walleij@linaro.org,
 afaerber@suse.de
Cc: liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
 linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com,
 dinguyen@kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
 brendanhiggins@google.com, openbmc@lists.ozlabs.org,
 xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org,
 catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 fabio.estevam@nxp.com, linux-imx@nxp.com, wang.yi59@zte.com.cn
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190301155523.GA1915@Mani-XPS-13-9360>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 04 Mar 2019 13:02:06 +1100
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
X-List-Received-Date: Fri, 01 Mar 2019 15:55:54 -0000

Hi Wen,

On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 103, but without a corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 115, but without a corresponding object release within this function.
> ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 128, but without a corresponding object release within this function.
> 

We have a floating patch for this:
https://www.spinics.net/lists/arm-kernel/msg694544.html

Andreas: Can you please take a second look at the patchset submitted by Linus
Walleij and Russel for simplifying the Actions startup code?

Thanks,
Mani

> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/mach-actions/platsmp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mach-actions/platsmp.c b/arch/arm/mach-actions/platsmp.c
> index 4fd479c..1a8e078 100644
> --- a/arch/arm/mach-actions/platsmp.c
> +++ b/arch/arm/mach-actions/platsmp.c
> @@ -107,6 +107,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  
>  	timer_base_addr = of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!timer_base_addr) {
>  		pr_err("%s: could not map timer registers\n", __func__);
>  		return;
> @@ -119,6 +120,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  	}
>  
>  	sps_base_addr = of_iomap(node, 0);
> +	of_node_put(node);
>  	if (!sps_base_addr) {
>  		pr_err("%s: could not map sps registers\n", __func__);
>  		return;
> @@ -132,6 +134,7 @@ static void __init s500_smp_prepare_cpus(unsigned int max_cpus)
>  		}
>  
>  		scu_base_addr = of_iomap(node, 0);
> +		of_node_put(node);
>  		if (!scu_base_addr) {
>  			pr_err("%s: could not map scu registers\n", __func__);
>  			return;
> -- 
> 2.9.5
> 
