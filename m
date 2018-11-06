Return-Path: <davem@davemloft.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qK7V5zJ5zF3DJ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 06:17:41 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::cf9])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 342C71455115D;
 Tue,  6 Nov 2018 11:17:37 -0800 (PST)
Date: Tue, 06 Nov 2018 11:17:36 -0800 (PST)
Message-Id: <20181106.111736.1149054212290410715.davem@davemloft.net>
To: taoren@fb.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net] net: phy: Allow BCM54616S PHY to setup internal
 TX/RX clock delay
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181105223540.1897084-1-taoren@fb.com>
References: <20181105223540.1897084-1-taoren@fb.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 06 Nov 2018 11:17:37 -0800 (PST)
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
X-List-Received-Date: Tue, 06 Nov 2018 19:17:43 -0000

From: Tao Ren <taoren@fb.com>
Date: Mon, 5 Nov 2018 14:35:40 -0800

> This patch allows users to enable/disable internal TX and/or RX clock
> delay for BCM54616S PHYs so as to satisfy RGMII timing specifications.
> 
> On a particular platform, whether TX and/or RX clock delay is required
> depends on how PHY connected to the MAC IP. This requirement can be
> specified through "phy-mode" property in the platform device tree.
> 
> The patch is inspired by commit 733336262b28 ("net: phy: Allow BCM5481x
> PHYs to setup internal TX/RX clock delay").
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

This is fine for 'net', applied, thanks.
