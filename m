Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDRlc1V89zDqGH
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 15:26:35 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v124QPkr026961;
 Wed, 1 Feb 2017 22:26:26 -0600
Message-ID: <1486009584.4850.25.camel@kernel.crashing.org>
Subject: Re: Users of SBE FIFO kernel driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Alistair Popple
 <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 02 Feb 2017 15:26:24 +1100
In-Reply-To: <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
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
X-List-Received-Date: Thu, 02 Feb 2017 04:26:36 -0000

On Thu, 2017-02-02 at 13:59 +1030, Joel Stanley wrote:
> The driver you design will need to take into account that there will
> be multiple users from each of these APIs. For instance, there will be
> Eddie's OCC hwmon driver and the userspace code that kicks off the
> boot sequence.

In addition, we expect host debugging tools running on the BMC using
that interface.

Cheers,
Ben.
