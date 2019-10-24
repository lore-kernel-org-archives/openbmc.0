Return-Path: <davem@davemloft.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zCl403BgzDqQS
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 14:43:20 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::b7e])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6796C14B7A921;
 Wed, 23 Oct 2019 20:43:12 -0700 (PDT)
Date: Wed, 23 Oct 2019 20:43:11 -0700 (PDT)
Message-Id: <20191023.204311.1181447784152558295.davem@davemloft.net>
To: rentao.bupt@gmail.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, olteanv@gmail.com, arun.parameswaran@broadcom.com,
 justinpopo6@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next v10 0/3] net: phy: support 1000Base-X
 auto-negotiation for BCM54616S
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191022183108.14029-1-rentao.bupt@gmail.com>
References: <20191022183108.14029-1-rentao.bupt@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 23 Oct 2019 20:43:12 -0700 (PDT)
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
X-List-Received-Date: Thu, 24 Oct 2019 03:43:28 -0000

From: rentao.bupt@gmail.com
Date: Tue, 22 Oct 2019 11:31:05 -0700

> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This patch series aims at supporting auto negotiation when BCM54616S is
> running in 1000Base-X mode: without the patch series, BCM54616S PHY driver
> would report incorrect link speed in 1000Base-X mode.
> 
> Patch #1 (of 3) modifies assignment to OR when dealing with dev_flags in
> phy_attach_direct function, so that dev_flags updated in BCM54616S PHY's
> probe callback won't be lost.
> 
> Patch #2 (of 3) adds several genphy_c37_* functions to support clause 37
> 1000Base-X auto-negotiation, and these functions are called in BCM54616S
> PHY driver.
> 
> Patch #3 (of 3) detects BCM54616S PHY's operation mode and calls according
> genphy_c37_* functions to configure auto-negotiation and parse link
> attributes (speed, duplex, and etc.) in 1000Base-X mode.

Series applied to net-next, thank you.
