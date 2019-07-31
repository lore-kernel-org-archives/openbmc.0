Return-Path: <andrew@lunn.ch>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="uKiCIlvC"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywyG11mZzDqYt
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 11:36:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MbVNcIqleGWDajEIzwbSrkr9UJ2vlKBIQWs7BCgs3Qk=; b=uKiCIlvCjadlgle851de+bSidr
 L+ClxfKg5jnk5yCPW2X8DH+7FvSUHNPBsCxjts2ILx7hHkhovl3GiFk58BHdK1l1oJ5cuFmLEZfQg
 JX3N8fTjHfLsWIp1rnCUuB5PKECKrVr+zPJMigo2OjJ40dP2TVA+g7EHsXk5BY80CT24=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hsdXg-0003Cz-DV; Wed, 31 Jul 2019 03:36:36 +0200
Date: Wed, 31 Jul 2019 03:36:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, netdev <netdev@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH net-next 2/2] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
Message-ID: <20190731013636.GC25700@lunn.ch>
References: <20190730002549.86824-1-taoren@fb.com>
 <CA+h21hq1+E6-ScFx425hXwTPTZHTVZbBuAm7RROFZTBOFvD8vQ@mail.gmail.com>
 <3987251b-9679-dfbe-6e15-f991c2893bac@fb.com>
 <CA+h21ho1KOGS3WsNBHzfHkpSyE4k5HTE1tV9wUtnkZhjUZGeUw@mail.gmail.com>
 <e8f85ef3-1216-8efb-a54d-84426234fe82@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f85ef3-1216-8efb-a54d-84426234fe82@fb.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 31 Jul 2019 01:36:58 -0000

> The INTF_SEL pins report correct mode (RGMII-Fiber) on my machine,
> but there are 2 "sub-modes" (1000Base-X and 100Base-FX) and I
> couldn't find a proper/safe way to auto-detect which "sub-mode" is
> active. The datasheet just describes instructions to enable a
> specific mode, but it doesn't say 1000Base-X/100Base-FX mode will be
> auto-selected. And that's why I came up with the patch to specify
> 1000Base-X mode.

Fibre does not perform any sort of auto-negotiation. I assume you have
an SFP connected? When using PHYLINK, the sfp driver will get the
supported baud rate from SFP EEPROM to determine what speed could be
used. However, there is currently no mainline support for having a
chain MAC-PHY-SFP. For that you need Russells out of tree patches.

      Andrew
