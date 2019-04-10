Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.253.128; helo=13.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 20999 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Apr 2019 11:30:58 AEST
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fk4f3TPQzDq9n
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 11:30:54 +1000 (AEST)
Received: from player735.ha.ovh.net (unknown [10.109.146.173])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id E42DF168C58
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 18:02:03 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
 [86.201.133.22]) (Authenticated sender: clg@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 82D214A5D2BB;
 Wed, 10 Apr 2019 16:01:59 +0000 (UTC)
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
Date: Wed, 10 Apr 2019 18:01:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1403715709209316098
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudejgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2019 01:30:59 -0000

On 4/10/19 4:39 PM, Patrick Venture wrote:
> On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com> wrote:
>>>
>>> HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.6
>>> with the quanta-q71l board.  More specifically now my host can't talk
>>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, I
>>> can talk to ipmid file via dbus, and btbridge is running.
>>>
>>> Has anyone else run into weirdness?
>>
>> I've not seen that.
>>
>> My only guess is there is an issue with clocking. Can you try booting
>> the machine with clk_ignore_unused in your kernel command line?
> 
> I'll give it a shot, although IPMI not working is odd since the
> LPC_CLK is enabled.  But yeah, I'll try that today and reply back,
> thanks.

I don't see this issue on a palmetto, BMC running with 5.0.5.

C. 


> 
>>
>>>
>>> I am seeing:
>>>
>>> [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
>>> [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
>>>
>>> The dts file I'm using is basically identical to the upstream one, and
>>> my defconfig is also nearly identical to what's in meta-aspeed for the
>>> ast2400.
>>>
>>> Patrick
