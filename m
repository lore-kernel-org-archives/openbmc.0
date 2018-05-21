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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qYwB646KzDqG0
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 08:53:14 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4LMr1Ex013003;
 Mon, 21 May 2018 17:53:02 -0500
Message-ID: <fbf1dd20d94394d5ea6357abd6aa8ac5f7c0bcc8.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 1/4] fsi/occ: Add retries on SBE errors
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 May 2018 08:53:01 +1000
In-Reply-To: <142d4920-3a8b-b2ba-a218-e4bd299c572c@linux.vnet.ibm.com>
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <1526879662.2642052.1378929336.646BF02C@webmail.messagingengine.com>
 <0450d7c40fe4e8015311ef6de478893a58445d9b.camel@kernel.crashing.org>
 <142d4920-3a8b-b2ba-a218-e4bd299c572c@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 21 May 2018 22:53:15 -0000

On Mon, 2018-05-21 at 13:48 -0500, Eddie James wrote:
> 
> > > 3.3.1 BMC-OCC Communication Failure Handling
> > > 
> > > On failures communicating with an OCC the BMC should first verify
> > > that the “OCC Active” sensor is TRUE.  If the OCCs are not active the
> > > error should be ignored and communication with the OCC should not be
> > > retired until the “OCC Active” sensor is TRUE.  If the “OCC Active”
> > > sensor is TRUE the command should be retried twice.
> > 
> > What is the "OCC Active sensor" ?
> 
> It's a value in the OCC poll response.

That's only useful if you can get that response then... which you can't
if the communication fails. I'm missing something here.

Ben.
