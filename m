Return-Path: <clg@kaod.org>
X-Greylist: delayed 61219 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Mar 2017 17:59:53 AEDT
Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [87.98.181.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vshbY1y1MzDqZR
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 17:59:52 +1100 (AEDT)
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 8251175D84
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 08:59:49 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 5207C4E0073;
 Tue, 28 Mar 2017 08:59:48 +0200 (CEST)
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
 <1490682729.3177.105.camel@kernel.crashing.org>
 <ac565241-2806-67dc-fc34-7fdcc08d8a2a@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <33bfcaea-ad18-3a19-5eb5-2f9e28bb6704@kaod.org>
Date: Tue, 28 Mar 2017 08:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <ac565241-2806-67dc-fc34-7fdcc08d8a2a@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 712976116465699586
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrkedvgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 28 Mar 2017 06:59:53 -0000

On 03/28/2017 08:47 AM, Cédric Le Goater wrote:
> On 03/28/2017 08:32 AM, Benjamin Herrenschmidt wrote:
>> On Tue, 2017-03-28 at 08:28 +0200, Cédric Le Goater wrote:
>>> Simply, 'iperf -s' on the BMC  and 'iperf -c' on some other machine.
>>>
>>> Your v3 fixed the issue and iperf now finds :
>>>
>>>         ~76 Mbits/sec on the AST2500 
>>>         ~32 Mbits/sec on the AST2400.
>>
>> Remove all the stupid debug options in your kernel config, and you'll
>> get >400Mbit on the 2500 :-) I get about 200 on a Firestone with a
>> 2400 (after manually hacking the RGMII clock delays to make it work
>> at 1000bT).
> 
> Sigh. is it that bad :/ OK. Let's do some tuning.  I will tell you
> what I get.

so, with a large cleanup under "Kernel hacking", we get close to 400Mbit
on the 2500.

Cheers,
C.
