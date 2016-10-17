Return-Path: <clg@kaod.org>
Received: from 10.mo1.mail-out.ovh.net (10.mo1.mail-out.ovh.net
 [178.32.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy7tx5bC1zDt8w
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 17:43:05 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9648714BDE
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:42:56 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id A5D2B2A0073;
 Mon, 17 Oct 2016 08:42:53 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 12/12] mtd: spi-nor: aspeed: use fast read
 when doing DMAs
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-13-git-send-email-clg@kaod.org>
 <CACPK8Xf0sLXLkfV_rGVZ6ppLN0590d3TTugYCTrT4sMNe5XBAA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <15dbb415-1b10-da15-ede9-184e99304ab3@kaod.org>
Date: Mon, 17 Oct 2016 08:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf0sLXLkfV_rGVZ6ppLN0590d3TTugYCTrT4sMNe5XBAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8281838241329286043
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedugdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 17 Oct 2016 06:43:06 -0000

Hello Joel,

On 10/17/2016 07:04 AM, Joel Stanley wrote:
> On Fri, Oct 14, 2016 at 11:08 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Try to improve the speed of transfers when doing DMAs
> 
> This could get squashed into the DMA adding patch I think.

If you haven't pushed yet, you can drop this one, it does not 
change anything in fact. 

I am currently looking at introducing some timing support 
to speed up reading on the SPI, like pflash does and I am 
shuffling the code quite a lot to isolate the different settings.

 
Just to say they are more changes to come to cleanup the driver.

Thanks for the review,

C.

> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
