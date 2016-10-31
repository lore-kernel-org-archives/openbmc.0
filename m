Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lvX3hBMzDvNb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 18:13:27 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0E03217355
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 07:55:07 +0100 (CET)
Received: from hermes.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 737DF2A0070;
 Mon, 31 Oct 2016 07:55:02 +0100 (CET)
Subject: Re: [PATCH 0/3] Add QEMU support for the Epson rx8900 RTC
To: alastair@au1.ibm.com, openbmc@lists.ozlabs.org
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
Cc: Alastair D'Silva <alastair@d-silva.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a4462054-4aa7-d75d-a76e-e338f6f3c84b@kaod.org>
Date: Mon, 31 Oct 2016 07:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16918334954434300695
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrjeekgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 31 Oct 2016 07:13:28 -0000

On 10/27/2016 04:27 AM, alastair@au1.ibm.com wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This series adds preliminary support for the Epson rx8900 RTC.
> 
> Setting and retrieving time is supported, and the chip temperature
> is hardcoded.
> 
> Other features (in particular, those that require the interrupt line)
> are not implmented.

That's not too complex to do but you can keep that for a followup patch. 

I think you can send directly to mainline, after the few fixes. 

Cheers,

C. 

> Alastair D'Silva (3):
>   Add Epson RX8900 RTC support
>   Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
>   Add a unit test for RX8900 RTC (time functionality only)
> 
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/aspeed.c                 |   4 +
>  hw/arm/imx25_pdk.c              |   9 +-
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/rx8900.c               | 426 ++++++++++++++++++++++++++++++++++++++++
>  tests/Makefile.include          |   2 +
>  tests/rx8900-test.c             |  82 ++++++++
>  7 files changed, 521 insertions(+), 4 deletions(-)
>  create mode 100644 hw/timer/rx8900.c
>  create mode 100644 tests/rx8900-test.c
> 
