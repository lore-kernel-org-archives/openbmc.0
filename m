Return-Path: <SRS0=myNV=I4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148C4C433C1
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 22:06:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D75619CD
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 22:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D75619CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F93Rz5P0lz3bxw
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 09:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F93Rc1Bfbz3bqZ;
 Wed, 31 Mar 2021 09:05:47 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id m13so17975645oiw.13;
 Tue, 30 Mar 2021 15:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K57+sZPGNUEdeNlTqUnowLYV4JcIVUw0MSAp4gezLB4=;
 b=biLeAn+wJaudcYe+yNPh4/xPguIkhJJ8f89vL0RD1oJ9LAGlwjWzhXtrEn8izGNsKI
 tJZThCeDZ08HUzBOvzG4IV4YvPb/Hl3RVCXJPeeTOi0njcO7xC5d0YMXz/23YOT/l9jS
 6YB8lvav+RIQnzVYlIgI2GIjbpHJXaZZMvuSTHdyX12U+KCk0dqqKdQ5qDdYu0HPiSZq
 MMsb40QX7J9XAMh+u7wc/s+kdXBB3SHpQAe2cl1B6iCizE6rtnJDo+mC2lwzgIcU30dm
 XZVC+f9CHEIExON8qDgLVqHRFHUFlfxpl4XR8VZd1rtLl5GZWAutDkLkGJO07RQwsoNh
 vtFw==
X-Gm-Message-State: AOAM530FND5opU7JhD6hyN87stlglNxufn1rYq35VVDDDHKktNJxtCiP
 yRfeLT2JzUPA0eeJbMpQKQ==
X-Google-Smtp-Source: ABdhPJyjT4fITT5nkHsfFaZVDJZo+ZYrw/hsB/2n8AZ79xoGHPmTkbIWolYQQdVP8dc22ukOImDz5w==
X-Received: by 2002:a05:6808:13d0:: with SMTP id
 d16mr53428oiw.169.1617141945047; 
 Tue, 30 Mar 2021 15:05:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h9sm41272ooi.22.2021.03.30.15.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:05:44 -0700 (PDT)
Received: (nullmailer pid 797160 invoked by uid 1000);
 Tue, 30 Mar 2021 22:05:43 -0000
Date: Tue, 30 Mar 2021 17:05:43 -0500
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v1 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
Message-ID: <20210330220543.GA795792@robh.at.kernel.org>
References: <20210329121759.5644-1-quan@os.amperecomputing.com>
 <20210329121759.5644-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329121759.5644-4-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 07:17:59PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++

Bindings should now be in DT schema format.

>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> new file mode 100644
> index 000000000000..1616f0188db9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> @@ -0,0 +1,18 @@
> +# Aspeed SSIF (SMBus system interface) IPMI BMC interface
> +
> +The Aspeed AST2500 are commonly used as BMCs (Baseboard Management Controllers)
> +and the SSIF slave interface can be used to perform in-band IPMI communication
> +with their host.
> +
> +Required properties:
> +
> +- compatible : should be
> +       "aspeed,ast2500-ssif-bmc"
> +- reg: I2C address the registers
> +
> +Example:
> +
> +       ssif-bmc@10 {
> +               compatible = "aspeed,ast2500-ssif-bmc";
> +               reg = <0x10>;
> +       };
> -- 
> 2.28.0
> 
