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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bkv83bCSzF3KQ
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 09:56:51 +1100 (AEDT)
Received: from localhost (c-67-183-62-245.hsd1.wa.comcast.net [67.183.62.245])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0094B140A9E0D;
 Thu, 18 Oct 2018 15:56:47 -0700 (PDT)
Date: Thu, 18 Oct 2018 15:56:47 -0700 (PDT)
Message-Id: <20181018.155647.1045018243241594303.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/6] net/ncsi: Allow enabling multiple
 packages & channels
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181018035917.19413-1-sam@mendozajonas.com>
References: <20181018035917.19413-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 18 Oct 2018 15:56:48 -0700 (PDT)
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
X-List-Received-Date: Thu, 18 Oct 2018 22:56:52 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Thu, 18 Oct 2018 14:59:11 +1100

> This series extends the NCSI driver to configure multiple packages
> and/or channels simultaneously. Since the RFC series this includes a few
> extra changes to fix areas in the driver that either made this harder or
> were roadblocks due to deviations from the NCSI specification.
> 
> Patches 1 & 2 fix two issues where the driver made assumptions about the
> capabilities of the NCSI topology.
> Patches 3 & 4 change some internal semantics slightly to make multi-mode
> easier.
> Patch 5 introduces a cleaner way of reconfiguring the NCSI configuration
> and keeping track of channel states.
> Patch 6 implements the main multi-package/multi-channel configuration,
> configured via the Netlink interface.
> 
> Readers who have an interesting NCSI setup - especially multi-package
> with HWA - please test! I think I've covered all permutations but I
> don't have infinite hardware to test on.

This doesn't apply cleanly to net-next.  Does it depend upon changes
applied elsewhere?  You must always make that explicit.

Also, please explain this locking in ncsi_reset_dev():

+	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			spin_lock_irqsave(&nc->lock, flags);
+			enabled = nc->monitor.enabled;
+			state = nc->state;
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			if (enabled)
+				ncsi_stop_channel_monitor(nc);
+			if (state == NCSI_CHANNEL_ACTIVE) {
+				active = nc;
+				break;
+			}

Is that really protecting anything?

Right after you drop np->lock those two values can change, the state
of the 'nc' can change such that it isn't NCSI_CHANNEL_ACTIVE anymore
etc.

At best this locking makes sure thatn enabled and state are consistent
with respect to eachother, only.  It doesn't guarantee anything about
the stability of the state of the object at all, and it can change
right from under you.
