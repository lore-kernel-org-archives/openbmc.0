Return-Path: <tglx@linutronix.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a01:7a0:2:106d:700::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
X-Greylist: delayed 1155 seconds by postgrey-1.36 at bilbo;
 Fri, 18 Jan 2019 12:03:25 AEDT
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a01:7a0:2:106d:700::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gjP92fplzDqSP
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 12:03:25 +1100 (AEDT)
Received: from p4fea4364.dip0.t-ipconnect.de ([79.234.67.100] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1gkIGH-0002Wx-Kf; Fri, 18 Jan 2019 01:43:53 +0100
Date: Fri, 18 Jan 2019 01:43:52 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Eddie James <eajames@linux.vnet.ibm.com>
cc: LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Greg KH <gregkh@linuxfoundation.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux@roeck-us.net, 
 jdelvare@suse.com, Mark Rutland <mark.rutland@arm.com>, 
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, 
 Kate Stewart <kstewart@linuxfoundation.org>
Subject: Re: [PATCH v4 9/9] hwmon (occ): Add sysfs attributes for additional
 OCC data
In-Reply-To: <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
References: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 18 Jan 2019 12:42:15 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2019 01:03:25 -0000

Eddie,

On Wed, 11 Jul 2018, Eddie James wrote:

> --- /dev/null
> +++ b/drivers/hwmon/occ/sysfs.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OCC hwmon driver sysfs interface
> + *
> + * Copyright (C) IBM Corporation 2018
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */

The above license information is inconsistent.

The SPDX license identifier says GPL v2 only, but the license notice says
GPL v2 or later. This is just wrong.

Please decide which one to use and please also remove the boiler plate
text. It is redundant.

See Documentation/process/license-rules.rst

Please fix ASAP.

Thanks,

	tglx
