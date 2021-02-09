Return-Path: <SRS0=BdHF=HL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59066C433DB
	for <openbmc@archiver.kernel.org>; Tue,  9 Feb 2021 15:10:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DA664E88
	for <openbmc@archiver.kernel.org>; Tue,  9 Feb 2021 15:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61DA664E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZmXZ3gZgzDvXm
	for <openbmc@archiver.kernel.org>; Wed, 10 Feb 2021 02:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FcKm829p; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZmVS4Wd5zDsm8
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 02:08:14 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id h6so19758143oie.5
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2021 07:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O5FwzOvJ/CrfkXcEWPUaiVW3gWWQ5Ye4qiaGzSu/Mx0=;
 b=FcKm829pRU1dWJs9DXcN4xklFgnXcKw7V0lvu7/bWPf8tPOJc2WzD7NOR+kHCSl6zy
 5Oo1lsKQbd87EBGWoq4JliUdYDr/k/zvBkmDjyNL1VJQ2Se+7iZVM7iFDb0ib7ZoDVG9
 i+OoolPeDJvKHOQo3EMVEWD8sOrnoJAoKMyMdjIpIpkpgp0QxF7She2KzbCVhnHzij70
 hEG+0xFZjxf00/Da3O+ZmnuZO97lZz+mJ5Evcsw021iunlHvucszATLTbEPiBTWzeluK
 9tmeTEXMPx38c4ffYKF/Xys29KkTY4IU5dXWH50Bypu8GYiSHcxPzvydi/bnmK31KZI3
 A5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O5FwzOvJ/CrfkXcEWPUaiVW3gWWQ5Ye4qiaGzSu/Mx0=;
 b=a47TmqwBuAS31xPXt0cQtb876JZalB2ZUbvrOz7AZCgRsf0hb3+fRHY+2NgcLucL8t
 PtrWg9zGUrqzZcDMcb6AkYCaFuHkjRfXJAnop+/TwStqsbSTK/6c21WIWP2P9imURTbS
 3ZGGcedloCgcUrgZr1a6q6JRV6folNHw5yyVxj//s5drmnTCjnm/zayWNU3Ed8w1BOWo
 5ukpyVVhOqnJMRS9TNUlIUkblYlfsAzKB7AfbEGUUSeDXGhDTCoLE/exmT0ecxp9YeK3
 HXYu0cj9a/kNkwT5BVBOuCEcoqn8wd9ixux+a2v5cc4b7+ScHerbCeJ9pRwNw5fox4Vu
 folQ==
X-Gm-Message-State: AOAM531z9Je+APWqaqvuNpK6lOD+sVNswOkB09f33Eqa4Gdzj+zzc0Xh
 89bhHp63x+teoqfKqVnGfJrjhidXWP6ymg==
X-Google-Smtp-Source: ABdhPJy1F4lbOEjFHR52zas0leWN7+XBB+GoOVZ3N3GShFtVTpbVMQ/D9P3Q6RfiTuioc6NeCckeUw==
X-Received: by 2002:a05:6808:1287:: with SMTP id
 a7mr2616480oiw.151.1612883291006; 
 Tue, 09 Feb 2021 07:08:11 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id k207sm2839462oih.32.2021.02.09.07.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 07:08:10 -0800 (PST)
Subject: Re: PCPartner CCLA
To: Seires Li <seiresli@pcpartner.com>, openbmc@lists.ozlabs.org
References: <CAJwvfaOb1SnFzf3i-LQB3nT_YAdLR=NPVpbOyDdR-+Y4-oyZfQ@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <eed36269-6f69-bbb7-4dcf-bec1b2cbdc5e@gmail.com>
Date: Tue, 9 Feb 2021 09:06:17 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJwvfaOb1SnFzf3i-LQB3nT_YAdLR=NPVpbOyDdR-+Y4-oyZfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Arthur Cheng <arthurcheng@pcpartner.com>,
 Richard Yu <RichardYu@pcpartner.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 2/4/21 8:42 PM, Seires Li wrote:
> Hi,
> Attached is the signed CCLA from PCPartner.
> 
> Please let us know what else to prepare

Your CCLA has been accepted. Welcome PCPartner!

Kurt Taylor (krtaylor)

> 
> OpenBMC.CCLA_PCP Signed_20210204.pdf 
> <https://drive.google.com/file/d/1wpiHl8WtyAo9WU1iL_M-KWEK-NoROxv_/view?usp=drive_web>
> 
> Regards
> Seires

