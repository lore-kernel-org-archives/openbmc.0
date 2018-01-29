Return-Path: <juliac@eso.teric.us>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=eso.teric.us
 (client-ip=2600:3c00::f03c:91ff:fedf:a84c; helo=eso.teric.us;
 envelope-from=juliac@eso.teric.us; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=eso.teric.us header.i=@eso.teric.us header.b="RjY5Brn7";
 dkim-atps=neutral
Received: from eso.teric.us (eso.teric.us
 [IPv6:2600:3c00::f03c:91ff:fedf:a84c])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVYyY2kqJzDqLm
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 02:56:04 +1100 (AEDT)
Received: from neo.teric.us (neo.teric.us [198.58.100.135])
 by eso.teric.us (Postfix) with ESMTPS id 2A8CB1036F;
 Mon, 29 Jan 2018 09:56:01 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eso.teric.us;
 s=mail; t=1517241361;
 bh=WNXYLzK9r4vNiJJbrX7r3NAhUhPMTiY1JuVIR4NczmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RjY5Brn70iZsiIpImOMbctPfn4GkGbsZUAeyOpd5MgjYsXa5XIgYDPMeNEa3sssH6
 hbZPWwOJQAzGyKNNWf2kzch4JQ5ISNe7u9zjb6TYvcSgDa6Wk6O/mOmlVrS8wTQ6OL
 yH8h7rJ8birTnG3BOSwdgBpUabKPAEbMeHcBDQ0w3OUk06TbO7d4sCv8pfjeSABcly
 LLOUxocDIVg1/XdZyXIIGTMbKraS8DWBtOCN6KF5gOhQT9+aoVYQnoavLa99ZwolEq
 D32sS1lfXgvs3bNW9xmUoNMgBBU+29EBZmZi0W2F7S1K45ds3ZFvTNjU1o+MC4rI+s
 eSoGFUzrs3FIA==
Received: by neo.teric.us (Postfix, from userid 1002)
 id EFB18185FDB; Mon, 29 Jan 2018 09:56:00 -0600 (CST)
Date: Mon, 29 Jan 2018 09:56:00 -0600
From: Julia Cartwright <juliac@eso.teric.us>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v18 1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20180129155600.GA1924@kryptos.localdomain>
References: <1517236305-4880-1-git-send-email-oleksandrs@mellanox.com>
 <1517236305-4880-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517236305-4880-2-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 15:56:06 -0000

On Mon, Jan 29, 2018 at 04:31:42PM +0200, Oleksandr Shamray wrote:
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.
> 
> Driver exposes set of IOCTL to user space for:
> - XFER:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks).
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
> 
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
> 
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX
> 
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Philippe Ombredanne <pombredanne@nexb.com>
[..]
> diff --git a/drivers/jtag/jtag.c b/drivers/jtag/jtag.c
[..]
> +struct jtag *jtag_alloc(size_t priv_size, const struct jtag_ops *ops)
> +{
> +	struct jtag *jtag;
> +
> +	jtag = kzalloc(sizeof(*jtag) + priv_size, GFP_KERNEL);
> +	if (!jtag)
> +		return NULL;
> +
> +	if (!ops)
> +		return NULL;
> +
> +	if (!ops->idle || !ops->mode_set || !ops->status_get || !ops->xfer)
> +		return NULL;

Did you think through this?

You leak 'jtag' here and above.

Perform all the ops checks prior to the allocation.

   Julia
