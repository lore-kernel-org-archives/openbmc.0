Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMvZN5DZ7zDsTg
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 23:45:00 +1000 (AEST)
Received: from localhost (c-73-158-54-216.hsd1.ca.comcast.net [73.158.54.216])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id BC9BBB15;
 Wed,  2 Aug 2017 13:44:58 +0000 (UTC)
Date: Wed, 2 Aug 2017 06:44:56 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v1 1/2] drivers: jtag: Add JTAG core driver
Message-ID: <20170802134456.GD27481@kroah.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
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
X-List-Received-Date: Wed, 02 Aug 2017 13:45:01 -0000

On Wed, Aug 02, 2017 at 04:18:37PM +0300, Oleksandr Shamray wrote:
> +menuconfig JTAG
> +	tristate "JTAG support"
> +	default n

'n' is always the default, no need for this line at all.

thanks,

greg k-h
