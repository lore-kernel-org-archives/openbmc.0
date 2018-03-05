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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zw42d0vwTzF0nc
 for <openbmc@lists.ozlabs.org>; Tue,  6 Mar 2018 02:44:06 +1100 (AEDT)
Received: from localhost (67.110.78.66.ptr.us.xo.net [67.110.78.66])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2111A122CFB95;
 Mon,  5 Mar 2018 07:44:02 -0800 (PST)
Date: Mon, 05 Mar 2018 10:44:01 -0500 (EST)
Message-Id: <20180305.104401.786259807319660242.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next v2] net/ncsi: Add generic netlink family
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180305003905.27227-1-sam@mendozajonas.com>
References: <20180305003905.27227-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 05 Mar 2018 07:44:02 -0800 (PST)
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
X-List-Received-Date: Mon, 05 Mar 2018 15:44:09 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon,  5 Mar 2018 11:39:05 +1100

> Add a generic netlink family for NCSI. This supports three commands;
> NCSI_CMD_PKG_INFO which returns information on packages and their
> associated channels, NCSI_CMD_SET_INTERFACE which allows a specific
> package or package/channel combination to be set as the preferred
> choice, and NCSI_CMD_CLEAR_INTERFACE which clears any preferred setting.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> v2: Add a separate NCSI_CMD_CLEAR_INTERFACE command instead of allowing
> missing attributes in NCSI_CMD_SET_INTERFACE.

Applied, thank you.
