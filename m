Return-Path: <SRS0=668v=IF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D9C433DB
	for <openbmc@archiver.kernel.org>; Sun,  7 Mar 2021 01:37:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0741650BA
	for <openbmc@archiver.kernel.org>; Sun,  7 Mar 2021 01:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0741650BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtPHH488wz3d4K
	for <openbmc@archiver.kernel.org>; Sun,  7 Mar 2021 12:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 337 seconds by postgrey-1.36 at boromir;
 Sun, 07 Mar 2021 12:37:31 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtPGz2Vpjz30Jt
 for <openbmc@lists.ozlabs.org>; Sun,  7 Mar 2021 12:37:31 +1100 (AEDT)
Received: from pecola.lan (180-150-121-66.b49679.per.nbn.aussiebb.net
 [180.150.121.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1EC8C3FFC6;
 Sat,  6 Mar 2021 20:31:51 -0500 (EST)
Message-ID: <8301a30c6dc065c266c1a028b6c173b427055f82.camel@codeconstruct.com.au>
Subject: Re: BIOS/UEFI host firmware interfaces into OpenBMC (x86)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Sun, 07 Mar 2021 09:31:51 +0800
In-Reply-To: <DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Mike,

> We could add the vendor specific support we need into our OpenBMC
> port to handle our UEFI firmware’s POST-time data transfers, but
> would prefer to first understand if there’s an emerging consensus
> on what replaces IPMI over KCS for x86.

We've implemented a PLDM-over-MCTP stack for host-firmware-to-BMC
communication:

 https://github.com/openbmc/docs/blob/master/designs/mctp/mctp.md

for the PLDM specifics:

 https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md


> From what I can tell from reading, the Open Power folks are going
> with PLDM over MCTP over some interface (KCS or BT?) to enable host
> firmware to BMC comms.

This isn't really OpenPOWER-specific; you should be able to do the same
on x86, where just the hardware channel can be platform-specific.

In the implementations I've been working on, the hardware binding is a
hybrid of the KCS channel (for synchronisation) plus the AST2x00
hardware-based LPC memory-map (for the data transfers):

  https://github.com/openbmc/libmctp/blob/master/astlpc.c

- where that same code can be used on both the host-firmware and BMC
sides, and should be fine for x86.

We have a serial MCTP binding implemented too, and there's also some
development happening on an i2c binding, if either of those are a
better fit.

Cheers,


Jeremy

