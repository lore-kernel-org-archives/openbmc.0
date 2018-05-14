Return-Path: <joe@perches.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.225; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 522 seconds by postgrey-1.36 at bilbo;
 Tue, 15 May 2018 02:20:55 AEST
Received: from smtprelay.hostedemail.com (smtprelay0225.hostedemail.com
 [216.40.44.225])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40l5Xl0yT8zF3h1;
 Tue, 15 May 2018 02:20:54 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 3390318031DBA;
 Mon, 14 May 2018 16:12:14 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 7A3096128;
 Mon, 14 May 2018 16:12:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:541:599:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:1801:2198:2199:2393:2559:2562:2828:2914:3138:3139:3140:3141:3142:3351:3622:3865:3866:3868:3870:3871:4321:4605:5007:6742:9040:10004:10400:10848:11026:11232:11473:11658:11914:12438:12740:12760:12895:13069:13161:13229:13311:13357:13439:14180:14659:21060:21080:21212:21627:30054:30091,
 0,
 RBL:47.151.150.235:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: mark95_2e7653012c449
X-Filterd-Recvd-Size: 2138
Received: from XPS-9350.home (unknown [47.151.150.235])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon, 14 May 2018 16:11:59 +0000 (UTC)
Message-ID: <c83bb5ddf36b419c4c01e20384c7b532c9a48cd4.camel@perches.com>
Subject: Re: [PATCH 00/21] i2c: make use of i2c_8bit_addr_from_msg
From: Joe Perches <joe@perches.com>
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Brendan Higgins <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Guenter Roeck <linux@roeck-us.net>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Peter Korsgaard <jacmet@sunsite.dk>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org,  linux-soc@vger.kernel.org
Date: Mon, 14 May 2018 09:11:57 -0700
In-Reply-To: <20180514145330.4857-1-peda@axentia.se>
References: <20180514145330.4857-1-peda@axentia.se>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 15 May 2018 09:10:39 +1000
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
X-List-Received-Date: Mon, 14 May 2018 16:20:55 -0000

On Mon, 2018-05-14 at 16:53 +0200, Peter Rosin wrote:
> Hi!
> 
> The nice little inline i2c_8bit_addr_from_msg is not getting
> enough use. This series improves the situation and drops a
> bunch of lines in the process.

Perhaps the inline should test for I2C_M_REV_DIR_ADDR
as there is at least one use like

-               addr = msg->addr << 1;
-               if (flags & I2C_M_RD)
-                       addr |= 1;
+               addr = i2c_8bit_addr_from_msg(msg);
                if (flags & I2C_M_REV_DIR_ADDR)
                        addr ^= 1;

which look odd

Do any of these changes now no longer need
the temporary flags variable?
