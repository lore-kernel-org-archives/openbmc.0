Return-Path: <SRS0=9MSI=G4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B2CC433E6
	for <openbmc@archiver.kernel.org>; Mon, 25 Jan 2021 21:27:38 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739282083E
	for <openbmc@archiver.kernel.org>; Mon, 25 Jan 2021 21:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739282083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPjd31xRVzDqw2
	for <openbmc@archiver.kernel.org>; Tue, 26 Jan 2021 08:27:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.171;
 helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPjbL5L9LzDqkS;
 Tue, 26 Jan 2021 08:26:05 +1100 (AEDT)
Received: by mail-oi1-f171.google.com with SMTP id g69so15559084oib.12;
 Mon, 25 Jan 2021 13:26:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YUiddN9H8b8y6QBHSCLwa/EqcYU5tNvYnDBCmzamMFQ=;
 b=kBSrYhspXeA+EVeRKEz7Y7QneCxMaRM9EhTIs1kohq1Ow2t5+O+zPEiYjE0PREHNev
 Ue4TO0EahIn67iM2PKlsGjdKYCCz2WSSTQCFz7oDt9946IbHaR6F9TzQj2Tgcq4Fgvf0
 SrYxSyWFWfBnvYVabcEy2drJCJvFOy31DT5dmE9qndA2qEumKaqa9YzTuAPBTmT5rEli
 VppKBcJHOMyh1RRyzKrmYzczCxSuZPMd4Ok49jbaFaGe4TCC0W7mMayQil83eGWgpcZB
 pzIwLI003CUP7l7KBh5DjCck6BfoiFI0b1KO2ky9bPh5oIRH/kQhGOpQsRMtDwY7Y3CQ
 gWOg==
X-Gm-Message-State: AOAM531R5VSapMahra8IXNybQk16FtfnISv8HvTR3dKBzgPW9x3xHZG/
 3uSCbvtlDh5NoYD+N1C1fA==
X-Google-Smtp-Source: ABdhPJxwYHpKhVFzlzKhS0ECsooki+4JoAGsd9bY9XwF9LZDthCC6SG5F6fEbWf2EfD7hB1j3tfpaQ==
X-Received: by 2002:aca:75d3:: with SMTP id q202mr1295168oic.36.1611609961888; 
 Mon, 25 Jan 2021 13:26:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 69sm3704322otc.76.2021.01.25.13.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:26:01 -0800 (PST)
Received: (nullmailer pid 1026791 invoked by uid 1000);
 Mon, 25 Jan 2021 21:25:59 -0000
Date: Mon, 25 Jan 2021 15:25:59 -0600
From: Rob Herring <robh@kernel.org>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Message-ID: <20210125212559.GA1026734@robh.at.kernel.org>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, haiyue.wang@linux.intel.com, minyard@acm.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, lee.jones@linaro.org,
 cyrilbur@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 14 Jan 2021 21:16:18 +0800, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
>  1 file changed, 25 insertions(+), 75 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
