Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vs9W52H3WzDqd1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:39:13 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2RAd3f8028161;
 Mon, 27 Mar 2017 05:39:06 -0500
Message-ID: <1490611143.3177.76.camel@kernel.crashing.org>
Subject: Re: possible hackathon
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Chris Austen <austenc@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 27 Mar 2017 21:39:03 +1100
In-Reply-To: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
References: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
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
X-List-Received-Date: Mon, 27 Mar 2017 10:39:13 -0000

On Wed, 2017-03-22 at 15:59 -0600, Chris Austen wrote:
> I'm not saying there is, but if there was a possibility for a
> hackathon are there any ideas out there that would be of interest?
> Some things off the top of my head would be...
> 
> Updated simulation model 
> remote python scripts to collect thermal data from the host
> Redfish dbus discovery
> bmc swarm... talk dbus over multiple BMCs 
> System XML builder
> OpenStack Ironic pluggin

Missing kernel drivers:

 - USB slave (UDC)
 - USB Host (OHCI/EHCI)
 - Video compression engine
 - Video capture
 - Framebuffer via drmfb
 - etc...

> Ideas wouldn't need to be limited to the BMC ofcourse any
> interactions with the host firmware would also be candidate 
> 
> 
> 
> 
> Chris Austen
> 
> 
