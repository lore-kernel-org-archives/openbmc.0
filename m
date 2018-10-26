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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hWPk3T82zF3Gx;
 Sat, 27 Oct 2018 04:36:25 +1100 (AEDT)
Received: from localhost (c-67-183-62-245.hsd1.wa.comcast.net [67.183.62.245])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B45DA148A4D4B;
 Fri, 26 Oct 2018 10:36:18 -0700 (PDT)
Date: Fri, 26 Oct 2018 10:36:17 -0700 (PDT)
Message-Id: <20181026.103617.373827980255084988.davem@davemloft.net>
To: vijaykhemka@fb.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Justin.Lee1@Dell.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH net-next] net/ncsi: Add NCSI Mellanox OEM command
From: David Miller <davem@davemloft.net>
In-Reply-To: <F0024535-93C3-4470-98A6-F57426587474@fb.com>
References: <20181025220413.2936698-1-vijaykhemka@fb.com>
 <20181025.155335.2132843393553452471.davem@davemloft.net>
 <F0024535-93C3-4470-98A6-F57426587474@fb.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 26 Oct 2018 10:36:19 -0700 (PDT)
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
X-List-Received-Date: Fri, 26 Oct 2018 17:36:26 -0000

From: Vijay Khemka <vijaykhemka@fb.com>
Date: Fri, 26 Oct 2018 17:19:49 +0000

> Do you have any timeline when it is going to open next or how do I
> know.

I always announce net-next openning and closing here on the list.

There is also a web site:

	http://vger.kernel.org/~davem/net-next.html

Thanks.
