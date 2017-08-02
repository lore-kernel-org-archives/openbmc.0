Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMvYr3FBGzDsTg
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 23:44:31 +1000 (AEST)
Received: from localhost (c-73-158-54-216.hsd1.ca.comcast.net [73.158.54.216])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 444CCB12;
 Wed,  2 Aug 2017 13:44:29 +0000 (UTC)
Date: Wed, 2 Aug 2017 06:44:26 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org, mec@shout.net,
 vadimp@maellanox.com, system-sw-low-level@mellanox.com,
 Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v1 1/2] drivers: jtag: Add JTAG core driver
Message-ID: <20170802134426.GC27481@kroah.com>
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
X-List-Received-Date: Wed, 02 Aug 2017 13:44:32 -0000

On Wed, Aug 02, 2017 at 04:18:37PM +0300, Oleksandr Shamray wrote:
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.

Yeah, it's nice to see this.

Some "meta" comments on this patch first:

> --- /dev/null
> +++ b/drivers/jtag/jtag.c
> @@ -0,0 +1,347 @@
> +/*
> + * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2017 Oleksandr Shamray <oleksandrs@mellanox.com>
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the names of the copyright holders nor the names of its
> + *    contributors may be used to endorse or promote products derived from
> + *    this software without specific prior written permission.
> + *
> + * Alternatively, this software may be distributed under the terms of the
> + * GNU General Public License ("GPL") version 2 as published by the Free
> + * Software Foundation.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> + * POSSIBILITY OF SUCH DAMAGE.
> + */

Ok, dual BSD/GPL, that's fine, but really?  In this day and age you want
to deal with that complexity?

I ask because then you export your symbols as "gpl only" everywhere:

> +void *jtag_priv(struct jtag *jtag)
> +{
> +	return jtag->priv;
> +}
> +EXPORT_SYMBOL_GPL(jtag_priv);

Which I don't object to at all, and personally really like, but it kind
of doesn't make sense, right?  How about just dropping the dual license
mess?  There's nothing here that any other OS will ever care about,
right?

For your uapi header file, that makes sense to keep it dual.


Now a technical comment:

> +/**
> + * struct jtag_run_test_idle - forces JTAG sm to
> + * RUN_TEST/IDLE state *
> + * @mode: access mode
> + * @reset: 0 - run IDEL/PAUSE from current state
> + *         1 - go trough TEST_LOGIC/RESET state before  IDEL/PAUSE
> + * @end: completion flag
> + * @tck: clock counter
> + *
> + * Structure represents interface to JTAG device for jtag idle
> + * execution.
> + */
> +struct jtag_run_test_idle {
> +	enum jtag_xfer_mode	mode;
> +	unsigned char		reset;
> +	enum jtag_endstate	endstate;
> +	unsigned char		tck;
> +};

All structures that cross the user/kernel boundry have to use the __
type variables.

No "unsigned char", it has to be "__u8", no "unsigned short", it has to
be "__u16", and so on.

Also, watch out for your enumerated types, what's the packing end up
looking like on these structures?  Have you verified it works with a
64bit kernel and 32bit userspace all correctly?

thanks,

greg k-h
