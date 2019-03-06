Return-Path: <horms@verge.net.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=verge.net.au
 (client-ip=202.4.237.240; helo=kirsty.vergenet.net;
 envelope-from=horms@verge.net.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=verge.net.au header.i=@verge.net.au header.b="N/QFnX41";
 dkim-atps=neutral
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Dv4y4Q0jzDq8W
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 00:00:33 +1100 (AEDT)
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
 by kirsty.vergenet.net (Postfix) with ESMTPA id 80BE325B7D6;
 Thu,  7 Mar 2019 00:00:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
 t=1551877231; bh=hZU842crZ/VahV9rk7Fzx8ogXea/xJyxOnqRvPQS8m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/QFnX41QGxrwjqhBxM1IbhtDy7xrB4m9i1wUiLccvN6rl2Cwe+QiO4vVJix/TV11
 kt2RR625S/pAI7q5MqFNTF9wVV8Xmpns0TZtladIbG9V1oJEBZB1zxd3ZyxWPxu0JS
 v8hH3Tg1U8LUo9hl/M+EgIolSQqm3sVw6DgBFJWs=
Received: by reginn.horms.nl (Postfix, from userid 7100)
 id 0977A94030D; Wed,  6 Mar 2019 14:00:29 +0100 (CET)
Date: Wed, 6 Mar 2019 14:00:29 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Wen Yang <wen.yang99@zte.com.cn>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wei Xu <xuwei5@hisilicon.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "wang.yi59@zte.com.cn" <wang.yi59@zte.com.cn>
Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190306130029.nysvl7fmcjcmhqnw@verge.net.au>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
 <CAMuHMdWrY0UNhCA7a8oHVfdVNXaB=15qFuWqvuU9OZpf7-ecmg@mail.gmail.com>
 <20190304102423.bipib6frc6ma2ltv@verge.net.au>
 <TY1PR01MB17701D48CA7E650507C2E010C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17701D48CA7E650507C2E010C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 07 Mar 2019 12:31:41 +1100
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
X-List-Received-Date: Wed, 06 Mar 2019 13:00:37 -0000

On Mon, Mar 04, 2019 at 10:55:27AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Simon Horman
> > Sent: 04 March 2019 10:24
> > Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by addingmissing of_node_put
> > 
> > On Fri, Mar 01, 2019 at 10:51:27AM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
> > > > The call to of_get_next_child returns a node pointer with refcount
> > > > incremented thus it must be explicitly decremented after the last
> > > > usage.
> > > >
> > > > Detected by coccinelle with the following warnings:
> > > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> > incremented on line 66, but without a corresponding object release within this function.
> > > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> > incremented on line 66, but without a corresponding object release within this function.
> > > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount
> > incremented on line 66, but without a corresponding object release within this function.
> > > >
> > > > Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied for v5.2.
> 
> I am sorry for commenting on this just a moment after you took the patch, I guess there is a space missing in the title s/addingmissing/adding missing/ ? Is that still fixable?

Thanks for noticing, fixed.
