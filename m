Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBn5p6JS1zDqC6
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 12:21:50 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v3P2L4MC014255;
 Mon, 24 Apr 2017 21:21:11 -0500
Message-ID: <1493086864.25766.266.camel@kernel.crashing.org>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 25 Apr 2017 12:21:04 +1000
In-Reply-To: <20170424181818.2754-5-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 25 Apr 2017 02:21:51 -0000

On Mon, 2017-04-24 at 11:18 -0700, Brendan Higgins wrote:
> +static int __aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
> +                                struct platform_device *pdev)
> +{

Minor nit ... I'm really not fan of those underscores.

We use __ functions in some cases in the kernel for low level
helpers, usually when it's a low level variant of an existing
function or an "unlocked" variant, but I don't think generalizing
it to pretty much everything in the driver is worthwhile here.

If you want to be explicit about locking, I would suggest you
use a comment in front of the function explaining if it
expects to be called with the lock held.

We tend to only do that when *both* functions exist and one is
implemented in term of the other.

Cheers,
Ben.
