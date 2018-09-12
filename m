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
 by lists.ozlabs.org (Postfix) with ESMTPS id 429DdM1Ch8zDqC3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 17:56:54 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w8C7uX1A028872;
 Wed, 12 Sep 2018 02:56:34 -0500
Message-ID: <c002018d3765280e135d673f7c731784a90a260d.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device documentation
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Rob Herring <robh@kernel.org>, Eddie James <eajames@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 gregkh@linuxfoundation.org, mark.rutland@arm.com, linux@roeck-us.net,
 joel@jms.id.au
Date: Wed, 12 Sep 2018 09:56:33 +0200
In-Reply-To: <20180910181610.GA5907@bogus>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20180910181610.GA5907@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2018 07:56:55 -0000

On Mon, 2018-09-10 at 13:16 -0500, Rob Herring wrote:
> On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> > Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> > 
> > Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> > ---
> >  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > new file mode 100644
> > index 0000000..46372f6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > @@ -0,0 +1,15 @@
> > +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> > +---------------------------------------------------------------------
> > +
> > +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> > +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> > +nodes.
> > +
> > +Required properties:
> > + - compatible = "ibm,p9-occ"
> > +
> > +Examples:
> > +
> > +    occ {
> 
> FSI slave devices are supposed to have an address according to the 
> binding doc.

This isn't the FSI device per-se actually. This is a node below the
"sbefifo" FSI device. The SBE fifo is the mechanism by which we
communicate with the OCC. The sbefifo doesn't really define a "bus",
it's mostly used from userspace directly via /dev/sbefifo* to perform
various tasks in the chip, but it happens to also provide the in-kernel 
transport for the OCC commands.

Cheers,
Ben.

> > +        compatible = "ibm,p9-occ";
> > +    };
> > -- 
> > 1.8.3.1
> > 
