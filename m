Return-Path: <andrew@lunn.ch>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="WCZqK+Ll"; 
 dkim-atps=neutral
X-Greylist: delayed 535 seconds by postgrey-1.36 at bilbo;
 Thu, 22 Feb 2018 04:14:28 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmkcN2gZhzDqYx
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 04:14:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=XtK30u2t1UmilLqoCP6Vmh3SVEA4LyKIqp0uF4mLNt8=; 
 b=WCZqK+Llj02RKjvYCL7fp3AfMfOcgflQ7bn4fHzcwdiQoq1qdEBwNehxmx6eN9FqiUwc5irdeBL+1EVapSJspmmfEypEK19zzSnqPd6R3sNoDfwJ89rNwxBum/k/U4mmYfvO1MTeKwkaP1OzuBTHoAtfi/YCXevUaH6q2FfRPZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1eoXxl-0000aY-W7; Wed, 21 Feb 2018 18:13:50 +0100
Date: Wed, 21 Feb 2018 18:13:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180221171349.GG29204@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 17:14:30 -0000

On Wed, Feb 21, 2018 at 08:16:00AM -0800, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
> AST24xx/25xx SoCs.

Hi Jae

It would be good to separate this into two. One binding document for a
generic adaptor, with a generic PECI bus, and generic client
devices. List all the properties you expect at the generic level.

Then have an aspeed specific binding for those properties which are
specific to the Aspeed adaptor.

	 Andrew
 
