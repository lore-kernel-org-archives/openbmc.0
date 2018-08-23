Return-Path: <davem@davemloft.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
X-Greylist: delayed 361 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Aug 2018 14:45:31 AEST
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wsKl69tzzF2Dd
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 14:45:30 +1000 (AEST)
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net
 [74.93.104.98]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 60492100A2000;
 Wed, 22 Aug 2018 21:39:25 -0700 (PDT)
Date: Wed, 22 Aug 2018 21:39:24 -0700 (PDT)
Message-Id: <20180822.213924.602801295731723249.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net] net/ncsi: Fixup .dumpit message flags and ID check
 in Netlink handler
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180822045744.9267-1-sam@mendozajonas.com>
References: <20180822045744.9267-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 22 Aug 2018 21:39:25 -0700 (PDT)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 04:45:32 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Wed, 22 Aug 2018 14:57:44 +1000

> The ncsi_pkg_info_all_nl() .dumpit handler is missing the NLM_F_MULTI
> flag, causing additional package information after the first to be lost.
> Also fixup a sanity check in ncsi_write_package_info() to reject out of
> range package IDs.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied.
