Return-Path: <tklauser@sym2.noone.org>
X-Greylist: delayed 518 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Aug 2017 19:37:16 AEST
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNQ246JVWzDqyW
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 19:37:16 +1000 (AEST)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 3xNPqx1FBbz1kb6h; Thu,  3 Aug 2017 11:28:28 +0200 (CEST)
Date: Thu, 3 Aug 2017 11:28:27 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 linux-serial@vger.kernel.org, mec@shout.net, vadimp@maellanox.com,
 system-sw-low-level@mellanox.com, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v1 1/2] drivers: jtag: Add JTAG core driver
Message-ID: <20170803092826.GF3546@distanz.ch>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501679918-20486-2-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 03 Aug 2017 23:38:09 +1000
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
X-List-Received-Date: Thu, 03 Aug 2017 09:37:17 -0000

Nice work!

On 2017-08-02 at 15:18:37 +0200, Oleksandr Shamray <oleksandrs@mellanox.com> wrote:
> --- /dev/null
> +++ b/drivers/jtag/jtag.c
[...]
> +static int jtag_run_test_idle(struct jtag *jtag,
> +			      struct jtag_run_test_idle *idle)

Both the function and the struct it takes have the same name, which of
course is perfectly valid C. However, IMO it would be easier to grep for
the function/struct individually if they had different names.

> +{
> +	if (jtag->ops->idle)
> +		return jtag->ops->idle(jtag, idle);
> +	else
> +		return -EOPNOTSUPP;
> +}
[...]
> --- /dev/null
> +++ b/include/uapi/linux/jtag.h
> @@ -0,0 +1,133 @@
[...]
> +/**
> + * struct jtag_run_test_idle - forces JTAG sm to
> + * RUN_TEST/IDLE state *

I guess a newline is needed here to make this a valid kerneldoc comment
(the trailing '*' indicates that one was actually intended here ;)

Also, 'sm' should probably be spelled out as 'state machine'.

> + * @mode: access mode
> + * @reset: 0 - run IDEL/PAUSE from current state
> + *         1 - go trough TEST_LOGIC/RESET state before  IDEL/PAUSE

Typos: s/trough/through/ and s/IDEL/IDLE/

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
