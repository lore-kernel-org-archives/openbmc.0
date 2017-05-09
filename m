Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMVyj157BzDqJ8
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 17:15:56 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v497Ew7l006609;
 Tue, 9 May 2017 02:14:59 -0500
Message-ID: <1494314107.25766.442.camel@kernel.crashing.org>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, Wolfram Sang
 <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper
 <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley
 <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton
 <mouse@mayc.ru>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 09 May 2017 09:15:07 +0200
In-Reply-To: <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
 <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 09 May 2017 07:15:57 -0000

On Mon, 2017-05-08 at 16:28 -0700, Brendan Higgins wrote:
> 
> I am curious what everyone thinks about this. It seemed that, earlier
> on, people did not like me disabling multi-master mode, but I think
> that it would make bus recovery not work as well. Given that, I think
> it makes the most sense to provide a device tree option either to
> enable multi-master support or disable it. Thoughts?

I think we probably want to keep it enabled yes. Another reason is that
SMBus notifications are in effect a type of multi-master (well slave
really), and we should really add support for them even when the slave
is not enabled.

We are hitting some PMbus devices that apparently can't be prevented
from sending those and that's causing issues.

Cheers,
Ben.
