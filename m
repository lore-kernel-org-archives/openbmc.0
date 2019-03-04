Return-Path: <manivannan.sadhasivam@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=manivannan.sadhasivam@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="fJ7xw8Jd"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CjZv2jbhzDqFt
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 01:48:52 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id l11so3252057pgq.10
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 06:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5M7OwyO6HgUrUJtcdI80kaZEhRjVtvCmXtUf3SxvANc=;
 b=fJ7xw8JdMM4dAArAke476bB1uuQCPCkRpvrEuv694j/65AqpQw4dwu0rT0PLE8CMUq
 8ZZdQa1JhYV/PFADTEKW8EQf740m7UiBQafFMPw0f+JWB6gkNQT1sRny56yLgtwfbyam
 BOXTPFokqTqcXuP1LyUJ3aB7CeOLkIh9sxSpzOQTkgls61EHY1hX56biugQNpS8QZSxd
 mKv1oHHQCqBB5tpWWqtGljY/YWIdAs6CEidAP37ohcKFD7YG14I6eQ4YCA53qJzIxWko
 9MDgc2PyBF6FA1jwGT8IxR4EuM/jf6gZCESscyiP3T75KlE9ZaP4HRq+cF6o6IYWVkyo
 Zc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5M7OwyO6HgUrUJtcdI80kaZEhRjVtvCmXtUf3SxvANc=;
 b=UcLq78uSlBRWsCG2ZfYMuYrbxhKR0S9gg6zpffW2up6i3waHVl7ZICHxvu92opy4P7
 Bl4sv1Ipc0mguIJrNiAsYTyHHLjLctnY114If1vOKyO13K0ltawMmZHbOJxlS8ipJRXX
 rEXbJaf13ixNu1rhF43wx/1B++VCxhuRhHc7jk5me4eEJ1pbuttGkV+iiaBW4UMgAwCW
 kqr26FbWwfuagAp1V5pdgxCJIhoB4g3+THoqMbi7oXpfVa5gjHG4r01I+Gf1Bqz8u0Fm
 uLM4zS44qSatQFuCA9VYSBBWsTCOF0VCQaLgGGp4PwjlXAt26TezmvwVPLlN8iiKdWsC
 n9LA==
X-Gm-Message-State: APjAAAWISkAl+Hjb7QhZTsyJeMIHP0fd6+TtAW3iNrfXkScKq1Uw7FeA
 XByF/RxOy8geKrajF50ZfyRg
X-Google-Smtp-Source: APXvYqzFd3N9m0cOwhgb2geq+smMS20gI7hq9k0RX5n0UIhO8QQjfez/wbEryv8i0R0DnsQNDgpong==
X-Received: by 2002:a63:f07:: with SMTP id e7mr18909505pgl.173.1551710926837; 
 Mon, 04 Mar 2019 06:48:46 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:88c:f338:bc65:e0ee:7524:9950])
 by smtp.gmail.com with ESMTPSA id 63sm10441906pfy.110.2019.03.04.06.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Mar 2019 06:48:46 -0800 (PST)
Date: Mon, 4 Mar 2019 20:18:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wen Yang <wen.yang99@zte.com.cn>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xu Wei <xuwei5@hisilicon.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Simon Horman <horms@verge.net.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, wang.yi59@zte.com.cn
Subject: Re: [PATCH 01/15] ARM: actions: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190304144829.GA5265@Mani-XPS-13-9360>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <20190301155523.GA1915@Mani-XPS-13-9360>
 <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb=E9_rm4_7DQV3dS5uOs1gozxEwN9MtWr0tTwmjcYe=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Mon, 04 Mar 2019 14:48:58 -0000

Hi Linus,

On Mon, Mar 04, 2019 at 01:29:33PM +0100, Linus Walleij wrote:
> On Fri, Mar 1, 2019 at 4:55 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > Hi Wen,
> >
> > On Fri, Mar 01, 2019 at 04:56:42PM +0800, Wen Yang wrote:
> > > The call to of_get_next_child returns a node pointer with refcount
> > > incremented thus it must be explicitly decremented after the last
> > > usage.
> > >
> > > Detected by coccinelle with the following warnings:
> > > ./arch/arm/mach-actions/platsmp.c:112:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 103, but without a corresponding object release within this function.
> > > ./arch/arm/mach-actions/platsmp.c:124:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 115, but without a corresponding object release within this function.
> > > ./arch/arm/mach-actions/platsmp.c:137:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 128, but without a corresponding object release within this function.
> > >
> >
> > We have a floating patch for this:
> > https://www.spinics.net/lists/arm-kernel/msg694544.html
> >
> > Andreas: Can you please take a second look at the patchset submitted by Linus
> > Walleij and Russel for simplifying the Actions startup code?
> 
> Andreas wrote a version of simplifying secondary startup in the
> same spirit as Russell's patches, and it's merged and all
> is fine I think.
> 

Oops. I think I missed that! Can you please point me to that patch? And how it
got merged? I did the PR for actions stuff this time and haven't included any
mach-actions patches.

Thanks,
Mani

> If this patch applied on top of the current upstream code I'd say
> just forget about my patch and merge Wen's patch instead.
> 
> Yours,
> Linus Walleij
