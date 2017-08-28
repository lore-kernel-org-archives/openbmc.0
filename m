Return-Path: <davem@davemloft.net>
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh7mX5lK8zDqG4
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 09:50:04 +1000 (AEST)
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net
 [74.93.104.98]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4942C1236535C;
 Mon, 28 Aug 2017 16:50:02 -0700 (PDT)
Date: Mon, 28 Aug 2017 16:50:01 -0700 (PDT)
Message-Id: <20170828.165001.1442421762159241248.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org,
 gwshan@linux.vnet.ibm.com, ratagupt@in.ibm.com
Subject: Re: [PATCH net-next v3 0/3] NCSI VLAN Filtering Support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170828061843.24349-1-sam@mendozajonas.com>
References: <20170828061843.24349-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.2 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 28 Aug 2017 16:50:02 -0700 (PDT)
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
X-List-Received-Date: Mon, 28 Aug 2017 23:50:05 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon, 28 Aug 2017 16:18:40 +1000

> This series (mainly patch 2) adds VLAN filtering to the NCSI implementation.
> A fair amount of code already exists in the NCSI stack for VLAN filtering but
> none of it is actually hooked up. This goes the final mile and fixes a few
> bugs in the existing code found along the way (patch 1).
> 
> Patch 3 adds the appropriate flag and callbacks to the ftgmac100 driver to
> enable filtering as it's a large consumer of NCSI (and what I've been
> testing on).
> 
> v3:	- Add comment describing change to ncsi_find_filter()
> 	- Catch NULL in clear_one_vid() from ncsi_get_filter()
> 	- Simplify state changes when kicking updated channel

Series applied.
