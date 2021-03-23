Return-Path: <SRS0=wJn0=IV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D11C433C1
	for <openbmc@archiver.kernel.org>; Tue, 23 Mar 2021 05:44:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 440F9619B2
	for <openbmc@archiver.kernel.org>; Tue, 23 Mar 2021 05:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 440F9619B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4L0r52M2z30Kw
	for <openbmc@archiver.kernel.org>; Tue, 23 Mar 2021 16:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ksFZVckW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ksFZVckW; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4L0P4BKFz2xZ7
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 16:44:20 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id f10so3510347pgl.9
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 22:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xfi3yxlgy2oL/1QStMMaCc4/5FdU/WZtVUZucRdzLNc=;
 b=ksFZVckW3Plv2bzRIrOHPNKriEEhH5lPujuA3mA1u0TIM0CDEwisUrpxCe/nhsWtfK
 LANwJPMNcK4nYlK3hhi2Sv6+DviH7s2dLnknYGteynkomiDuOvu1U/0xK6qAR6i6jsiM
 vOfAG6as001O5c9viYbTP3BnaOc3tR1cllnq0PQv3zdowSSMy7DxK9bHdgL4CmIBgJfq
 uyb/PVe3vDX0yX+svp6E92iaqaLZLENADAoYElp++HtDNftGbh2dDvvQOzYbDhapcfGt
 wCAc/szh3r/Fcq0zAm0LLOgcXTj2NlX44BiqF7ZwzpNVMLUUQ0SEKFPbdQk6GnWp1z6a
 um2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xfi3yxlgy2oL/1QStMMaCc4/5FdU/WZtVUZucRdzLNc=;
 b=Za2sONIQSFMUW5xNshw0PoKrZdxPkPaGxKEjzXbhpm3x9/+84a8Y28ataROEhUllNI
 o5tKXjt/Hcfr+ltiq3JUG32lFt6HHlA4xREiOU6JTDb6ScFn7/8locK6qQMBfNDpJuGn
 EuDwOatLhge4O6J2hHFPS71QPoQpqlX1NEm3JxTJW+AeBPJZXc6eNN+SBENBngMZ/Zka
 vO7H5H+lM2pJrSDFARS+D1FL/v/4QLWewEJjjAWuJ194AinBbQsnH0WVFB2lKfrGpId4
 /oU+D6Z3VKrBptseVkptUmt92tmGbPwston/FQ7JcOvRT1AgsYiInO0ow71CvcsgUCNL
 1eMQ==
X-Gm-Message-State: AOAM530N83Mw8hKzKA66ZJrj6AGKWI0PQJTmczkElspqdJPHob4oZicm
 P55thUfcV085rGn86GWfLho=
X-Google-Smtp-Source: ABdhPJzhMTFfKtJmZ4xmMA7N7/gKBmnUcWglNAzMpkyftTdR/H9T/ZkMTenFyvpfmxGsk3U8vAqYlA==
X-Received: by 2002:a17:902:820e:b029:e6:f006:fcff with SMTP id
 x14-20020a170902820eb02900e6f006fcffmr2434749pln.60.1616478258266; 
 Mon, 22 Mar 2021 22:44:18 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.107.134])
 by smtp.gmail.com with ESMTPSA id i22sm1078166pjz.56.2021.03.22.22.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 22:44:17 -0700 (PDT)
Subject: Re: UnitTest using the /tmp file system
From: Sunitha Harish <sunithaharish04@gmail.com>
To: openbmc@lists.ozlabs.org
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
Message-ID: <411b0a86-799a-3038-ee3a-70007feab0d5@gmail.com>
Date: Tue, 23 Mar 2021 11:14:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: deepak.kodihalli.83@gmail.com, edtanous@google.com,
 bradleyb@fuzziesquirrel.com, gmills@us.ibm.com, geissonator@yahoo.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Any views please ?

On 21-03-2021 09:30, Sunitha Harish wrote:
> Hi,
>
> This is regarding the unit tests in various repos under openbmc like: 
> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd, 
> pldm etc . I have seen the testcases using the /tmp filesystem to 
> create the directories/files when the UT is run.
>
> I followed the similar way of writing the UT in one of my commits 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37352 .  As per 
> the review comments in this commit, using the /tmp file system for UT 
> is anti-pattern, and this needs to be changed by mocking the same. I 
> agree that this is a valid thing to do.
>
> Now this email is to discuss why this was originally done? Can the 
> community come-up with a generalized solution for this ?
>
> Thanks & regards,
> Sunitha
>
>
>
>
