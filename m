Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGdnf01dXzDqsV
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 10:06:29 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v6P06IpC024559;
 Mon, 24 Jul 2017 19:06:19 -0500
Message-ID: <1500941178.10674.100.camel@kernel.crashing.org>
Subject: Re: VLAN support on OpenBMC
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Ratan K Gupta <ratagupt@in.ibm.com>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 25 Jul 2017 10:06:18 +1000
In-Reply-To: <CACPK8XeciDGtnTZzw-gfkjJAk311HkDGZZGttZ8MXiBotE8p1g@mail.gmail.com>
References: <OF84667D4E.6E526AD9-ON00258167.005AB6A0-00258167.005BACA5@notes.na.collabserv.com>
 <CACPK8XeciDGtnTZzw-gfkjJAk311HkDGZZGttZ8MXiBotE8p1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.3 (3.24.3-1.fc26) 
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
X-List-Received-Date: Tue, 25 Jul 2017 00:06:30 -0000

On Tue, 2017-07-25 at 09:28 +0930, Joel Stanley wrote:
> > There has code supporting VLAN filters. With it, the NCSI channel is
> > associated with one or multiple VLANs. However, we need add code in
> > ftgmac100.c to support VLAN based ethernet devices.

I added vlan support to ftgmac100 already, we need to plumb in the
NCSI bits (or if they are there, hook them up with ftgmac100 properly).

Cheers,
Ben.
