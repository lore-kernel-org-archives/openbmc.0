Return-Path: <clg@kaod.org>
Received: from mo53.mail-out.ovh.net (mo53.mail-out.ovh.net [178.32.228.53])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW8jQ3pbbzDqsT
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 15:59:53 +1000 (AEST)
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 24109FF8FDC
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:52:47 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 1A95862008C;
 Fri, 17 Jun 2016 07:52:43 +0200 (CEST)
Subject: Re: Flashing U-Boot using DediProg(R) on Aspeed AST2500 EVB
To: Joel Stanley <joel@jms.id.au>, Shay Slobodkin <shays@mellanox.com>
References: <CACPK8Xft-LvtjE9gQ7a0WD+5kD_wLfOYiBfCjoytHD3huWg7LA@mail.gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5763902B.9050106@kaod.org>
Date: Fri, 17 Jun 2016 07:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xft-LvtjE9gQ7a0WD+5kD_wLfOYiBfCjoytHD3huWg7LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10389241390457916162
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrkeelgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 17 Jun 2016 05:59:55 -0000

On 06/17/2016 07:32 AM, Joel Stanley wrote:
> Hi Shay,
> 
> On Wed, Jun 15, 2016 at 9:39 PM, Shay Slobodkin <shays@mellanox.com> wrote:
>> Recently we had some problems with our AST2500 EVB U-Boot.
>>
>> Had several systems gone bad.
>>
>> We want to use the DediProg® tool in order to recover.
>>
>> If you have used this tool, could you please explain briefly how to use it
>> with Aspeed AST2500 EVB?
> 
> I've not done this myself on the evb.
> 
> Looking at the board, you want header J70 is for the ast2500 boot
> flash. It's a 5 pin connector on the south west area of the board. The
> pins are labeled in the order: CS0, Clock, MOSI, MISO, Ground.

Yes. It works pretty well from a raspberry pi. I also have used a 
Flashcat programmer. 

You should make sure that the board is not booting from the flash 
module. For that you need to unselect the flash chip, CS0 on header J44. 

> If you need further help perhaps send a photo of your programmer and
> whatever cables it came with.

and one of your board perhaps. With details of what is around the 
flash.

Cheers,

C. 
 
> Cheers,
> 
> Joel
> 
