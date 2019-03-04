Return-Path: <sudeep.holla@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44CjWy59czzDqFt
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 01:46:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61FB1EBD;
 Mon,  4 Mar 2019 06:46:19 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CB503F71D;
 Mon,  4 Mar 2019 06:46:13 -0800 (PST)
Date: Mon, 4 Mar 2019 14:46:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, lorenzo.pieralisi@arm.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgene@kernel.org, krzk@kernel.org,
 linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com,
 afaerber@suse.de, manivannan.sadhasivam@linaro.org,
 dinguyen@kernel.org, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com,
 openbmc@lists.ozlabs.org, xuwei5@hisilicon.com,
 maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com,
 will.deacon@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 fabio.estevam@nxp.com, linux-imx@nxp.com, wang.yi59@zte.com.cn
Subject: Re: [PATCH 12/15] ARM: vexpress: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190304144606.GA7466@e107155-lin>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-12-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551430616-42014-12-git-send-email-wen.yang99@zte.com.cn>
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
X-List-Received-Date: Mon, 04 Mar 2019 14:46:23 -0000

On Fri, Mar 01, 2019 at 04:56:53PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-vexpress/dcscb.c:150:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> ./arch/arm/mach-vexpress/dcscb.c:160:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> ./arch/arm/mach-vexpress/dcscb.c:171:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 145, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

Looks good, assuming you want to take this as a series. Please shout if
you want us to take this.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
