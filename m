Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vx7DF5PqVzDqH7
 for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2017 07:10:05 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v32L9i6T027305;
 Sun, 2 Apr 2017 16:09:45 -0500
Message-ID: <1491167383.26047.15.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drivers/serial: Add driver for Aspeed virtual UART
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>
Date: Mon, 03 Apr 2017 07:09:43 +1000
In-Reply-To: <CAHp75VfmbHrPFXO3UFmSciCnVuoB+5vFxy7iOnwVS5YBSPO3+Q@mail.gmail.com>
References: <20170328054458.29341-1-joel@jms.id.au>
 <20170328054458.29341-3-joel@jms.id.au>
 <CAHp75VfmbHrPFXO3UFmSciCnVuoB+5vFxy7iOnwVS5YBSPO3+Q@mail.gmail.com>
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
X-List-Received-Date: Sun, 02 Apr 2017 21:10:06 -0000

On Sun, 2017-04-02 at 16:07 +0300, Andy Shevchenko wrote:
> > +       port.port.irqflags = IRQF_SHARED;
> 
> This is set by core. You already supplied correct flag for that
> below.

Are you sure ? Where ?

We had a bug the other day because that wasn't being set...

Cheers,
Ben.
