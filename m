Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgh3K5xWZzDqhC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 12:59:57 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id u612xnTl019885;
 Thu, 30 Jun 2016 21:59:50 -0500
Message-ID: <1467341989.7422.37.camel@kernel.crashing.org>
Subject: Re: [PATCH 06/10] net/farady: Helper functions to create or destroy
 MDIO interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 01 Jul 2016 12:59:49 +1000
In-Reply-To: <CACPK8Xdk6VLzk-sh+K9_iTVT-_znn=Nw2SarhqNy0rozk-T+Zg@mail.gmail.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-7-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xdk6VLzk-sh+K9_iTVT-_znn=Nw2SarhqNy0rozk-T+Zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.3 (3.20.3-1.fc24.1) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 01 Jul 2016 02:59:58 -0000

On Thu, 2016-06-30 at 23:19 +0930, Joel Stanley wrote:
> +       priv->mii_bus->name = "ftgmac100_mdio";
> > +       snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE,
> "ftgmac100_mii");
> 
> If we have two ftgmac100 drivers loaded (such as on the ast2500-evb),
> when the second goes to create the mdiobus kobject it will have the
> same name. We need to make this name unique (or fix up the mdiobus
> code).
> 
> You can see a backtrace here:
> 
>   https://github.com/openbmc/linux/issues/87

Traditional way:

	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%d",
		 priv->pdev->name, priv->pdev->id);


IE, the name here isn't the same as mii_bus->name which is a user
visible name, but the actual *device* name (platform dev) and an id.

Cheers,
Ben.
