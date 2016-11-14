Return-Path: <clg@kaod.org>
Received: from mo4.mail-out.ovh.net (mo4.mail-out.ovh.net [178.32.228.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHVPy3d70zDvvP
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 23:36:38 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 178931CFF0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 13:29:55 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 1A1CE180074;
 Mon, 14 Nov 2016 13:29:53 +0100 (CET)
Subject: Re: [PATCH] arm: dts: Add pnor label for wspoon and romulus
To: Joel Stanley <joel@jms.id.au>
References: <20161111040238.5972-1-joel@jms.id.au>
 <85fa06da-c4d9-e64d-c5af-141f7aa5e074@kaod.org>
 <CACPK8XeUh65FM9OC45FZnwVSwLN1ZF7Z5zfasNurHzdBfVKGvA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyril.bur@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <932fb723-6330-def0-0cc1-02a190535e00@kaod.org>
Date: Mon, 14 Nov 2016 13:29:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeUh65FM9OC45FZnwVSwLN1ZF7Z5zfasNurHzdBfVKGvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12556880188757019540
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedruddtgdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 14 Nov 2016 12:36:39 -0000

On 11/14/2016 06:21 AM, Joel Stanley wrote:
> On Fri, Nov 11, 2016 at 6:32 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> So, according to :
>>
>>         Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>         Documentation/devicetree/bindings/mtd/partitions.txt
>>
>> we can not label the flash module node but we can label the
>> partition instead. Would a patch like below fit the need ?
>> Here is what we get on a palmetto and an EVB, the approach
>> are different.
> 
> Okay. That's annoying.
> 
> Is there a reason we can't coax the ast2400 version to call it just
> 'pnor' as well?

none. that was a proposal for different solutions.

>>
>>         root@palmetto:~# cat /proc/mtd
>>         dev:    size   erasesize  name
>>         mtd0: 00060000 00001000 "u-boot"
>>         mtd1: 00020000 00001000 "u-boot-env"
>>         mtd2: 00280000 00001000 "kernel"
>>         mtd3: 001c0000 00001000 "initramfs"
>>         mtd4: 01740000 00001000 "rofs"
>>         mtd5: 00400000 00001000 "rwfs"
>>         mtd6: 02000000 00010000 "1e630000.spi:pnor@0"

we can do a strstr when parsing /proc/mtd. This is probably the 
best solution to simply handle compatibility.

>>         root@evb-ast2500:~# cat /proc/mtd
>>         dev:    size   erasesize  name
>>         mtd0: 00060000 00001000 "u-boot"
>>         mtd1: 00020000 00001000 "u-boot-env"
>>         mtd2: 00280000 00001000 "kernel"
>>         mtd3: 001c0000 00001000 "initramfs"
>>         mtd4: 01740000 00001000 "rofs"
>>         mtd5: 00400000 00001000 "rwfs"
>>         mtd6: 02000000 00010000 "pnor"

The problem here is that we need to know the size of the pnor ... 

>>
>> The partition definitions probably belongs to the machine dts.
>>
>> And a udev rules would also fit the purpose I think.
> 
> What would you suggest? A symlink to create a /dev/pnor node?

yes. like we did for the vuart. we will need to find a udev 
attribute for it. I think this is the cleanest. 

Cheers,

C. 


> 
> Cheers,
> 
> Joel
> 
