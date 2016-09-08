Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sV92k2ytPzDsN0
 for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2016 16:11:42 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u886BY8i020206;
 Thu, 8 Sep 2016 01:11:35 -0500
Message-ID: <1473315093.8689.90.camel@kernel.crashing.org>
Subject: Re: Celebration in the streets (aka pinmux is merged)
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 08 Sep 2016 16:11:33 +1000
In-Reply-To: <CACPK8XeJpNJHaYYEja_BQoh5mvBnFPyaQTB5btDjCj3tP5boYA@mail.gmail.com>
References: <CACPK8XeJpNJHaYYEja_BQoh5mvBnFPyaQTB5btDjCj3tP5boYA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 06:11:43 -0000

On Thu, 2016-09-08 at 14:54 +0930, Joel Stanley wrote:
> Congratulations Andrew and everyone who has helped with design,
> testing and review.
> 
> This is a major component of the Aspeed SoC support that is now
> complete. It allows us to configure the pads (pins) of the SoC using
> the device tree and/or from other drivers, instead of looking up
> registers in the datasheet and sticking values all over the place.
> 
> The driver is in the subsystem tree and on it's way to appear in
> Linux 4.9.

Congratulations guys ! This was probably the single most challenging
kernel component of the stack !

Beers on me next time you're in town :-)

Ben.

> Cheers,
> 
> Joel
> 
> 
> ---------- Forwarded message ----------
> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Thu, Sep 8, 2016 at 12:20 AM
> Subject: Re: [PATCH v3 5/8] pinctrl: Add core support for Aspeed SoCs
> To: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>, Alexandre Courbot
> <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring
> <robh+dt@kernel.org>, Benjamin Herrenschmidt
> <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
> "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
> "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
> "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
> 
> 
> On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
> 
> > 
> > The Aspeed SoCs typically provide more than 200 pins for GPIO and
> > other
> > functions. The signal enabled on a pin is determined on a priority
> > basis, where a given pin can provide a number of different signal
> > types.
> > 
> > In addition to the priority levels, the Aspeed pin controllers
> > describe
> > the signal active on a pin by compound logical expressions
> > involving
> > multiple operators, registers and bits. Some difficulty arises as a
> > pin's function bit masks for each priority level are frequently not
> > the
> > same (i.e. we cannot just flip a bit to change from a high to low
> > priority signal), or even in the same register(s). Some
> > configuration
> > bits affect multiple pins, while in other cases the signals for a
> > bus
> > must each be enabled individually.
> > 
> > Together, these features give rise to some complexity in the
> > implementation. A more complete description of the complexities is
> > provided in the associated header file.
> > 
> > The patch doesn't implement pinctrl/pinmux/pinconf for any
> > particular
> > Aspeed SoC, rather it adds the framework for defining pinmux
> > configurations.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Patch applied! It's not getting better than this through iteration,
> it is better
> to get the system up and develop inside the mainline tree from now
> on.
