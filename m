Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v46gr1hn5zDqNJ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jan 2017 02:09:27 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0JF8de1030211;
 Thu, 19 Jan 2017 09:08:44 -0600
Message-ID: <1484838527.24294.45.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, joel@jms.id.au, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Date: Thu, 19 Jan 2017 09:08:47 -0600
In-Reply-To: <1484784318.4097.2.camel@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-2-cyrilbur@gmail.com>
 <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
 <1484784318.4097.2.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
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
X-List-Received-Date: Thu, 19 Jan 2017 15:09:28 -0000

On Thu, 2017-01-19 at 11:05 +1100, Cyril Bur wrote:
> > > +============
> > > +This represents the mailbox on the Soc.
> > > +
> > > +As the mailbox registers sit on the LPC bus, it makes most sense for
> > > +the device to be within the LPC host node. See
> > > +Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
> > > +information. This does not have to be the case, provided the reg
> > > +property can give the full address of the mbox registers.
> > 
> > This does have to be the case. I'd expect all devices on the LPC bus to 
> > be under a LPC bus node.
> > 
> > Drop the last sentence, and:
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Will do, thanks for the review.

Well well ... on the BMC side it's not actually on the LPC bus ;-)

However it's within the LPC host controller register set, and so as such
can be represented as a child of it.

Cheers,
Ben.
