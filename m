Return-Path: <clg@kaod.org>
X-Greylist: delayed 9902 seconds by postgrey-1.35 at bilbo;
 Fri, 27 May 2016 21:50:59 AEST
Received: from 6.mo179.mail-out.ovh.net (6.mo179.mail-out.ovh.net
 [46.105.56.76])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rGPVC31ZFzDqbk
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 21:50:58 +1000 (AEST)
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id E7441FF851B
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 13:50:52 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 6DD291C00A4;
 Fri, 27 May 2016 13:50:45 +0200 (CEST)
Subject: Re: updating u-boot_2013.07.bb recipe
To: Joel Stanley <joel@jms.id.au>
References: <57480C2F.4090902@kaod.org>
 <CACPK8Xe6Cu-7+1bKd3DaNcGbv4+BhW_nziA=TVgU8A6STRGzDg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Milton D. Miller II" <miltonm@us.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57483488.1040401@kaod.org>
Date: Fri, 27 May 2016 13:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe6Cu-7+1bKd3DaNcGbv4+BhW_nziA=TVgU8A6STRGzDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3790623514071108480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrgeejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 27 May 2016 11:50:59 -0000

Hello Joel,

On 05/27/2016 12:13 PM, Joel Stanley wrote:
> Hey Cedric,
> 
> On Fri, May 27, 2016 at 6:28 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> The uboot recipe in openbmc is still at 4b44678c11. Without them, I see
>> memory corruption under qemu, so I suppose this is the same for real HW.
>>
>> commit 6f7818cdb8d8 "net: aspeednic: Do not start hardware in initialize"
>> seems to solve the problem.
>>
>> Is there a reason for staying at that level in uboot ? Could we take all
>> Milton's patches in ?
> 
> We updated to 44f1262bdf39ad93032d39f17a298165372be82e just yesterday:
> 
>  https://github.com/openbmc/openbmc/commit/265b0d55113d364554102d532177916741c8c379

Ah. I missed that.

So, I baked a new flash and all is fine now. The generated flash boots 
the qemu guest without modification. 

> The hold up related to some discussion around not going back to the
> default compiler:
> 
>  https://github.com/openbmc/openbmc/pull/227
> 
> I see Patrick closed this yesterday. I'm not sure what the plans are
> there; I would strongly recommend we go back to the more modern compiler.

u-boot.bin boots a palmetto bmc when compiled with :

	gcc version 5.2.0 (crosstool-NG crosstool-ng-1.22.0)

I didn't try the kernel though.

Cheers,

C.
