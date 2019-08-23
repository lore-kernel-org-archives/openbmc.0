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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F5063fqmzDqfY
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 12:27:33 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EEF17153ABADF;
 Thu, 22 Aug 2019 19:27:24 -0700 (PDT)
Date: Thu, 22 Aug 2019 19:27:24 -0700 (PDT)
Message-Id: <20190822.192724.1052619848261339045.davem@davemloft.net>
To: Justin.Lee1@Dell.com
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, sam@mendozajonas.com
Subject: Re: [PATCH] net/ncsi: Fix the payload copying for the request
 coming from Netlink
From: David Miller <davem@davemloft.net>
In-Reply-To: <a94e5fa397a64ae3a676ec11ea09aaba@AUSX13MPS302.AMER.DELL.COM>
References: <a94e5fa397a64ae3a676ec11ea09aaba@AUSX13MPS302.AMER.DELL.COM>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 22 Aug 2019 19:27:25 -0700 (PDT)
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
X-List-Received-Date: Fri, 23 Aug 2019 02:27:34 -0000

From: <Justin.Lee1@Dell.com>
Date: Wed, 21 Aug 2019 21:24:52 +0000

> The request coming from Netlink should use the OEM generic handler.
> 
> The standard command handler expects payload in bytes/words/dwords
> but the actual payload is stored in data if the request is coming from Netlink.
> 
> Signed-off-by: Justin Lee <justin.lee1@dell.com>

Applied, thank you.
