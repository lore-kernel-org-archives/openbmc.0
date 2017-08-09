Return-Path: <clg@kaod.org>
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS54c6s58zDqyV
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:07:12 +1000 (AEST)
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 27E3D74321
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 10:59:02 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id E273D7C008B;
 Wed,  9 Aug 2017 10:58:54 +0200 (CEST)
Subject: Re: [PATCH for 2.11 v2 2/2] ARM: aspeed_soc: Propagate silicon-rev to
 watchdog
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, joel@jms.id.au,
 ryan_chen@aspeedtech.com, f4bug@amsat.org, openbmc@lists.ozlabs.org
References: <20170809062828.3673-1-andrew@aj.id.au>
 <20170809062828.3673-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78e09d93-ba07-c882-8830-737691f83a3c@kaod.org>
Date: Wed, 9 Aug 2017 10:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170809062828.3673-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14904100021060471554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrkeehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 09 Aug 2017 09:07:13 -0000

On 08/09/2017 08:28 AM, Andrew Jeffery wrote:
> This is required to configure differences in behaviour between the
> AST2400 and AST2500 watchdog IPs.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_soc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3034849c80bf..79804e1ee652 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -183,6 +183,8 @@ static void aspeed_soc_init(Object *obj)
>          object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
>          object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NULL);
>          qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
> +                                    sc->info->silicon_rev);
>      }
>  
>      object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
> 
