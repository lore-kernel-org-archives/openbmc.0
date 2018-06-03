Return-Path: <davem@davemloft.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=184.105.139.130; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [184.105.139.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40zLQ95qkkzF1LK
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jun 2018 00:42:40 +1000 (AEST)
Received: from localhost (unknown [96.70.232.49])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2E063100083F3;
 Sun,  3 Jun 2018 07:42:37 -0700 (PDT)
Date: Sun, 03 Jun 2018 10:42:36 -0400 (EDT)
Message-Id: <20180603.104236.1164095896276916209.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next] net/ncsi: Avoid GFP_KERNEL in response handler
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180531070254.28878-1-sam@mendozajonas.com>
References: <20180531070254.28878-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 03 Jun 2018 07:42:37 -0700 (PDT)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jun 2018 14:42:42 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Thu, 31 May 2018 17:02:54 +1000

> ncsi_rsp_handler_gc() allocates the filter arrays using GFP_KERNEL in
> softirq context, causing the below backtrace. This allocation is only a
> few dozen bytes during probing so allocate with GFP_ATOMIC instead.
 ...
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied with Fixes: tag added, thanks.
