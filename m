Return-Path: <davem@davemloft.net>
Received: from shards.monkeyblade.net (unknown [184.105.139.130])
 by lists.ozlabs.org (Postfix) with ESMTP id 3t42rN5Kn2zDt4V
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 08:16:20 +1100 (AEDT)
Received: from localhost (cpe-66-108-81-97.nyc.res.rr.com [66.108.81.97])
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5D169101518E5;
 Wed, 26 Oct 2016 14:16:08 -0700 (PDT)
Date: Wed, 26 Oct 2016 17:16:05 -0400 (EDT)
Message-Id: <20161026.171605.2216738980188763095.davem@davemloft.net>
To: xow@google.com
Cc: f.fainelli@gmail.com, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH 0/2] Broadcom BCM54612E support
From: David Miller <davem@davemloft.net>
In-Reply-To: <1477070413-92621-1-git-send-email-xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
X-Mailer: Mew version 6.7 on Emacs 25.1 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 26 Oct 2016 14:16:09 -0700 (PDT)
X-Mailman-Approved-At: Thu, 27 Oct 2016 10:12:34 +1100
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
X-List-Received-Date: Wed, 26 Oct 2016 21:16:20 -0000

From: Xo Wang <xow@google.com>
Date: Fri, 21 Oct 2016 10:20:11 -0700

> This series is based on tip of torvalds/master.
> 
> The first patch adds register definitions from Broadcom docs.
> 
> The second patch adds the BCM54612E PHY ID, flags, and device-specific
> RGMII internal delay initialization.
> 
> I tested on a custom board with an Aspeed AST2500 SOC with its second
> MAC connected to this PHY.

Series applied to net-next, thanks.
