Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjwjp54tzzDqXj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 07:38:54 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v7VLEA48029281;
 Thu, 31 Aug 2017 16:14:18 -0500
Message-ID: <1504214050.4974.52.camel@kernel.crashing.org>
Subject: Re: [PATCH net-next] net/ncsi: Define {add, kill}_vid callbacks for
 !CONFIG_NET_NCSI
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Samuel Mendoza-Jonas
 <sam@mendozajonas.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Date: Fri, 01 Sep 2017 07:14:10 +1000
In-Reply-To: <20170831152414.GB69617@mauery>
References: <20170831033846.23538-1-sam@mendozajonas.com>
 <20170831152414.GB69617@mauery>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
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
X-List-Received-Date: Thu, 31 Aug 2017 21:38:55 -0000

On Thu, 2017-08-31 at 08:24 -0700, Vernon Mauery wrote:
>  +int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
> > +{
> > +     return -ENOTTY;
> > +}
> > +int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
> > +{
> > +     return -ENOTTY;
> > +}
> 
> These should be static functions because they are defined in the header 
> file or you will get multiple symbol definitions.

static inline even or you'll get warning about them being unused iirc.

Cheers,
Ben.
