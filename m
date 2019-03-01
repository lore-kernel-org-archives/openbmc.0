Return-Path: <geert.uytterhoeven@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.67; helo=mail-ua1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449l7Q2sfGzDqRR
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 20:51:43 +1100 (AEDT)
Received: by mail-ua1-f67.google.com with SMTP id j7so7095076uak.8
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 01:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wRZYJMbL7YK8sFkJdZpCHVpLmSHoA0VUyOgYXV8p3E=;
 b=WVdkgRtX2lpldhCx6M8vbvXqjfNkr8M8v6SeMjUy3x0S3Jp0C5zjaLIENSApncq9rl
 WBBq90GGDVMZUq79osFfe9aPx4vUyYcB0+IFma5PGc/g+y1NJur0YM4FtkxKn7fM3ykc
 j3o8Bn3cFY75cEqper3Jr+Kgma2qSqFvBc0fefa9T4va8tDZdyb0ldT/PSlW+/C9OXEJ
 ZqW56TS+DmmRSjy17Toea36WyptUEFu+Z3vBiHYL3cx+9cNbKYVnblWAQlLq2AY3Q5UF
 JX617JxN2DPBX5Rkhd9TOKJXNViPl9vPWRrhq9Gp2uclvVFFSNgNhd+ArExiWrpAktQf
 0aKA==
X-Gm-Message-State: APjAAAUnDzGOMiCSzkX/XtnCbd6Ze4uAhbrg1wsv3uFjwQ3jj0eokexB
 7X5zntWzMeShhs4+jqswluHYgr+3tZtUgbE6mQM=
X-Google-Smtp-Source: APXvYqwQqmv0qSf/5I7Q7XSoWMbil550gLemcgNm3OkWBAPRfchw5wWM4WxaHoIxWPSOeqFbfrsBQFGlYJTQ+WlPsfk=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr2151989vsc.152.1551433899715; 
 Fri, 01 Mar 2019 01:51:39 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Mar 2019 10:51:27 +0100
Message-ID: <CAMuHMdWrY0UNhCA7a8oHVfdVNXaB=15qFuWqvuU9OZpf7-ecmg@mail.gmail.com>
Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
 Linus Walleij <linus.walleij@linaro.org>, avifishman70@gmail.com,
 tmaimon77@gmail.com, 
 venture@google.com, yuenn@google.com, brendanhiggins@google.com, 
 openbmc@lists.ozlabs.org, Wei Xu <xuwei5@hisilicon.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com, wang.yi59@zte.com.cn
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
X-List-Received-Date: Fri, 01 Mar 2019 09:51:47 -0000

On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
> ./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
