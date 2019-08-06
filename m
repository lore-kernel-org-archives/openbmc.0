Return-Path: <andrew@lunn.ch>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="nTAloYe1"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4636lW6BZGzDqwm
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 07:12:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fc00WBtovQWbwYWrsv1JjCYQajV6WgZsSgkyMDMnwmQ=; b=nTAloYe1jHjKOUvI8oG2rVCIuf
 8l0QzmynOpMgso4HVgULgT1ngDM6pxm2PaZwe6/I4rGXxRJtv/BuI6QaEqL0nx8AZF4hjOca8WKp3
 zt9197AHBXJBBbLXaCcBbTTxv9g2WL915ObwC6YRRnDzeHLbT4ufKAOgXc0vW+H/P79c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hv6kO-0008KH-GQ; Tue, 06 Aug 2019 23:11:56 +0200
Date: Tue, 6 Aug 2019 23:11:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next] net: phy: modify assignment to OR for dev_flags
 in phy_attach_direct
Message-ID: <20190806211156.GD29142@lunn.ch>
References: <20190805185551.3140564-1-taoren@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805185551.3140564-1-taoren@fb.com>
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
X-List-Received-Date: Tue, 06 Aug 2019 21:12:10 -0000

On Mon, Aug 05, 2019 at 11:55:51AM -0700, Tao Ren wrote:
> Modify the assignment to OR when dealing with phydev->dev_flags in
> phy_attach_direct function, and this is to make sure dev_flags set in
> driver's probe callback won't be lost.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> CC: Heiner Kallweit <hkallweit1@gmail.com>
> CC: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Tao Ren <taoren@fb.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
