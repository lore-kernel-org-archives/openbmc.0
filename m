Return-Path: <davem@davemloft.net>
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhvTG2YPVzDqGG
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 15:39:25 +1000 (AEST)
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net
 [74.93.104.98]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 031591214F4D6;
 Tue, 29 Aug 2017 22:39:22 -0700 (PDT)
Date: Tue, 29 Aug 2017 22:39:20 -0700 (PDT)
Message-Id: <20170829.223920.1470997869471896894.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org,
 gwshan@linux.vnet.ibm.com, ratagupt@in.ibm.com
Subject: Re: [PATCH net-next v3 0/3] NCSI VLAN Filtering Support
From: David Miller <davem@davemloft.net>
In-Reply-To: <1504067841.1361.11.camel@mendozajonas.com>
References: <20170828061843.24349-1-sam@mendozajonas.com>
 <20170828.165001.1442421762159241248.davem@davemloft.net>
 <1504067841.1361.11.camel@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.2 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 29 Aug 2017 22:39:23 -0700 (PDT)
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
X-List-Received-Date: Wed, 30 Aug 2017 05:39:30 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Wed, 30 Aug 2017 14:37:21 +1000

> On Mon, 2017-08-28 at 16:50 -0700, David Miller wrote:
>> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
>> Date: Mon, 28 Aug 2017 16:18:40 +1000
>> 
>> > This series (mainly patch 2) adds VLAN filtering to the NCSI implementation.
>> > A fair amount of code already exists in the NCSI stack for VLAN filtering but
>> > none of it is actually hooked up. This goes the final mile and fixes a few
>> > bugs in the existing code found along the way (patch 1).
>> > 
>> > Patch 3 adds the appropriate flag and callbacks to the ftgmac100 driver to
>> > enable filtering as it's a large consumer of NCSI (and what I've been
>> > testing on).
>> > 
>> > v3:   - Add comment describing change to ncsi_find_filter()
>> >       - Catch NULL in clear_one_vid() from ncsi_get_filter()
>> >       - Simplify state changes when kicking updated channel
>> 
>> Series applied.
> 
> Thanks David,
> 
> The kbuild bot caught a build error where the add/kill callbacks aren't
> defined without CONFIG_NET_NCSI:
> 
>>> ERROR: "ncsi_vlan_rx_kill_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
>>> ERROR: "ncsi_vlan_rx_add_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
> 
> It's a quick fixup to patch 3 as below, would you like me to send it as a v4?

You must submit a formal fixup patch to fix bugs if I've said that I've
already applied your patch.
