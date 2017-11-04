Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yTcGb0jKwzDrCZ
 for <openbmc@lists.ozlabs.org>; Sat,  4 Nov 2017 22:36:22 +1100 (AEDT)
Received: from localhost (LFbn-1-12253-150.w90-92.abo.wanadoo.fr
 [90.92.67.150])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 1A914504;
 Sat,  4 Nov 2017 11:36:19 +0000 (UTC)
Date: Sat, 4 Nov 2017 12:36:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v11 1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20171104113632.GC24583@kroah.com>
References: <1509724449-26221-1-git-send-email-oleksandrs@mellanox.com>
 <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509724449-26221-2-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Sat, 04 Nov 2017 11:36:23 -0000

On Fri, Nov 03, 2017 at 05:54:06PM +0200, Oleksandr Shamray wrote:
> diff --git a/include/uapi/linux/jtag.h b/include/uapi/linux/jtag.h
> new file mode 100644
> index 0000000..0b25a83
> --- /dev/null
> +++ b/include/uapi/linux/jtag.h
> @@ -0,0 +1,117 @@
> +/*
> + * JTAG class driver
> + *
> + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2017 Oleksandr Shamray <oleksandrs@mellanox.com>
> + *
> + * Released under the GPLv2/BSD.
> + * SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause

Minor nit, this should go on the first line of the .h file now, to match
the rest of the kernel (just happened, not your fault.)

Also, uapi files are not just GPLv2, they have the userspace exception,
so this should just be:
	SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
no need to add any BSD stuff to it at all.

thanks,

greg k-h
