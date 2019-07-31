Return-Path: <andrew@lunn.ch>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="D+dt/Wwi"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yyDf69XZzDqWv
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 12:34:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ORAf6J6JbZKYnL2Jvl8xniqzWNCdzdfxgEVUinGXEAA=; b=D+dt/WwidcTZ/t53+rgaOkq7NL
 uuTAqcAEvNtjquwzbcddkh0S52df2snmx+NSk3oNX8TgILJg2qLGKoBfu3NWtyIl+fWH1hM2jVtFG
 05DL0YnyRLdP8bi+J9lDTT7GFxohUzQIFvQ76kiIICSGHkl7DvtW0AMaxXdttZmOUss4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hseRV-0003nb-Tx; Wed, 31 Jul 2019 04:34:17 +0200
Date: Wed, 31 Jul 2019 04:34:17 +0200
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
Message-ID: <20190731023417.GD9523@lunn.ch>
References: <20190730002549.86824-1-taoren@fb.com>
 <CA+h21hq1+E6-ScFx425hXwTPTZHTVZbBuAm7RROFZTBOFvD8vQ@mail.gmail.com>
 <3987251b-9679-dfbe-6e15-f991c2893bac@fb.com>
 <CA+h21ho1KOGS3WsNBHzfHkpSyE4k5HTE1tV9wUtnkZhjUZGeUw@mail.gmail.com>
 <e8f85ef3-1216-8efb-a54d-84426234fe82@fb.com>
 <20190731013636.GC25700@lunn.ch>
 <885e48dd-df5b-7f08-ef58-557fc2347fa6@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <885e48dd-df5b-7f08-ef58-557fc2347fa6@fb.com>
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
X-List-Received-Date: Wed, 31 Jul 2019 02:34:27 -0000

> Hi Andrew,
> 
> The BCM54616S PHY on my machine is connected to a BCM5396 switch chip over backplane (1000Base-KX).

Ah, that is different. So the board is using it for RGMII to 1000Base-KX?

phy-mode is about the MAC-PHY link. So in this case RGMII.

There is no DT way to configure the PHY-Switch link. However, it
sounds like you have the PHY strapped so it is doing 1000BaseX on the
PHY-Switch link. So do you actually need to configure this?

You report you never see link up? So maybe the problem is actually in
read_status? When in 1000BaseX mode, do you need to read the link
status from some other register? The Marvell PHYs use a second page
for 1000BaseX.

    Andrew
