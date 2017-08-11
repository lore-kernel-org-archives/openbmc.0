Return-Path: <davem@davemloft.net>
X-Greylist: delayed 545 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Aug 2017 07:57:43 AEST
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTf4l2kMXzDr51
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 07:57:42 +1000 (AEST)
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net
 [74.93.104.98]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 277AF124C291E;
 Fri, 11 Aug 2017 14:48:24 -0700 (PDT)
Date: Fri, 11 Aug 2017 14:48:23 -0700 (PDT)
Message-Id: <20170811.144823.1928647996484981190.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org,
 gwshan@linux.vnet.ibm.com, ratagupt@in.ibm.com
Subject: Re: [PATCH 0/3] NCSI VLAN Filtering Support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170811061648.19661-1-sam@mendozajonas.com>
References: <20170811061648.19661-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.2 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 11 Aug 2017 14:48:24 -0700 (PDT)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 21:57:43 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Fri, 11 Aug 2017 16:16:45 +1000

> This series (mainly patch 3) adds VLAN filtering to the NCSI implementation.
> A fair amount of code already exists in the NCSI stack for VLAN filtering but
> none of it is actually hooked up. This goes the final mile and fixes a few
> bugs in the existing code found along the way (patch 2).
> 
> Patch 1 adds the appropriate flag to the ftgmac100 driver to enable filtering
> as it's a large consumer of NCSI (and what I've been testing on).

This patch series does not apply cleanly to net-next, you need to respin.
