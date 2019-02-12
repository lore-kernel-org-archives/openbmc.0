Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.52.148; helo=10.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 519 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Feb 2019 19:27:19 AEDT
Received: from 10.mo5.mail-out.ovh.net (10.mo5.mail-out.ovh.net
 [46.105.52.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zG3q1nHNzDqLC
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 19:27:17 +1100 (AEDT)
Received: from player772.ha.ovh.net (unknown [10.109.159.69])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id B900521B559
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:18:34 +0100 (CET)
Received: from kaod.org (102.221.90.212.static.wline.lns.sme.cust.swisscom.ch
 [212.90.221.102]) (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 9735D296C83B;
 Tue, 12 Feb 2019 08:18:31 +0000 (UTC)
Subject: Re: Issues with SPI NOR flash
To: Andrew Jeffery <andrew@aj.id.au>, Aaron Williams <awilliams@marvell.com>, 
 openbmc@lists.ozlabs.org
References: <2947580.vCq4SJ4yDf@awilliams-suse>
 <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <89d815b2-2b9f-b132-5a9d-c4995b7637dd@kaod.org>
Date: Tue, 12 Feb 2019 09:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9320480903886244610
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrledvgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 12 Feb 2019 08:27:19 -0000

Hello,

On 2/11/19 11:57 PM, Andrew Jeffery wrote:
> Hi Aaron,
> 
> On Tue, 8 Jan 2019, at 21:52, Aaron Williams wrote:
>> Hi all,
>>
>> I'm running into a problem with the SPI NOR connected to our host processor. 
>> We're using a Macronix MX25L25645GMI-08G connected to the spi1 device on an 
>> AST2500. This device is muxed between our host processor and the BMC. When our 
>> host processor is powered off, the BMC has exclusive access to it.

yes but there could be different (incompatible) states in the SPI controller 
drivers on each kernel (BMC, Host) and in the flash module as well. That is 
why having only one side doing the control is usually preferred.  

>> Anyway, the behavior is that I can read the SPI NOR without any difficulty, 
>> however, when I write to it the SPI nor appears to be filled with garbage. 
>> I had to guess, I'd guess that the SPI driver is not waiting for the SPI NOR 
>> to complete the write operation before moving to the next block.

When the host is powered off, you seem to be able to read the PNOR correctly, 
(I assume you did the write from the host side then) but the first write from 
the BMC trashes the contents ?  

>> Here is the relevant section from our device tree:
>>
>> &spi1 {
>> 	status = "okay";
>> 	flash@0 {
>> 		status = "okay";
>> 		compatible = "jedec,spi-nor", "spi-nor";
>> 		label = "host";
>> 		m25p,fast-read;
>> 		spi-tx-bus-width = <1>;
>> 		spi-rx-bus-width = <1>;
>> 		spi-max-frequency = <50000000>;
>> 		partitions {
>> 			compatible = "fixed-partitions";
>> 			#address-cells = <1>;
>> 			#size-cells = <1>;
>>
>> 			bootloader@0 {
>> 				reg = <0x0 0x1000000>;
>> 				label = "host-
>> bootloader";
>> 			};
>> 			kernel@1000000 {
>> 				reg = <0x1000000 
>> 0x1000000>;
>> 				label = "host-kernel";
>> 			};
>> 		};
>> 	};
>> };
>>
>> Note that our host is also running 4.19 and has no trouble writing to the SPI 
>> NOR. The corruption seems worse when flashcp is used compared to just cp. I 
>> noticed that flashcp writes in 4K blocks. The Macronix device has a 256 byte 
>> page buffer. I have tried slowing down the bus to 5MHz and that made no 
>> difference. Note that we are currently using single bit mode for both the host 
>> and BMC processors for this flash, though we plan to move to move to QPI on 
>> the host processor later.

What about 4BYTE mode ? have you checked in which mode the flash device is 
left by the host ? That could be a problem. 

C. 

>> Before the write operation the host processor has not had any access to the 
>> SPI NOR. The host is powered down and the BMC is rebooted to force a clean 
>> state.
>>
> 
> Did you find the problem? I've added Cédric to Cc in case you haven't - he
> should be able to answer questions about the flash stack.
> Andrew
> 
