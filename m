Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtRTt10J7zDqHJ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 23:12:33 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2TCBjAl032359;
 Wed, 29 Mar 2017 07:11:47 -0500
Message-ID: <1490789505.3177.184.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed
 I2C Interrupt Controller
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, Marc
 Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>, Vladimir
 Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 29 Mar 2017 23:11:45 +1100
In-Reply-To: <CAFd5g47Pij6TxkmS6akWoAL0FZ2WLh+FWUrr099RiabWn+pneQ@mail.gmail.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-2-brendanhiggins@google.com>
 <1490690980.3177.108.camel@kernel.crashing.org>
 <CAFd5g47Pij6TxkmS6akWoAL0FZ2WLh+FWUrr099RiabWn+pneQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Mar 2017 12:12:34 -0000

On Wed, 2017-03-29 at 03:34 -0700, Brendan Higgins wrote:
> I think I addressed this on the other email with the actual driver.
> Anyway, I thought that this is pretty much the dummy irqchip code is
> for; I have seen some other drivers do the same thing. It is true
> that
> this is a really basic "interrupt controller;" it cannot mask on its
> own, etc; nevertheless, I think you will pretty much end up with the
> same code for an "I2C controller;" it just won't use an irq_domain.

Don't worry too much about this. As I think I mention it's not a huge
deal at this stage, I just wanted to make sure you were aware of the
compromise(s) involved.

Regarding the other comment about the "fast mode", my main worry here
is that somebody might come up with a 2Mhz capable device, we'll hit
your 1Mhz test, enable fast mode, and shoot it with 3.4Mhz which it
might not be happy at all about...

I think the cut-off for switching to the "fast" mode should basically
be the fast speed mode frequency (which isn't clear from the spec but
seems to be 3.4Mhz). Otherwise people will end up with higher speeds
than what they asked for and that's bad.

Cheers,
Ben.
