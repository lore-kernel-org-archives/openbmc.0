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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42yLYQ4hrtzF3Ws
 for <openbmc@lists.ozlabs.org>; Sun, 18 Nov 2018 16:46:01 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B5E29148BBD60;
 Sat, 17 Nov 2018 21:10:09 -0800 (PST)
Date: Sat, 17 Nov 2018 21:10:06 -0800 (PST)
Message-Id: <20181117.211006.376669879094627607.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next v4 0/6] net/ncsi: Allow enabling multiple
 packages & channels
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181116045159.4980-1-sam@mendozajonas.com>
References: <20181116045159.4980-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 17 Nov 2018 21:10:09 -0800 (PST)
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
X-List-Received-Date: Sun, 18 Nov 2018 05:46:03 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Fri, 16 Nov 2018 15:51:53 +1100

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
> 
> Changes in v2:
> - Updated use of the channel lock in ncsi_reset_dev(), making the
> channel invisible and leaving the monitor check to
> ncsi_stop_channel_monitor().
> - Fixed ncsi_channel_is_tx() to consider the state of channels in other
> packages.
> Changes in v3:
> - Fixed bisectability bug in patch 1
> - Consider channels on all packages in a few places when multi-package
> is enabled.
> - Avoid doubling up reset operations, and check the current driver state
> before reset to let any running operations complete.
> - Reorganise the LSC handler slightly to avoid enabling Tx twice.
> Changes in v4:
> - Fix failover in the single-channel case
> - Better handle ncsi_reset_dev() entry during a current config/suspend
> operation.

Series applied.
