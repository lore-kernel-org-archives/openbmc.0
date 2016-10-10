Return-Path: <clg@kaod.org>
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssshW3FQbzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:49:14 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 162F2136AD
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 09:32:21 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 991192A0067;
 Mon, 10 Oct 2016 09:32:19 +0200 (CEST)
Subject: Re: [PATCH u-boot 00/12] config cleanups and small fixes
To: Joel Stanley <joel@jms.id.au>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
 <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
 <CACPK8Xdafw1BiWn+QaJ+Dn13mhMJTaV3HF_G=0s4ofqoHZGDbA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce5094bb-9aa7-b4bd-a6a4-ee829d2c03f4@kaod.org>
Date: Mon, 10 Oct 2016 09:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdafw1BiWn+QaJ+Dn13mhMJTaV3HF_G=0s4ofqoHZGDbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4901323772669168386
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeejgddvkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 10 Oct 2016 07:49:15 -0000

On 10/10/2016 08:49 AM, Joel Stanley wrote:
> On Mon, Oct 10, 2016 at 5:24 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Fri, Oct 7, 2016 at 6:24 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>> On 10/06/2016 11:26 PM, Cédric Le Goater wrote:
>>>> Hello,
>>>>
>>>> Here is a set of cleanups on the configuration. It should ease the
>>>> port on v2016.11 which is a little more strict on CONFIG_ defines.
>>
>> Nice one! I had a look at all of the patches and they look good. I
>> will hold off on the last two relating to ramdisk until we see what
>> upstream say.
>>
>>>
>>> You will need this patch to start with :
>>>
>>>         https://github.com/legoater/u-boot/commit/d76a5e74286cd903c4eb96c3b5f762672121b02a
>>>
>>> forgot to send it :/
>>
>> No worries, I will include it.
> 
> I can't build the defconfig after applying your patches. I get the
> same result with your trees (05fffe5dc0ec39a11c918d1916d349708cd67cf8,
> 2d1d53622d3155193832992a11d84775e44190cf).
> 
> $ make ast_g4_nsci_defconfig
> board/aspeed/ast-g5/Kconfig:22:warning: config symbol defined without type

Yes. There is a warning. I tried to add some constants in the config file but
I am not sure this is the right way to do it.

> ***
> *** Can't find default configuration "arch/../configs/ast_g4_nsci_defconfig"!
> ***
> scripts/kconfig/Makefile:114: recipe for target 'ast_g4_nsci_defconfig' failed

hmm curious. I don't have this problem on the four platforms:

	ast2400_ncsi
	ast2400_phy
	ast2500_ncsi
	ast2500_phy

and the two branches,

	v2016.11-aspeed-openbmc
	v2016.09-aspeed-openbmc

I am using a f24 to  compile.

Cheers,

C.
