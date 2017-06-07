Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjY6q6jwJzDqCt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 01:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="pn4/17Nv";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1CIugcleHh19G/zgf4eiLvtMAfYMxN9wZpE7wUwWYnc=; b=pn4/17Nv67VVv1H6yCO2JK6RUw
 8F/IPf95fwgLjFrjqsXn/90RQQSxQOkUFYZG2PZihX/O7BTwtHQh+Rl2ZMkD9jDEjA8YNev4jI0TM
 G50pC9rjCAEhV81UV5IfarTW1Uulf+HFVY3T81FyctEnJa5wwRFMX/MPXVmBj/eiytLdzTw1TmWyr
 6YBY5RZgNL7PFQn9YLpzCIj5FJYJ8gh6cM04JjvEzcRLFbQ2Mr+gS8GWMh6YbcD/mU531fpyXRvrN
 Y6AybVp51lHOnR/YMy7CuZSTIO/RhxNL+t45WkDrbADg/4KDrcKOsGADdGhLTXRfx0KuM56sWquYU
 eaBHqw4A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:37118 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dIdIt-003OUy-Fa; Wed, 07 Jun 2017 15:55:27 +0000
Date: Wed, 7 Jun 2017 08:55:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, msbarth@linux.vnet.ibm.com,
 tpearson@raptorengineering.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
Message-ID: <20170607155526.GA18946@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170606070230.32669-1-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 07 Jun 2017 15:55:32 -0000

On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
> Add a basic driver for the MAX31785, focusing on the fan control
> features but ignoring the temperature and voltage monitoring
> features of the device.
> 
> This driver supports all fan control modes and tachometer / PWM
> readback where applicable.
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Hello,
> 
> This is a rework of Timothy Pearson's original patch:
> 
>     https://www.mail-archive.com/linux-hwmon@vger.kernel.org/msg00868.html
> 
> I've labelled it as v3 to differentiate from Timothy's postings.
> 
> The original thread had some discussion about the MAX31785 being a PMBus device
> and that it should thus be a PMBus driver. The implementation still makes use

After thinking about it, that is what it should be. If I accept it as non-PMBus
driver, it will be all but impossible to convert it to a PMBus driver later on,
and that just doesn't make any sense.

With no one interested in writing that driver, I'll try to give it some more
priority myself. I do have an evaluation board somewhere, which should help.

Note that the second fan reading should be implemented as just that, not with
a non-standard attribute.

Guenter
