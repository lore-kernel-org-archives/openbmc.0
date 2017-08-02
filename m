Return-Path: <andrew@lunn.ch>
Received: from vps0.lunn.ch (vps0.lunn.ch [178.209.37.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMx4V3XgSzDsQS
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 00:52:42 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1dcuNd-0007GR-6u; Wed, 02 Aug 2017 16:12:09 +0200
Date: Wed, 2 Aug 2017 16:12:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, devicetree@vger.kernel.org,
 jiri@resnulli.us, system-sw-low-level@mellanox.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mec@shout.net, joel@jms.id.au, linux-serial@vger.kernel.org,
 vadimp@maellanox.com, tklauser@distanz.ch,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [patch v1 0/2] JTAG driver introduction
Message-ID: <20170802141209.GB25781@lunn.ch>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 03 Aug 2017 15:27:37 +1000
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
X-List-Received-Date: Wed, 02 Aug 2017 14:52:42 -0000

On Wed, Aug 02, 2017 at 04:18:36PM +0300, Oleksandr Shamray wrote:
> When a need raise up to use JTAG interface for system's devices
> programming or CPU debugging, it could be done from the external
> JTAG master controller.
>  
> For such purpose, usually the user layer
> application implements jtag protocol or using a proprietary
> connection to vendor hardware.
> This method is slow and not generic.
>  
> We propose to implement general JTAG interface and infrastructure
> to communicate with user layer application. In such way, we can
> have the standard JTAG interface core part and separation from
> specific HW implementation.
> This allow new capability to debug the CPU or program system's 
> device via BMC without additional devices nor cost. 

Hi Oleksandr

Do you have patches for OpenOCD? Or maybe i should ask it another way,
what user space tools are you using?

Thanks
	Andrew
