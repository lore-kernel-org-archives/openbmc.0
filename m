Return-Path: <shawnguo@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kHq1wItZ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CTMq6FP1zDqG0
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 16:38:31 +1100 (AEDT)
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7747620815;
 Mon,  4 Mar 2019 05:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551677908;
 bh=g7AHdyOzT/zu/ZiJT1tf4ulU/osU03BVGW6r8HW1WMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kHq1wItZ2IcNUbI2+Dn4y51A2o+v5TX84QIIskJyEnT/EWfRNd4KLq7LI4TcVtDWI
 IsBAr0tJbLL7rb14rPi2pO6RgaznJpRt5qBaFX3makMfC09M8een7JdjM1ZIj8K2n5
 2hv873k7oaLKvUfjhF1cRFQYINuVJgUqoKWKsRdk=
Date: Mon, 4 Mar 2019 13:37:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
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
 linux-renesas-soc@vger.kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com,
 wang.yi59@zte.com.cn, Fabio Estevam <festevam@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 05/15] ARM: imx51: fix a leaked reference by
 addingmissing of_node_put
Message-ID: <20190304053714.GZ26041@dragon>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-5-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551430616-42014-5-git-send-email-wen.yang99@zte.com.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 04 Mar 2019 17:06:49 +1100
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
X-List-Received-Date: Mon, 04 Mar 2019 05:38:33 -0000

On Fri, Mar 01, 2019 at 04:56:46PM +0800, Wen Yang wrote:
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-imx/mach-imx51.c:64:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 57, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>

Applied, thanks.
