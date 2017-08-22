Return-Path: <davem@davemloft.net>
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcNkd5k8yzDqZ6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 07:20:18 +1000 (AEST)
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net
 [74.93.104.98]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 31948124C6E2B;
 Tue, 22 Aug 2017 14:20:15 -0700 (PDT)
Date: Tue, 22 Aug 2017 14:20:14 -0700 (PDT)
Message-Id: <20170822.142014.1004582480730502532.davem@davemloft.net>
To: andrew@aj.id.au
Cc: netdev@vger.kernel.org, benh@kernel.crashing.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: Re: [PATCH] net: ftgmac100: Fix oops in probe on failure to find
 associated PHY
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170822063622.21550-1-andrew@aj.id.au>
References: <20170822063622.21550-1-andrew@aj.id.au>
X-Mailer: Mew version 6.7 on Emacs 25.2 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 22 Aug 2017 14:20:15 -0700 (PDT)
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
X-List-Received-Date: Tue, 22 Aug 2017 21:20:27 -0000

From: Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 22 Aug 2017 16:06:22 +0930

> netif_napi_del() should be paired with netif_napi_add(), however no
> such call takes place in ftgmac100_probe(). This triggers a NULL
> pointer dereference if e.g. no PHY is found by the MDIO probe:
 ...
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied, thanks.
