Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DDOKuiSA"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449qzj0rT2zDqLV
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 00:30:24 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id d14so20367966ljl.9
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 05:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/XJDPgZr92xbE7yFFhPob5maKvzEO0Ch9NxM0VD/tA=;
 b=DDOKuiSAybrLJ9HTTyxnqDUYKXjm/K4uQyuMsw6fxtSlsimcQPnh5ydyQ3xHrqNBtj
 Myl/3Ef6pxTs3apyhr0wqKC1c97E93vv1JJ1SvB5LnW2ph+Tyc6uw6+231N51HjXY7/8
 FuJbDswOwSPQo/JCFei/uxNAwLpXvrdQJQehhNcL6KzEzP/6OZcxpMsxQ6CXg6I5PHNa
 PUdyPg0Oe3Khbdo68+M7g7W5M75WXSDzighDnyuCURZwjo/QpQHbgb8vcy34GCcLVO9v
 sgnh76Y8n9Pav3vNyMPBSoAVX7yoV77yW3TjE6PdjBn/ORpP8c5UiUIL/9ceMgW1UYSf
 KFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/XJDPgZr92xbE7yFFhPob5maKvzEO0Ch9NxM0VD/tA=;
 b=YjWDGKgLQMLnx/dLTTByfdy/fs1k/xx8UREfJ1gKDUKhfwm5EWVYDmmU9nz5PzwgWb
 KCpV3xRBMux6kV8K+CNScVDGylK9DqcuuFfZXKFMc8MVe/4dc6ktrIuXeCk52GK8ccm9
 7WizcoloBSjfqHqpXEelU6QHwoN9m07yHxBhzsyjjgjP8SxXS8EAxEWUvEgDqIilzf1h
 NNIoG7jN+77jGn1afOSnTrIYKm+vRlRPbBckr4SinbASazK2aQtKoRgLTcB7OV25cDUP
 cjHR5Pel/sSXoYOUq7aZpTw8M/UQeVRq9F04t9Km9mQZvYrKPkOMd37+tHY1NLa2gQV5
 v/RQ==
X-Gm-Message-State: APjAAAWuFnA5BL++EA59i0NxUePb1imC76PiVTnlIKmQ7/wMVCop5lye
 eMNnUmXsp8mp02O4mRez7jPLhv0/nmK97SGbVBspyA==
X-Google-Smtp-Source: APXvYqzQBL4m/JhwTqQVZZDw5PN823UelfkF5SqwestEOA1FGFQe7QDjXsZTb/laUfbMj1HJu1EZEe6HumI04LW7sZU=
X-Received: by 2002:a2e:6a18:: with SMTP id f24mr2839458ljc.97.1551447019150; 
 Fri, 01 Mar 2019 05:30:19 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Mar 2019 14:30:07 +0100
Message-ID: <CACRpkdbRfagzAr6zRBtEJ0Z2fvLhiMsy8CPsuiFswf0NjzvCRw@mail.gmail.com>
Subject: Re: [PATCH 11/15] ARM: versatile: fix a leaked reference by
 addingmissing of_node_put
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dinh Nguyen <dinguyen@kernel.org>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 avifishman70@gmail.com, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Xu Wei <xuwei5@hisilicon.com>, Maxime Ripard <maxime.ripard@bootlin.com>, 
 Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, 
 NXP Linux Team <linux-imx@nxp.com>, wang.yi59@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 04 Mar 2019 13:02:05 +1100
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
X-List-Received-Date: Fri, 01 Mar 2019 13:30:26 -0000

On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-versatile/versatile_dt.c:315:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
> ./arch/arm/mach-versatile/versatile_dt.c:320:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Patch applied. Will send upstream next kernel cycle or so.

Yours,
Linus Walleij
