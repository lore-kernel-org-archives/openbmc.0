Return-Path: <SRS0=eJOo=HD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703D6C433DB
	for <openbmc@archiver.kernel.org>; Mon,  1 Feb 2021 07:39:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D35F64E32
	for <openbmc@archiver.kernel.org>; Mon,  1 Feb 2021 07:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D35F64E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTfvh57mgzDrQ8
	for <openbmc@archiver.kernel.org>; Mon,  1 Feb 2021 18:38:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTftK1VGSzDr0l
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 18:37:43 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1117VJgi007233;
 Mon, 1 Feb 2021 15:31:19 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Feb
 2021 15:37:27 +0800
Date: Mon, 1 Feb 2021 07:37:24 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
Message-ID: <20210201073724.GA2623538@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
 <20210128072947.GB2594588@aspeedtech.com>
 <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1117VJgi007233
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Andrew,

The 02/01/2021 07:19, Andrew Jeffery wrote:
> 
> 
> On Thu, 28 Jan 2021, at 17:59, Troy Lee wrote:
> > Hi Andrew,
> > 
> > The 01/28/2021 07:14, Andrew Jeffery wrote:
> > > 
> > > 
> > > On Wed, 27 Jan 2021, at 20:13, Troy Lee wrote:
> > > > Hi team,
> > > > 
> > > > For security consideration, user might want to disable AST2500/AST2600 
> > > > P2A functionality by default. To compensate the effect to 
> > > > phosphor-ipmi-flash, we're planning to support two alternative in-band 
> > > > firmware upgrade over PCIe for AST2500/AST2600 (AST2520 and AST2620 are 
> > > > excluded):
> > > >  - Through a reserved **VGA** memory on BAR[0], or
> > > >  - Through a reserved **PCIe** shared memory on BAR[1]
> > > > 
> > > > The usage pretty much the same as P2A, but it runs on different BAR, 
> > > > offset and length.
> > > > This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I 
> > > > create new **interfaces**, e.g. astpcie/astvga?
> > > > 
> > > 
> > > This is the HOST2BMC functionality in the 2600 datasheet?
> > > 
> > > It would be great to have more detail on how it works.
> > > 
> > > Andrew
> > 
> > No, it doesn't use HOST2BMC interface, it uses VGA controller's mmio.
> > Perhaps HOST2BMC is also a possible solution, too.
> > 
> > 02:00.0 0300: 1a03:2000 (rev 51) (prog-if 00 [VGA controller])
> >         Subsystem: 1a03:2000
> >         Flags: bus master, medium devsel, latency 0, IRQ 16
> >         Memory at f6000000 (32-bit, non-prefetchable) [size=16M]  <--- Option 1
> >         Memory at f7040000 (32-bit, non-prefetchable) [size=128K] <--- Option 2
> >         I/O ports at e000 [size=128]
> >         Expansion ROM at 000c0000 [disabled] [size=128K]
> >         Capabilities: [40] Power Management version 3
> >         Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
> >         Kernel driver in use: ast
> >         Kernel modules: ast
> > 
> > Option 1 allocates a 1MB memory from the end of VGA memory, so it will
> > need some change to VBIOS.
> > 
> > Option 2 allocates a 4K memory from BMC memory space. Since the buffer
> > is smaller, the ipmi-blob protocol overhead will be greater.
> > 
> 
> Okay. So for Option 2 we need to coordinate on the BMC by reserving memory in 
> the devicetree. What's the plan there? Where's that going to be documented?
> 
> Andrew

You make a very good point, I should propose the design document before
finilize the implementation. 

For option 2, we need to coordinate a 4K buffer from device tree, let's
say:

```
reserved-memory {
    pcie_ssm_memory: region@98000000 {
        no-map;
        reg = <0x98000000 0x00001000>; /* 4K */
    };
};

pcie_ssm {
    compatible = "aspeed,ast2600-pcie-sharedmem";
    status = "okay";
    memory-region = <&pcie_ssm_memory>;
};
```

When initialing the pcie-sharedmem driver, the driver will fills the
reserved memory address into:
 - SCUC48 if the soc is AST2600
 - SCU194 if the soc is AST2500

When the host runs burn_my_bmc (phosphor-ipmi-flash/tool), bmc will open 
the window when recieve blobSessionOpen command by setting:
 - SCUC24[8] to 1 if the soc is AST2600
 - SCU184[8] to 1 if the soc is AST2500

The host start copy firmware image into VGA PCIe BAR[1]+0xE000 with 4K
size, then host issues a blobWrite to BMC. BMC copys the firmware data
from reserved memory region then acknowledge the host ipmi command. This
procedure will run repeatedly until all firmware image are sented.

The host sends a blobSession close to close the shared memory
window, then follows by a blobCommit to indicate the file is copyed.


Sequence diagram:
```
 +-------------+                                         +------------+
 | burn my bmc |                                         | ipmi hostd |
 +-------------+                                         +------------+
        |                                                       |
        |             blobOpen                                  |
        +------------------------------------------------------>+
        |                                                       |
        |             blobSessionOpen                          +-+
        +----------------------------------------------------->| |
        |                                                      | +-+ IOCTL OpenWindow
        |                            +-----------------+       | | | SCUC24[8] = 1
        |                            | PCIe Shared Mem |       | | | (SCU184[8] = 1)
        |                            | BAR[1] + 0xE000 <-------+ <-+
        |                            +-----------------+       | |
        |                                     |                | |
        |             blobSession ACK         |                | |
        +<-----------------------------------------------------+-+
        |                                     |                 |
+---------------------------------------------------------------------+
|loop/  |                                     |                 |     |
+---+   | memcpy(BAR[1]+0xE000, IMG+offset, size)               |     |
|       +------------------------------------>+                 |     |
|       |             blobWrite               |                +-+    |
|       +----------------------------------------------------->| |    |
|       |                                     |    memcpy()    | |    |
|       |                                     +<---------------+ |    |
|       |             blobWrite ACK           |                | |    |
|       +<-----------------------------------------------------+-+    |
|       |                                     |                 |     |
|       |                                     |                 |     |
|       |                                     |                 |     |
+---------------------------------------------------------------------+
        |                                     |                 |
        |             blobSessionClose        |                +-+
        +----------------------------------------------------->+ +-+ IOCTL CloseWindow
        |                                     |                | | | SCUC24[8] = 0
        |                                     |                | | | (SCU184[8] = 0)
        |                                     |                | +<+
        |                                     |                | |
        |                                     X<---------------+-+
        |             blobCommit                                |
        +------------------------------------------------------->
        |                                                       |
        |                                                       |
        |                                                       |
        +                                                       +
```

Thanks,
Troy Lee
