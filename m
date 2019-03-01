Return-Path: <krzk@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="BCl6n1mh"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449kJX4D3hzDqQC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 20:14:36 +1100 (AEDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB1BA218EA
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551431673;
 bh=adRrWvZswv6/A0CZm9xhGl59CI2WDzORwkMwbCYtQlc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BCl6n1mhiS0jcoDyT/08ZNvSQm5sLptP37zarhchbNnjvkwXifbJBkuYNiKHlnHog
 qRatBMZsA5uxOd8eg2MQiuKD5wDfsERQOzeKGre4+m/M8VxEJiam8z42FkNVLKBgbU
 Uby4zE8sASZJbpEhkYcoicuitwL0zOGXcWpW+PpY=
Received: by mail-lj1-f170.google.com with SMTP id q128so19703345ljb.11
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 01:14:32 -0800 (PST)
X-Gm-Message-State: APjAAAUcRroz7RLeWMak8U2/gYfjuj6bls5ltb67/n8zdaqhmCu6rKUn
 1K6H20bY06AMbRsf3Hx0TMyPoK21uN++edOZ8fk=
X-Google-Smtp-Source: APXvYqzeo89Plxq0Q8UMuie44AXbgyZ693kY16HuhEKYLKV3/3K1xVsYsb+In2YxJwz56HVlLG7GExZh6IWcIBtaTOA=
X-Received: by 2002:a2e:88d1:: with SMTP id a17mr1970816ljk.169.1551431670964; 
 Fri, 01 Mar 2019 01:14:30 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-3-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1551430616-42014-3-git-send-email-wen.yang99@zte.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 1 Mar 2019 10:14:19 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcn=eP1h0_DNVuKBcb3WXb3mzvPGm-mkk6D8auvC7ABGA@mail.gmail.com>
Message-ID: <CAJKOXPcn=eP1h0_DNVuKBcb3WXb3mzvPGm-mkk6D8auvC7ABGA@mail.gmail.com>
Subject: Re: [PATCH 03/15] ARM: exynos: fix a leaked reference by
 addingmissing of_node_put
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, 
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kgene@kernel.org, 
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 michal.simek@xilinx.com, 
 afaerber@suse.de, manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, 
 heiko@sntech.de, linux-rockchip@lists.infradead.org, f.fainelli@gmail.com, 
 rjui@broadcom.com, sbranden@broadcom.com, 
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, 
 avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, 
 yuenn@google.com, brendanhiggins@google.com, openbmc@lists.ozlabs.org, 
 xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org, 
 catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au, 
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, 
 linux-imx@nxp.com, wang.yi59@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 01 Mar 2019 09:14:37 -0000

On Fri, 1 Mar 2019 at 09:57, Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-exynos/firmware.c:201:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
> ./arch/arm/mach-exynos/firmware.c:204:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
> ./arch/arm/mach-exynos/suspend.c:642:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 634, but without a corresponding object release within this function.

Thanks, looks good. I'll take it however after merge window.

There are no dependencies between patches therefore you could limit
the amount of people you CC. You put specific "Cc" fields in patch but
you did not use them and sent it to 40 addresses. The CC in the patch
has exactly this purpose - do not send everything to everyone...

Best regards,
Krzysztof
