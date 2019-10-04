Return-Path: <herbert@gondor.apana.org.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gondor.apana.org.au
 (client-ip=216.24.177.18; helo=fornost.hmeau.com;
 envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
X-Greylist: delayed 2024 seconds by postgrey-1.36 at bilbo;
 Sat, 05 Oct 2019 02:04:26 AEST
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lF7G3PrHzDqcT
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 02:04:26 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1iGPWu-0000ro-GG; Sat, 05 Oct 2019 01:30:05 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 05 Oct 2019 01:29:56 +1000
Date: Sat, 5 Oct 2019 01:29:56 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, sumit.garg@linaro.org,
 jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de,
 joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 0/2] hwrng: npcm: add NPCM RNG driver support
Message-ID: <20191004152956.GE5148@gondor.apana.org.au>
References: <20190912090149.7521-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912090149.7521-1-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Fri, 04 Oct 2019 16:04:27 -0000

On Thu, Sep 12, 2019 at 12:01:47PM +0300, Tomer Maimon wrote:
> This patch set adds Random Number Generator (RNG) support 
> for the Nuvoton NPCM Baseboard Management Controller (BMC).
> 
> The RNG driver we use power consumption when the RNG 
> is not required.
> 
> The NPCM RNG driver tested on NPCM750 evaluation board.
> 
> Addressed comments from:.
>  - Daniel Thompson: https://lkml.org/lkml/2019/9/10/352
>  - Milton Miller II : https://lkml.org/lkml/2019/9/10/847
>  - Daniel Thompson: https://lkml.org/lkml/2019/9/10/294
> 
> Changes since version 2:
>  - Rearrange wait parameter in npcm_rng_read function.
>  - Calling pm_runtime_enable function before hwrng_register function 
>    called to enable the hwrng before add_early_randomness called.
>  - Remove quality dt-binding parameter in the driver and documentation.
>  - Disable CONFIG_PM if devm_hwrng_register failed.
>  - Remove owner setting in the driver struct.
> 
> Changes since version 1:
>  - Define timout in real-world units.
>  - Using readl_poll_timeout in rng_read function.
>  - Honor wait parameter in rng_read function.
>  - Using local variable instead of #ifndef.
>  - Remove probe print.
> 
> Tomer Maimon (2):
>   dt-binding: hwrng: add NPCM RNG documentation
>   hwrng: npcm: add NPCM RNG driver
> 
>  .../bindings/rng/nuvoton,npcm-rng.txt         |  12 ++
>  drivers/char/hw_random/Kconfig                |  13 ++
>  drivers/char/hw_random/Makefile               |   1 +
>  drivers/char/hw_random/npcm-rng.c             | 186 ++++++++++++++++++
>  4 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
>  create mode 100644 drivers/char/hw_random/npcm-rng.c

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
