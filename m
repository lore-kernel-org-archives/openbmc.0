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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xdbD1DnjzDrbW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 05:59:35 +1000 (AEST)
Received: from localhost (unknown [144.121.20.163])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 124AE10182065;
 Thu, 31 May 2018 12:59:30 -0700 (PDT)
Date: Thu, 31 May 2018 15:59:30 -0400 (EDT)
Message-Id: <20180531.155930.1197591227145779002.davem@davemloft.net>
To: sam@mendozajonas.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net] net/ncsi: Fix array size in dumpit handler
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180531041004.20172-1-sam@mendozajonas.com>
References: <20180531041004.20172-1-sam@mendozajonas.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 31 May 2018 12:59:31 -0700 (PDT)
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
X-List-Received-Date: Thu, 31 May 2018 19:59:36 -0000

From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Thu, 31 May 2018 14:10:04 +1000

> With CONFIG_CC_STACKPROTECTOR enabled the kernel panics as below when
> parsing a NCSI_CMD_PKG_INFO command:
 ...
> This turns out to be because the attrs array in ncsi_pkg_info_all_nl()
> is initialised to a length of NCSI_ATTR_MAX which is the maximum
> attribute number, not the number of attributes.
> 
> Fixes: 955dc68cb9b2 ("net/ncsi: Add generic netlink family")
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied, thanks.
