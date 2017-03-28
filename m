Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsky94b7DzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:46:09 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S8jp9Z015039;
 Tue, 28 Mar 2017 03:45:53 -0500
Message-ID: <1490690751.3177.106.camel@kernel.crashing.org>
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 28 Mar 2017 19:45:51 +1100
In-Reply-To: <33bfcaea-ad18-3a19-5eb5-2f9e28bb6704@kaod.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
 <1490682729.3177.105.camel@kernel.crashing.org>
 <ac565241-2806-67dc-fc34-7fdcc08d8a2a@kaod.org>
 <33bfcaea-ad18-3a19-5eb5-2f9e28bb6704@kaod.org>
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
X-List-Received-Date: Tue, 28 Mar 2017 08:46:10 -0000

On Tue, 2017-03-28 at 08:59 +0200, Cédric Le Goater wrote:
> > Sigh. is it that bad :/ OK. Let's do some tuning.  I will tell you
> > what I get.
> 
> so, with a large cleanup under "Kernel hacking", we get close to
> 400Mbit on the 2500.

I get that too with 4.7 but I'm down to about 320 with 4.10

Cheers,
Ben.
