Return-Path: <SRS0=FvJ2=JT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F376EC433ED
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 16:20:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F45361104
	for <openbmc@archiver.kernel.org>; Thu, 22 Apr 2021 16:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F45361104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR2hP3Q5dz3035
	for <openbmc@archiver.kernel.org>; Fri, 23 Apr 2021 02:20:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s0a4UGtB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s0a4UGtB; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR2gs4cMHz2xb2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 02:19:50 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id i81so46349030oif.6
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=aFl6EswqtlVNYkjRhQTEpepgIMixov1FSrZxGgJfPWY=;
 b=s0a4UGtBPeJGaEKjSdzMDMKkL1169toPxo80t+CHxjloakdPF0AbSWLAQqfKhw9Rd/
 kmM3IyARV9hkK72cYORkVGrrJxLUZ1EZEgzr4NatQbEBQZCtx4fi4D0Fb2zFNOPIa3Si
 s/upSZ7eTefjbLnC/07XpZ1BV9FeqGWF/FHlHToM0RJOQZKXj9LTtKBkToiO1sbUSJF8
 fij4M81+4txjovUvnZTG52361Mnm3atYaBd0w/83z2zpWC+jDZb34rMsxuuJsxZpMCwy
 081LlYDAykVgZEoEPa5UJIy/KVtnx/OWilQ/tWitEWQIiQj3wcey5hg+qrxULvZ291N6
 kz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aFl6EswqtlVNYkjRhQTEpepgIMixov1FSrZxGgJfPWY=;
 b=CdGVym8nWEpHCDlcYsl60xaxViFfs6qLsj/HB0KfWqwMcV6HoE/rV5ZcnJ96Slfl5G
 gqvg2kCkikZxa8WW5/zmfIdC8uqwDYZOr5mi/8TUOtEXtXH28hnbQfHGqie0krHfQ/MT
 MzOFaMzVx4dTZ1VmpAqLJ/bcKRG/7iLEHC6m9VXpSQcZoE9q1yqkt0wS/zh4ByOUgfJw
 4LbR5MPd1RBkwVgv3tNB0Vwc7gsTqjycogWlzwCpkv7CjMjSJZgxakmj0GH2qUiXwf3u
 T6eaNy1siPeYJMbs+lpEOmgp68T65+qt3a4K+w9wqhokcc5UK6YURW1kqesroVNuq1WQ
 fF8g==
X-Gm-Message-State: AOAM530oDHbaKfUxlUVIUbSQac/GR0dBbWl/+4bhLCopursNeG+xP0P1
 SGQ9zdI8FabURu26kwFnfl7qp8uQYoMhKg==
X-Google-Smtp-Source: ABdhPJwtCMpRN0Kt3WeqRBgC5rPxd6ywxV3yRSxLfN/xBS0doiQP7FI+YeDL/U0zEJ+wiSR+jPmKOQ==
X-Received: by 2002:aca:6542:: with SMTP id j2mr2785624oiw.94.1619108382578;
 Thu, 22 Apr 2021 09:19:42 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id j20sm639305ooc.29.2021.04.22.09.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 09:19:41 -0700 (PDT)
Subject: Re: Updated CCLA from AMI
To: Pravinash Jeyapaul <pravinashj@ami.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DM5PR10MB1628FC36AAE7655DC27CE3ADD2479@DM5PR10MB1628.namprd10.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <3006a4b8-155d-cd4c-13d5-f2d0eaf385cf@gmail.com>
Date: Thu, 22 Apr 2021 11:19:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <DM5PR10MB1628FC36AAE7655DC27CE3ADD2479@DM5PR10MB1628.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 4/21/21 4:31 PM, Pravinash Jeyapaul wrote:
> Hi Brad,
> 
> Please use the updated CCLA from AMI.

Your CCLA update has been accepted, thanks for keeping it current.

Kurt Taylor (krtaylor)

> 
> Regards,
> 
> Pravinash
> 
> -The information contained in this message may be confidential and 
> proprietary to American Megatrends (AMI). This communication is intended 
> to be read only by the individual or entity to whom it is addressed or 
> by their designee. If the reader of this message is not the intended 
> recipient, you are on notice that any distribution of this message, in 
> any form, is strictly prohibited. Please promptly notify the sender by 
> reply e-mail or by telephone at 770-246-8600, and then delete or destroy 
> all copies of the transmission.

