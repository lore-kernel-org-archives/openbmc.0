Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgvJX1C9ZzDql5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 21:27:07 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u61BQu50009962;
 Fri, 1 Jul 2016 06:26:58 -0500
Message-ID: <1467372416.7422.42.camel@kernel.crashing.org>
Subject: Re: [PATCH 08/10] net/farady: Support NCSI mode
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 01 Jul 2016 21:26:56 +1000
In-Reply-To: <CACPK8Xeh12tWRvoQ=b32qj+78PPOMEO9+rEvL-X03ZrK_WVh-Q@mail.gmail.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-9-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xeh12tWRvoQ=b32qj+78PPOMEO9+rEvL-X03ZrK_WVh-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.3 (3.20.3-1.fc24.1) 
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
X-List-Received-Date: Fri, 01 Jul 2016 11:27:08 -0000

On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:
> We get this message whenever the device is brought up or down. This
> includes when the host reboots, filling up the bmc's kernel logs.
> 
> However, when we had the timer race it was the only way to know what
> was going on. Can we detect when it's the host bringing the device
> down opposed to an "ifconfig up" failing to bring it up?

What would be nice would be if we could mirror that into the "carrier"
state of the interface (which normally corresponds to the PHY link
state).

The problem however is that when the carrier is off, the network stack
will ditch packets, which doen't work for us since we still need to
talk NSCI ...

I'm thinking we should create some netdev flags so that the generic
link monitor stops bringing it down in that case. That way we can
set the carrier and eixsting stuff that knows how to read and interpret
it will work.

Cheers,
Ben.
