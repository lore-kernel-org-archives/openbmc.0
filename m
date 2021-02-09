Return-Path: <SRS0=BdHF=HL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10275C433DB
	for <openbmc@archiver.kernel.org>; Tue,  9 Feb 2021 09:08:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D798F64E99
	for <openbmc@archiver.kernel.org>; Tue,  9 Feb 2021 09:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D798F64E99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZcWM0n3ZzDsgW
	for <openbmc@archiver.kernel.org>; Tue,  9 Feb 2021 20:08:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZcTk6KjNzDsc2
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 20:07:04 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 11990HW5034447
 for <openbmc@lists.ozlabs.org>; Tue, 9 Feb 2021 17:00:17 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Feb
 2021 17:06:55 +0800
Date: Tue, 9 Feb 2021 09:06:55 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
Message-ID: <20210209090655.GA1147175@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
 <20210128072947.GB2594588@aspeedtech.com>
 <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
 <20210201073724.GA2623538@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210201073724.GA2623538@aspeedtech.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 11990HW5034447
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Team,

While I'm evaluating the performance for the design, I notice that the
maximum IPMI through/put over KCS / IPMB / LAN is about 120 command per
second. Does anyone know where the bottleneck is?

If we wants to send 64MB image through 4K memory buffer, it takes 2^14
ipmi blobWrite commands. With the through/put mentioned above, it will
need about 2 min to send just "IPMI" commands. The image copy to memory
just takes few seconds. I'd like to know if I could do anything to
improve the IPMI through/put.

Thanks,
Troy Lee

The 02/01/2021 15:37, Troy Lee wrote:
> Hi Andrew,
> 
> You make a very good point, I should propose the design document before
> finilize the implementation. 
> 
> For option 2, we need to coordinate a 4K buffer from device tree, let's
> say:
> 
> ```
> reserved-memory {
>     pcie_ssm_memory: region@98000000 {
>         no-map;
>         reg = <0x98000000 0x00001000>; /* 4K */
>     };
> };
> 
> pcie_ssm {
>     compatible = "aspeed,ast2600-pcie-sharedmem";
>     status = "okay";
>     memory-region = <&pcie_ssm_memory>;
> };
> ```
> 
> When initialing the pcie-sharedmem driver, the driver will fills the
> reserved memory address into:
>  - SCUC48 if the soc is AST2600
>  - SCU194 if the soc is AST2500
> 
> When the host runs burn_my_bmc (phosphor-ipmi-flash/tool), bmc will open 
> the window when recieve blobSessionOpen command by setting:
>  - SCUC24[8] to 1 if the soc is AST2600
>  - SCU184[8] to 1 if the soc is AST2500
> 
> The host start copy firmware image into VGA PCIe BAR[1]+0xE000 with 4K
> size, then host issues a blobWrite to BMC. BMC copys the firmware data
> from reserved memory region then acknowledge the host ipmi command. This
> procedure will run repeatedly until all firmware image are sented.
> 
> The host sends a blobSession close to close the shared memory
> window, then follows by a blobCommit to indicate the file is copyed.
> 
> 
> Sequence diagram:
> ```
>  +-------------+                                         +------------+
>  | burn my bmc |                                         | ipmi hostd |
>  +-------------+                                         +------------+
>         |                                                       |
>         |             blobOpen                                  |
>         +------------------------------------------------------>+
>         |                                                       |
>         |             blobSessionOpen                          +-+
>         +----------------------------------------------------->| |
>         |                                                      | +-+ IOCTL OpenWindow
>         |                            +-----------------+       | | | SCUC24[8] = 1
>         |                            | PCIe Shared Mem |       | | | (SCU184[8] = 1)
>         |                            | BAR[1] + 0xE000 <-------+ <-+
>         |                            +-----------------+       | |
>         |                                     |                | |
>         |             blobSession ACK         |                | |
>         +<-----------------------------------------------------+-+
>         |                                     |                 |
> +---------------------------------------------------------------------+
> |loop/  |                                     |                 |     |
> +---+   | memcpy(BAR[1]+0xE000, IMG+offset, size)               |     |
> |       +------------------------------------>+                 |     |
> |       |             blobWrite               |                +-+    |
> |       +----------------------------------------------------->| |    |
> |       |                                     |    memcpy()    | |    |
> |       |                                     +<---------------+ |    |
> |       |             blobWrite ACK           |                | |    |
> |       +<-----------------------------------------------------+-+    |
> |       |                                     |                 |     |
> |       |                                     |                 |     |
> |       |                                     |                 |     |
> +---------------------------------------------------------------------+
>         |                                     |                 |
>         |             blobSessionClose        |                +-+
>         +----------------------------------------------------->+ +-+ IOCTL CloseWindow
>         |                                     |                | | | SCUC24[8] = 0
>         |                                     |                | | | (SCU184[8] = 0)
>         |                                     |                | +<+
>         |                                     |                | |
>         |                                     X<---------------+-+
>         |             blobCommit                                |
>         +------------------------------------------------------->
>         |                                                       |
>         |                                                       |
>         |                                                       |
>         +                                                       +
> ```
> 
> Thanks,
> Troy Lee
