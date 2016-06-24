Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rblnD5zBgzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 03:34:08 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 54A71FF92A8
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 19:18:24 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 17CFA2C0097;
 Fri, 24 Jun 2016 19:18:21 +0200 (CEST)
Subject: Re: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed
 g5 register interface
To: Joel Stanley <joel@jms.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-4-git-send-email-andrew@aj.id.au>
 <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
 <575AADB9.5050501@kaod.org> <bfac8b51-733c-e7e7-635f-bbae2b0d6a8c@kaod.org>
 <CACPK8Xder8cQfN6ZGsqRdZ_KzNCz-TebYtXXfSP652Y2ici4CQ@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <69d6266c-450e-e85c-9a29-783980e90765@kaod.org>
Date: Fri, 24 Jun 2016 19:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xder8cQfN6ZGsqRdZ_KzNCz-TebYtXXfSP652Y2ici4CQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7737184162586135382
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 17:34:09 -0000

On 06/24/2016 09:28 AM, Joel Stanley wrote:
> Hey Cedric,
> 
> On Fri, Jun 24, 2016 at 2:39 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>> So, given that there always has been fixes from Aspeed on the driver in
>>> u-boot (see below), it seems that these EDO bits have been wrong since
>>> the beginning in Linux.
>>>
>>> I am wondering what how this was working. We should probably contact
>>> Aspeed to have some clarification.
>>
>> Aspeed said that they have a different design than Faraday and we should
>> be using :
>>
>>         #define FTGMAC100_TXDES0_EDOTR          (1 << 30)
>>         #define FTGMAC100_RXDES0_EDORR          (1 << 30)
>>
>> for all boards : ast2400 *and* ast2500.
>>
>> I gave it a try on a palmetto and indeed, network works fine with the
>> Aspeed EDO{T,R}R bits.
> 
> Nice investigation. Thank you for doing that.

Yes. Well, the Linux driver is consistent with U-Boot now.

> I have sent a revised patch for the kernel that incorporates Andrew's
> work with your findings.
> 
>  https://lists.ozlabs.org/pipermail/openbmc/2016-June/003876.html
>  https://lists.ozlabs.org/pipermail/openbmc/2016-June/003877.html
> 
> Please review and add your tags, and I'll update the branch with the fixes.

done.

> If you want to do something similar for u-boot then please go ahead.

yes. I would like first to revise the u-boot device model I could not
get working in both environment. With the kernel above, that should 
be better.

And then, U-Boot will get some aesthetic surgery, for sure :)

Thanks a lot,

C. 

> Otherwise I'll do it on Monday.
> 
> Cheers,
> 
> Joel
> 
