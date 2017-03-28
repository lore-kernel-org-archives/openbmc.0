Return-Path: <clg@kaod.org>
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vshGP6p5KzDqZR
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 17:45:01 +1100 (AEDT)
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 89E906C181
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 08:44:58 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 679514E0077;
 Tue, 28 Mar 2017 08:44:57 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 6/6] mtd: spi-nor: aspeed: optimize read
 mode
To: benh@au1.ibm.com, openbmc@lists.ozlabs.org
References: <1490366683-23401-1-git-send-email-clg@kaod.org>
 <1490366683-23401-7-git-send-email-clg@kaod.org>
 <1490611006.3177.74.camel@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e63b7c52-cb36-d599-0253-02937e1abe62@kaod.org>
Date: Tue, 28 Mar 2017 08:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490611006.3177.74.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 462181914322373378
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrkedvgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenuc
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
X-List-Received-Date: Tue, 28 Mar 2017 06:45:02 -0000

On 03/27/2017 12:36 PM, Benjamin Herrenschmidt wrote:
> On Fri, 2017-03-24 at 15:44 +0100, Cédric Le Goater wrote:
>> Only for SPI controllers as U-Boot should have done it already for
>> the
>> FMC controller using DMAs.
>>
>> The algo first reads a golden buffer at low speed and then performs
>> reads with different clocks and delay cycles settings to find the
>> fastest configuration for the chip.
>>
>> Based on the pflash tool.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  TODO: may be add a chicken switch ? 
> 
> A module parameter (which can also be passed as a kernel command line
> arg) to disable it, yes.

I have added a kernel parameter in my branch :

	https://github.com/legoater/linux/commits/openbmc-4.10

Cheers,

C.
