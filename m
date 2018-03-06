Return-Path: <andrew@lunn.ch>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="MQjnCwZ4"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwd7Q1X4gzDr8d
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 00:35:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=4XjN1FqWqFQw+W5dMaTG1VEhOhpMTdjmEPTtCVq2FAQ=; 
 b=MQjnCwZ4IRflTzdUtnhzFmJyuVqtF72eVeUUSGGatzWD/N0dbRrnf+wHPjI1Dyz8YtxWT4DIVP6+eJSqmbMwtEctrjZj/98WG5praK7bgOAsDcyrPEVitpiM/OwgDT/04aLoqDn3G2k2zR4MDYNAhT49rYmlHc7UrVgpZsjo5Aw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1etC6i-00072w-UR; Tue, 06 Mar 2018 13:54:16 +0100
Date: Tue, 6 Mar 2018 13:54:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
 andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180306125416.GD26143@lunn.ch>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180306124002.GA13950@amd>
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
X-List-Received-Date: Tue, 06 Mar 2018 13:35:16 -0000

On Tue, Mar 06, 2018 at 01:40:02PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > ---
> >  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > new file mode 100644
> > index 000000000000..8a86f346d550
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> > @@ -0,0 +1,73 @@
> > +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
> 
> Are these SoCs x86-based?

ARM, as far as i can tell. If i get the architecture correct, these
are BMC, Board Management Controllers, looking after the main x86 CPU,
stopping it overheating, controlling the power supplies, remote
management, etc.

    Andrew
