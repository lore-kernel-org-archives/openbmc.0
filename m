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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Qzq40G6BzF363;
 Thu, 12 Jul 2018 12:07:43 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6C27YKC015930;
 Wed, 11 Jul 2018 21:07:35 -0500
Message-ID: <c37eeb656151831123ec53bfc4e3c6caf718a060.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed@lists.ozlabs.org
Date: Thu, 12 Jul 2018 12:07:34 +1000
In-Reply-To: <a6331cdbababea893bcde5f8ca9529dd89dafd67.camel@kernel.crashing.org>
References: <20180622043756.21158-1-benh@kernel.crashing.org>
 <20180703193017.GA23230@rob-hp-laptop>
 <23be30ebb2c661ef304c78a85cff591c515ba65b.camel@kernel.crashing.org>
 <CAL_JsqKZunLyRJQJgQrcBvv2s=HEd=E2ZG1ZgkgwTQkzJ88mcA@mail.gmail.com>
 <a6331cdbababea893bcde5f8ca9529dd89dafd67.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 02:07:44 -0000

On Fri, 2018-07-06 at 11:48 +1000, Benjamin Herrenschmidt wrote:
> > We've generally standardized around "label" for things like slots,
> > ports, connectors, etc. that need to be physically identified.
> 
> Yes, label would be an option too, probably a better one that aliases.
> 
> > "slot-names" it seems hasn't gotten used for FDT. Since there aren't
> > DT's published for OF based systems nor any documentation, newbies
> > like me (that only have 8 years of DT experience) don't have any
> > insight into how things used to be done.
> 
> In a pretty much ad-hoc way :-) In this case, though, chip-id is a
> simple solution and works well (and I have the code already written and
> tested :-)

I want to try to get that stuff upstream. Do you still object to the
chip-id's after our discussion ? The labels aren't that great really...

Cheers,
Ben.
