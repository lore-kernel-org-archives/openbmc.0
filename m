Return-Path: <ukl@pengutronix.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=pengutronix.de
 (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de;
 envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 1065 seconds by postgrey-1.36 at bilbo;
 Wed, 16 May 2018 17:52:06 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40m68k4d38zDqwW
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 17:52:05 +1000 (AEST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1fIqwc-000898-Qy; Wed, 16 May 2018 09:33:54 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1fIqwZ-0007cz-H0; Wed, 16 May 2018 09:33:51 +0200
Date: Wed, 16 May 2018 09:33:51 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, David Brown <david.brown@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Joel Stanley <joel@jms.id.au>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andy Gross <andy.gross@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: busses: make use of i2c_8bit_addr_from_msg
Message-ID: <20180516073351.y5avitvaj5ouu6m3@pengutronix.de>
References: <20180516071647.29277-1-peda@axentia.se>
 <20180516071647.29277-3-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180516071647.29277-3-peda@axentia.se>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Mailman-Approved-At: Wed, 16 May 2018 23:49:14 +1000
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
X-List-Received-Date: Wed, 16 May 2018 07:52:07 -0000

Hello Peter,

On Wed, May 16, 2018 at 09:16:47AM +0200, Peter Rosin wrote:
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de> [emf32 and imx]

s/emf/efm/

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
