Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wi8Y5ept"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409NX51h4lzF291
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 18:52:20 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id d5so26421134iob.9
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 00:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0TWnfJ6X0wt274ynFhqtGTOCnDHAxzOV88X9T1XvCnM=;
 b=Wi8Y5eptk7xsVuAPKh7ojHve0dj28oB2auy+e6fAI6RQnEgo/kfCYDoCsqz/hdkJCx
 prgPe7azc0FojbxdCQY+26Biq1ZrKf0UXLgcMfbFzOxA1jtXDCu42edGOgF2bTYUacVw
 o4tSCmFuvlIFOX3QxbK+RMcdVXFajkfZBVSpVojwJMHocnn/kLr7q9IDoeJLzduT3CIh
 NQhS0QTEntyg8qSBM+PtBZPhKxE1XisQzTf9QKVB28aLenrN8XowhRQBWqN/71IBhT1A
 4/kojtmNExf85px4cibmPeJtYos3XJYeMN3lpJ7XN+5uKk1h119J7ZhIzPdpZpXkatD8
 us0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0TWnfJ6X0wt274ynFhqtGTOCnDHAxzOV88X9T1XvCnM=;
 b=r3aMUI7d2NyMlqvyjH6H55DKf93WNw+BP0xZJjRvhK07EJ5hk7t5EaMw2H1ZXk0AXe
 wApEZai2VVNjHmsBxzLd8B4CFBDDDIKPKhX3zuD4Ncm0QgrB3BIpLrScNIvMjQTUGCHm
 6QkdAyYL+BfWigZNlMdZBJaMaOiziagliQIRYeOTngta9RVGbyzipqYVKJ7bZxjX1omx
 dmz/b29v+yi9ebzgou+llw28k2IGIAo2+XYocTmJpccn8sZRt4Sukt28neCaot/e6mD1
 tN2K4TGt8Y5s3d7sxp03mqgcRFwQ+B9ap/QzZpMtpABMjzAx5m59kQXzKCAbyEm9aASh
 TMTw==
X-Gm-Message-State: AElRT7FHvp578SW6cQj48TJkXomJqoU18k9NV+UG3Nu13c+/ZePs73rN
 dlGjO+UMNTwlnG8RV5sUzmSI14bBjYSNT9oCM+QPritK
X-Google-Smtp-Source: AIpwx4+//JEHojCTnXQaGwMQwtbQz54T/+FkpBMJETeMEBVElbDez4SsPm48lowBqWbhUG4aEMgpoBr/xQaSS66sCTs=
X-Received: by 10.107.178.200 with SMTP id b191mr2160100iof.138.1522137138516; 
 Tue, 27 Mar 2018 00:52:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.142.67 with HTTP; Tue, 27 Mar 2018 00:52:17 -0700 (PDT)
In-Reply-To: <1522051676.1429236.1315961632.273FE2FC@webmail.messagingengine.com>
References: <20180326051639.16555-1-joel@jms.id.au>
 <1522051676.1429236.1315961632.273FE2FC@webmail.messagingengine.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 27 Mar 2018 15:52:17 +0800
Message-ID: <CAARXrtk5vS4PeRjRxoYiDC2uMO7j6=BGimHe6dDzV_8u0iZ5fg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Mark bclk (PCIe) as critical
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 07:52:21 -0000

Tested-by: Lei YU <mine260309@gmail.com>

With the patch, bclk is enabled (by default).
However, the PCI/VGA device is probed by skiboot but failed to train
in petiboot:

[   55.446446203,5] PHB#0005:02:00.0 [PCID] 1a03 2000 R:41 C:030000 (
         vga)
...
[   72.096462749,3] PHB#0005[0:5]: PHB Freeze/Fence detected !
...

The full log is posted at
https://github.com/openbmc/openbmc/files/1850909/log_romulus_host_with_bmc_4.13.txt

On Mon, Mar 26, 2018 at 4:07 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 26 Mar 2018, at 15:46, Joel Stanley wrote:
>> This is used by the host to talk to the BMC's PCIe slave device. The BMC
>> is not involved, but the clock needs to be enabled so the host can use
>> the device.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
>> ---
>>  drivers/clk/clk-aspeed.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 5af80b4e673e..5be88f0a0678 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -97,7 +97,7 @@ static const struct aspeed_gate_data aspeed_gates[] =
>> {
>>       [ASPEED_CLK_GATE_GCLK] =        {  1,  7, "gclk-gate",          NULL,   0 }, /* 2D engine */
>>       [ASPEED_CLK_GATE_MCLK] =        {  2, -1, "mclk-gate",          "mpll",
>> CLK_IS_CRITICAL }, /* SDRAM */
>>       [ASPEED_CLK_GATE_VCLK] =        {  3,  6, "vclk-gate",          NULL,   0 }, /* Video
>> Capture */
>> -     [ASPEED_CLK_GATE_BCLK] =        {  4, 10, "bclk-gate",          "bclk", 0 }, /* PCIe/PCI
>> */
>> +     [ASPEED_CLK_GATE_BCLK] =        {  4, 10, "bclk-gate",          "bclk",
>> CLK_IS_CRITICAL }, /* PCIe/PCI */
>>       [ASPEED_CLK_GATE_DCLK] =        {  5, -1, "dclk-gate",          NULL,   0 }, /* DAC */
>>       [ASPEED_CLK_GATE_REFCLK] =      {  6, -1, "refclk-gate",        "clkin",
>> CLK_IS_CRITICAL },
>>       [ASPEED_CLK_GATE_USBPORT2CLK] = {  7,  3, "usb-port2-gate",     NULL,   0 }, /*
>> USB2.0 Host port 2 */
>> --
>> 2.15.1
>>
