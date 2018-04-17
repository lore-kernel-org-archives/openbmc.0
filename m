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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QXqc6p4RzF1v3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 03:51:20 +1000 (AEST)
Received: from localhost (67.110.78.66.ptr.us.xo.net [67.110.78.66])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B8B3D14356367;
 Tue, 17 Apr 2018 10:51:16 -0700 (PDT)
Date: Tue, 17 Apr 2018 13:51:15 -0400 (EDT)
Message-Id: <20180417.135115.342004798174126821.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH RESEND net-next] net/ncsi: Refactor MAC, VLAN filters
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180417042323.27941-1-sam@mendozajonas.com>
References: <20180417042323.27941-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 17 Apr 2018 10:51:17 -0700 (PDT)
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
X-List-Received-Date: Tue, 17 Apr 2018 17:51:25 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 17 Apr 2018 14:23:23 +1000

> The NCSI driver defines a generic ncsi_channel_filter struct that can be
> used to store arbitrarily formatted filters, and several generic methods
> of accessing data stored in such a filter.
> However in both the driver and as defined in the NCSI specification
> there are only two actual filters: VLAN ID filters and MAC address
> filters. The splitting of the MAC filter into unicast, multicast, and
> mixed is also technically not necessary as these are stored in the same
> location in hardware.
> 
> To save complexity, particularly in the set up and accessing of these
> generic filters, remove them in favour of two specific structs. These
> can be acted on directly and do not need several generic helper
> functions to use.
> 
> This also fixes a memory error found by KASAN on ARM32 (which is not
> upstream yet), where response handlers accessing a filter's data field
> could write past allocated memory.
 ...
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied to net-next, thank you.
