Return-Path: <clg@kaod.org>
X-Greylist: delayed 3600 seconds by postgrey-1.36 at bilbo;
 Sun, 15 Jan 2017 06:17:40 AEDT
Received: from 4.mo4.mail-out.ovh.net (4.mo4.mail-out.ovh.net [178.32.98.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v18QX503FzDqXr
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 06:17:40 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 69FF922986
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jan 2017 18:22:34 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 4623C18006D;
 Sat, 14 Jan 2017 18:22:33 +0100 (CET)
Subject: Re: [PATCH linux v2 0/3] ASPEED SPI driver support for dual IO mode
To: Rob Lippert <roblip@gmail.com>
References: <20170110225555.117814-1-rlippert@google.com>
 <b3b47fb6-3d73-c7a4-064f-d5ccbbd27b1a@kaod.org>
 <CAN+5HW0+CGrw5VSvGqk7hjYEznUxtUecpL3hQCjL=KqtHPXZrw@mail.gmail.com>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <80f54af1-4d8f-6d3a-90a8-d37bf2ae0488@kaod.org>
Date: Sat, 14 Jan 2017 18:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAN+5HW0+CGrw5VSvGqk7hjYEznUxtUecpL3hQCjL=KqtHPXZrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6798746590042688258
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrfeefgddvfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuoehnohhnvgeqnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Sat, 14 Jan 2017 19:17:41 -0000

>> could you please give a quick try to this kernel :
>>
>>         https://github.com/legoater/linux/commits/openbmc-4.7
>>
>> This is an openbmc 4.7 kernel with a backport of the mainline smc
>> driver, dma support, fastread support and your dual io support.
>>
>> I have tested it on a palmetto and an ast2500 evb but I don't have
>> the HW you use.
> 
> Tested it after fixing a compilation error for
> s/CONTROL_SPI_IO/CONTROL_IO/ and it works on Zaius board.

ah. my bad. Thanks for fixing. I will update the tree.

> But it seems to be a bit slower, about half as fast as I saw before.
> I think it is due to your branch missing this commit from the openbmc
> tree:
> 
> 423ac0dc0117f411244c38b7a351664a4c30c19a mtd: spi-nor: aspeed: rework
> io routines

hmm, mainline asked for a rewrite of these. I will take a closer look.

Thanks,

C. 
