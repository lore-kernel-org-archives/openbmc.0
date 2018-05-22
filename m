Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qcD01gD6zDqH4
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 10:37:03 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4M0aofY018389;
 Mon, 21 May 2018 19:36:51 -0500
Message-ID: <d8828349e3d4f01a5ce9ecde529b84c792b708c3.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 May 2018 10:36:49 +1000
In-Reply-To: <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
 <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
 <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
 <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2018 00:37:05 -0000

On Mon, 2018-05-21 at 13:58 -0500, Eddie James wrote:
> > >    If it's the former then retrying independent of the OCC error
> > > handling protocol is probably okay, but if we're trying to catch the
> > > latter then maybe we should let this be handled as part of the OCC
> > > error handling code?
> > > 
> > > Eddie?
> 
> The checksum is part of the OCC response, so it's not a transport thing. 
> If we've gotten to checking the checksum then we've got a full response 
> that looks valid so far (reasonable length, etc).
> 
> If we're trying to adhere to the OCC spec, then I'm of the opinion that 
> we shouldn't do any retries except for those handled in the occ-hwmon 
> driver.

I don't see any in there ... what am I missing ?

Cheers,
Ben.
