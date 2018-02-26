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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqnQq5tMFzF1TJ
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 03:31:41 +1100 (AEDT)
Received: from localhost (67.110.78.66.ptr.us.xo.net [67.110.78.66])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 67845141ECABD;
 Mon, 26 Feb 2018 08:31:37 -0800 (PST)
Date: Mon, 26 Feb 2018 11:31:36 -0500 (EST)
Message-Id: <20180226.113136.1568195044048732904.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next] net/ncsi: Add generic netlink family
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180223041518.20195-1-sam@mendozajonas.com>
References: <20180223041518.20195-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 26 Feb 2018 08:31:37 -0800 (PST)
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
X-List-Received-Date: Mon, 26 Feb 2018 16:31:48 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Fri, 23 Feb 2018 15:15:18 +1100

> + * @NCSI_CMD_SET_INTERFACE: set preferred package and channel combination.
> + *	Requires NCSI_ATTR_IFINDEX and the preferred NCSI_ATTR_PACKAGE_ID and
> + *	optionally the preferred NCSI_ATTR_CHANNEL_ID. If neither IDs are
> + *	specified the setting is cleared.

I think clearing the setting when the required attributes are missing
is dangerous behavior.

It is ambiguous whether the user intended the setting to be cleared,
or was in error and forgot to supply the attribute due to a bug.
