Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="hZu9tlVv"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CfVQ5DYDzDq5x
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 23:29:49 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id q128so4146374ljb.11
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 04:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgxOZP+dFQBUPmSEDR9WfH52m7XyQaNgMzlC/Q0birs=;
 b=hZu9tlVv49i8EUfictk3sxX9NSdfhxtF6JwpGqTjGVCtqDrBsnLl3ParhWyXQzWgg8
 8LwN9FvowN3pgbMWVla1VDGTGvtb7Pal8paz4s0+1Yt8gP3jkYfJx24Pk0847kC2kOcY
 OKi5N6vLYqMdXXfd/euYJJjBuLw3OymL0hvvLa8isn9xyILlCIhef8rJ6zoFDEgbCm5W
 Dj3XpBaakqkvkQQXl3y0to7P1YHLA44pEq1TPQFc6y+Hta6oDaNha7PWGSYVlyqkpmh+
 J54b471LNq8ZwKYehc4//UffGvfVZFw8IEMo4GW+Cy/yoNVlgrvm0+cjKtynfQ+ig0+S
 rkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgxOZP+dFQBUPmSEDR9WfH52m7XyQaNgMzlC/Q0birs=;
 b=K+ItkhD9ZylD9rBB9Ip40LBkQrMBwl7SuQ2Oa7dSdWnLpX+3EIJkXMxyi4I7DQGW6Q
 K5xD1sAK4kWd0HTERaAp7N1V09Ox2IeymFJR2x71q9vj5UP1Xe/vOv/LOUyqqYG6ZMn1
 +VHA53W88blBfKeqBy7p0X3rl/UaHLxQRjiUYXfjBcGsrkZnnv9oMWFI0e8cWcQ5c3Oh
 QkSi6Yb2vx9oytYUhDPQWYTzB7/LrS0QbmjLUzVVGWYQ0ou6Zqhzq8E8KRvSbK+fZvqc
 a3miaH9FWr15NvW+07ePM6FFTJeqgdprRnMZEtdu9eUd26vcK5HlSVd58XEBQBSRYqt5
 v87A==
X-Gm-Message-State: APjAAAX4OOenjSYuKWkd+h8Rb3rdxv51EEULoxwdon323rFCFYm+e9Sk
 Ukrs1rYrE+2IQERa/67G1Shnvkip07LcuN/6mMGObw==
X-Google-Smtp-Source: APXvYqyRCcxE5/JHDMK7y8Rs7CXj1wxJ3SX/WwI4wHVUkEXfmNIrUVn4FdFrzzky24sHnlYZuHrfdhcCxPaq9L8v4oo=
X-Received: by 2002:a2e:9217:: with SMTP id k23mr512827ljg.159.1551702585121; 
 Mon, 04 Mar 2019 04:29:45 -0800 (PST)
MIME-Version: 1.0
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <20190301155523.GA1915@Mani-XPS-13-9360>
In-Reply-To: <20190301155523.GA1915@Mani-XPS-13-9360>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Mar 2019 13:29:33 +0100
Message-ID: <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Wen Yang <wen.yang99@zte.com.cn>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 Michal Simek <michal.simek@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, 
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
X-Mailman-Approved-At: Tue, 05 Mar 2019 12:27:30 +1100
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
X-List-Received-Date: Mon, 04 Mar 2019 12:29:52 -0000

On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> Hi Wen,
>
> On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> > The call to of_get_next_child returns a node pointer with refcount
> > incremented thus it must be explicitly decremented after the last
> > usage.
> >
> > Detected by coccinelle with the following warnings:
> > ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 103, but without a corresponding object release within this function.
> > ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 115, but without a corresponding object release within this function.
> > ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 128, but without a corresponding object release within this function.
> >
>
> We have a floating patch for this:
> https://www.spinics.net/lists/arm-kernel/msg694544.html
>
> Andreas: Can you please take a second look at the patchset submitted by Linus
> Walleij and Russel for simplifying the Actions startup code?

Andreas wrote a version of simplifying secondary startup in the
same spirit as Russell's patches, and it's merged and all
is fine I think.

If this patch applied on top of the current upstream code I'd say
just forget about my patch and merge Wen's patch instead.

Yours,
Linus Walleij
