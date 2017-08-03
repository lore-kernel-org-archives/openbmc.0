Return-Path: <andrew@lunn.ch>
Received: from vps0.lunn.ch (vps0.lunn.ch [178.209.37.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNcww6xXjzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 03:48:31 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1ddKEQ-0002NY-0u; Thu, 03 Aug 2017 19:48:22 +0200
Date: Thu, 3 Aug 2017 19:48:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "vadimp@maellanox.com" <vadimp@maellanox.com>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [patch v1 0/2] JTAG driver introduction
Message-ID: <20170803174822.GI15018@lunn.ch>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <20170802141209.GB25781@lunn.ch>
 <AM4PR0501MB2194E6B8D14EC15356C1C0BFB1B10@AM4PR0501MB2194.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM4PR0501MB2194E6B8D14EC15356C1C0BFB1B10@AM4PR0501MB2194.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 03 Aug 2017 17:48:33 -0000

> Hi Andrew
> 
> Thanks a lot for review.
> 

> We used user space tool for that, which is an adaptation of some
> Lattice tools, which allows programming of SVF files. We are using
> it for Lattice CPLD burning, since we have for such devices on our
> system, but this tool could be used for programming other devices
> from other vendors as well.
 
> https://github.com/mellanoxbmc/mellanox-bmc-tools

Since you are defining a new Kernel ABI here, it would be good to get
some buy-in from potential users for the ABI. Maybe for the next
version of the patchset you can cross post to the OpenOCD-devel list?

	Andrew
