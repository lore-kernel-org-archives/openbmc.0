Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSsH80WbNzDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 01:18:59 +1000 (AEST)
Received: from localhost (unknown [207.198.105.23])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id E31BF412;
 Thu, 10 Aug 2017 15:18:56 +0000 (UTC)
Date: Thu, 10 Aug 2017 08:18:54 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net
Subject: Re: [patch v2 0/2]
Message-ID: <20170810151854.GA16915@kroah.com>
References: <1502115467-1735-1-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502115467-1735-1-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 15:19:00 -0000

On Mon, Aug 07, 2017 at 05:17:45PM +0300, Oleksandr Shamray wrote:
> When a need raise up to use JTAG interface for system's devices
> programming or CPU debugging, it could be done from the external
> JTAG master controller.

Your subject line is a bit "odd" :(
