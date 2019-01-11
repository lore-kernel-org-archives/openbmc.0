Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.173.103; helo=5.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Jan 2019 00:02:35 AEDT
Received: from 5.mo5.mail-out.ovh.net (5.mo5.mail-out.ovh.net [87.98.173.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bjhC19vtzDqwb
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 00:02:33 +1100 (AEDT)
Received: from player730.ha.ovh.net (unknown [10.109.160.39])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id DA22320EB22
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 13:55:34 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 603071737CF6;
 Fri, 11 Jan 2019 12:55:27 +0000 (UTC)
Subject: Re: [PATCH] qemu: aspeed_smc: Calculate checksum on normal DMA
To: Christian Svensson <blue@cmd.nu>
Cc: Christian Svensson <bluecmd@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20181112142231.162425-1-bluecmd@google.com>
 <7b253e90-db3b-1863-613c-8a35edf32944@kaod.org>
 <CADiuDAQAuidj9xb_BSAtiujtcGUNPWYkH6=QnAHRxHJ3gnJXyg@mail.gmail.com>
 <CADiuDAQ-cUMyHWbkrSVucmb2BRusaCP-OkQs0JG78DOjruKM4Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <07e3277e-b736-c6a8-2e09-a19e3bb9eea4@kaod.org>
Date: Fri, 11 Jan 2019 13:55:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CADiuDAQ-cUMyHWbkrSVucmb2BRusaCP-OkQs0JG78DOjruKM4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10540111981332302763
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 11 Jan 2019 13:02:36 -0000

On 1/11/19 1:30 PM, Christian Svensson wrote:
> Ping. What's left to be done here?

Nothing. I have merged the update in my patch.

Thanks,

C.

> On Mon, Nov 12, 2018 at 3:52 PM Christian Svensson <blue@cmd.nu <mailto:blue@cmd.nu>> wrote:
> 
>     Hi,
> 
>     Thanks for the review.
> 
>     On Mon, Nov 12, 2018 at 3:39 PM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
>     > The datasheet is not very clear on the topic.
> 
>     I won't argue there.
> 
>     > and one could understand that under Normal DMA operation, there is
>     > no Checksum accumulation.
> 
>     Indeed, that's what I thought as well. Then my question to myself was that
>     since that means that you can either 1) transfer data or 2) calculate the
>     checksum it seems like a pretty useless feature.
> 
>     If you look at 8.6.2 DMA CheckSum Calculation Mode (for ast2400 at least) you
>     see the sentence:
>     > 5. FMC80[2] is set when only checksum calculation is necessary, no data movement
> 
>     Which I take to read that you can execute the whole section and you will
>     get a checksum + data transfer, but if you set FMC80[2] then you get the
>     checksum, but no data movement.
> 
>     > do you have a firmware doing so you could share ? I would like to check
>     > for the ast2500.
> 
>     I have my own firmware here:
>     https://github.com/u-root/u-bmc/blob/07979a696df4351ec6dbb424ca80a5ebcc2eda1d/platform/ast2400/boot/main.S
> 
>     Cheers,
> 
