Return-Path: <clg@kaod.org>
X-Greylist: delayed 6899 seconds by postgrey-1.35 at bilbo;
 Fri, 24 Jun 2016 19:14:02 AEST
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbXhB0f4HzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 19:14:01 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BE959FF9618
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 09:18:57 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 9EDD82C0093;
 Fri, 24 Jun 2016 09:18:54 +0200 (CEST)
Subject: Re: [PATCH qemu 00/12] SMC and network support
To: Joel Stanley <joel@jms.id.au>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
 <CACPK8Xc_5G2c2-twjJYfpUBK7GfqWAHuFetydJQOrY9-9cNyGg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5ca52c5c-9370-f38e-2a45-0969d0ed7592@kaod.org>
Date: Fri, 24 Jun 2016 09:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc_5G2c2-twjJYfpUBK7GfqWAHuFetydJQOrY9-9cNyGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16060117747738381227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdejgdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 24 Jun 2016 09:14:02 -0000

On 06/24/2016 09:06 AM, Joel Stanley wrote:
> Hi Cedric,
> 
> On Fri, Jun 24, 2016 at 2:30 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> Here is a quick update as I just did a rebase of my branch on mainline qemu
>> (commit c7288767523f) :
>>
>>         https://github.com/legoater/qemu/commits/aspeed
>>
> 
> Nice work! Good to see the long list of patches on their way upstream.
> 
>> To give it a try, use :
>>
>>         $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
>>                 -drive file=flash-palmetto,format=raw,if=mtd \
>>                 -drive file=palmetto.pnor,format=raw,if=mtd \
>>                 -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu
>>                 -serial stdio
> 
> I gave this a go and got:
> 
> qemu-system-arm: Initialization of device mx25l25635f failed: failed
> to read the initial flash content

This is an issue with the flash image. Is the path correct ? the permissions ? 

> HEAD is ba7a28c66ec35d0a021b2182613e2cb26706d8a4.

Looks good.

C. 
