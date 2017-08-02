Return-Path: <andrew@lunn.ch>
X-Greylist: delayed 2422 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Aug 2017 00:52:39 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [178.209.37.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMx4R2N1rzDsQS
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 00:52:39 +1000 (AEST)
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
 (envelope-from <andrew@lunn.ch>)
 id 1dcuRy-0007Jc-GC; Wed, 02 Aug 2017 16:16:38 +0200
Date: Wed, 2 Aug 2017 16:16:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, devicetree@vger.kernel.org,
 jiri@resnulli.us, system-sw-low-level@mellanox.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mec@shout.net, Jiri Pirko <jiri@mellanox.com>, joel@jms.id.au,
 linux-serial@vger.kernel.org, vadimp@maellanox.com,
 tklauser@distanz.ch, linux-arm-kernel@lists.infradead.org
Subject: Re: [patch v1 1/2] drivers: jtag: Add JTAG core driver
Message-ID: <20170802141638.GC25781@lunn.ch>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Wed, 02 Aug 2017 14:52:39 -0000

> +void jtag_unregister(struct jtag *jtag)
> +{
> +	struct device *dev = jtag->dev;
> +
> +	mutex_lock(&jtag_mutex);
> +	list_add_tail(&jtag->list, &jtag_list);

add?

> +	mutex_unlock(&jtag_mutex);
> +	cdev_del(&jtag->cdev);
> +	device_unregister(dev);
> +	ida_simple_remove(&jtag_ida, jtag->id);
> +}

  Andrew
