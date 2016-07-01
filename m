Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgxqs2tnFzDqhC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 23:20:57 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u61DKmwA016448;
 Fri, 1 Jul 2016 08:20:49 -0500
Message-ID: <1467379248.7422.45.camel@kernel.crashing.org>
Subject: Re: [PATCH 07/10] net/farady: Read MAC address from chip
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 01 Jul 2016 23:20:48 +1000
In-Reply-To: <CACPK8Xc1adhXOtmtNHYzbivqzxVABxfG2L6CPsNEMWkbV0KCwA@mail.gmail.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
 <1467372307.7422.40.camel@kernel.crashing.org>
 <CACPK8XdAiDW=PADte4ZWNumKYXCkK-8kcw0atOUQATORsRQEGA@mail.gmail.com>
 <CACPK8Xc1adhXOtmtNHYzbivqzxVABxfG2L6CPsNEMWkbV0KCwA@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jul 2016 13:20:58 -0000

On Fri, 2016-07-01 at 21:47 +0930, Joel Stanley wrote:
> > If that is a worry we could use a device-tree property. Does our
> > uboot update the DT ? If yes it can set the local-mac-address prop.
> It doesn't currently, but we will be adding that soon we need to
> update the memory node for systems where board revisions change the
> DRAM size.

Ok, otherwise there's a trick with A-TAGS iirc but we should just do
DT, it's much cleaner.

Cheers,
Ben.
