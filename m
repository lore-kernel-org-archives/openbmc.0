Return-Path: <andrew@lunn.ch>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="pRSaI7iA"; 
 dkim-atps=neutral
X-Greylist: delayed 1653 seconds by postgrey-1.36 at bilbo;
 Fri, 12 Jan 2018 09:46:47 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHgwl6WpqzF0cR
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 09:46:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=RIw0K9zMbNAKJJBHzCs57XEIQ3DSsM0yi4G22kIiBdI=; 
 b=pRSaI7iAi9Rm6CZKKo97XuJw9p8y8REEfG4ZpUeJZ9lcp5GkYckRPbIgvBFPIivb/w3Yludcbwu3qFvypikhR+kdfXRBF41o8mXet57vzT6ngk3Vv/CtusQJHc9DJSNwiQPkywio8NDHFLxDHz7YdBbyvd2UeMsXMCBrRKFbimQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1eZlBN-00034G-2J; Thu, 11 Jan 2018 23:18:45 +0100
Date: Thu, 11 Jan 2018 23:18:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Subject: Re: [linux, dev-4.10, 6/6] drivers/hwmon: Add a driver for a generic
 PECI hwmon
Message-ID: <20180111221845.GA9278@lunn.ch>
References: <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <20180110214747.GA25248@roeck-us.net>
 <261ac28e-813c-a058-c81f-ad4e718d0233@linux.intel.com>
 <20180111214035.GA14748@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180111214035.GA14748@roeck-us.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 22:46:49 -0000

> > >>+static const struct of_device_id peci_of_table[] = {
> > >>+	{ .compatible = "peci-hwmon", },
> > >
> > >This does not look like a reference to some piece of hardware.
> > >
> > 
> > This driver provides generic PECI hwmon function to which controller has
> > PECI HW such as Aspeed or Nuvoton BMC chip so it's not dependant on a
> > specific hardware. Should I remove this or any suggestion?

PECI seems to be an Intel thing. So at least it should be

 { .compatible = "intel,peci-hwmon", }

assuming it is actually compatible with the Intel specification.

	 Andrew
