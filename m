Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dogVOtTY"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z00Cr0XkZzDsQv
 for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2017 21:05:27 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id v186so6890551iod.7
 for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2017 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yQnny2QA6u3yGI6Fe+Fc+T0hKrdqa3KTiEzD4LbUvB4=;
 b=dogVOtTYN6xO7tLmmCcy/OI+qNV+FYE7BLVIshFywgree9c+F9cT14vDUWAVflKia9
 16vSRIZG5WazwmizfErArtkUSbsV2FxYqqtQVwpgWeNEGy3RUj5hqPBuWLeqNSwKUzG6
 ZRWFdn22c4Uz4BNdEYY3JfZgBEmsrNeEdAixEK0iX7YOCfwkHpoUnYMs2xGkZlFgbhTv
 IfKq1AAzcefNwIck655ZgBjiMeoUr7r9IST44fn4R1qivq2Iyw6Xulto0/Hrq7IAgKSi
 yO6LhzQ2hv6SlttVvK9ZXXyrlB1XeFN3lq1C7eCGB+hNxP+zlE1mycGkUP/JSAxguwKv
 u30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yQnny2QA6u3yGI6Fe+Fc+T0hKrdqa3KTiEzD4LbUvB4=;
 b=gQW8MoTB9qRF66mFhEUYSzvdKHjYiPBbbHUGOSrlGU7Xn/edxNYsyv3amTetYB3SVQ
 TEVYtLrkOzZMsJLMIP67Y6Fk0iBfYHEvyHPhQ/K/TDm7uTmOUzT9Y0s+O3ZcTfizcvOm
 E6dGsPNmHSryN4sWi3viSTZxGeSjGsG6XkHxK7TobPy/KnBoZOEU3y+ag0ZfTHIXrSx0
 oX4KAAR9YrNzxWLRnZt2s4bRSE9xhrGqDlG6Sm91xla9Hya4JV+APnunPdIbMKovhl32
 +Q4BAmUM4/QmBO5cBGrQbsrAMVNnQW/SrCmxpf1gLSFybyJq5c1yut9ZwuI3mQayaao1
 3PUg==
X-Gm-Message-State: AKGB3mJO8TfVPIHogRJMnY5GBxbA/PnsipJKbA+p2bDjFxXwApyIkC04
 L7KrOn5l57MOc0/IY5mTX7A8nYammuVFQCsomWprlA==
X-Google-Smtp-Source: ACJfBovTSfoDiepVuvOYGVqXmGYKGJ9H9584Yh5d9kGgITczHOVWFX02QYnF+Rr/nUhJrjIYDpCyQapfTLzFrAN1/fA=
X-Received: by 10.107.195.14 with SMTP id t14mr19440830iof.238.1513505124678; 
 Sun, 17 Dec 2017 02:05:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.89.153 with HTTP; Sun, 17 Dec 2017 02:05:24 -0800 (PST)
In-Reply-To: <CACPK8XcGZgx2aGez0Fzz3mZLsqo46BYV-rvixnE+GnEVN2axnQ@mail.gmail.com>
References: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
 <CACPK8XcGZgx2aGez0Fzz3mZLsqo46BYV-rvixnE+GnEVN2axnQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 17 Dec 2017 12:05:24 +0200
Message-ID: <CAP6Zq1iWox_sxyxkvUDZO-o_GBga8UcE46A5ELY5xMxVO98nng@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm: npcm: add basic support for Nuvoton BMCs
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Dec 2017 10:05:31 -0000

Hi Joel,

Thanks for you comments

On 15 December 2017 at 02:49, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Dec 14, 2017 at 8:09 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Changes since version 1:
>>  - Add dt-binding documentation to NPCM
>>  - Add dt-binding documentation to npcm7xx-smp
>>
>> This patch set adds support for the Nuvoton NPCM Baseboard Management Controller
>> (BMC) SoC architecture as well as the NPCM750 variant. NPCM is an ARM based SoC
>> with external DDR RAM and supports a large set of peripherals.
>>
>> The NPCM750 is based on Cortex A9 and comes in single core and dual core
>> flavors.
>>
>> The device tree added in this patchset has a number of bindings for which the
>> corresponding drivers will be sent out later and thus do not yet have binding
>> documentation. Apologies in advance if you would like the bindings to be added
>> along with the corresponding drivers.
>>
>> this patch set based on Brendan Higgins patcehs.
>> https://patchwork.kernel.org/project/linux-arm-kernel/list/?submitter=170155
>
> Thanks for the submission. I am happy to merge these in to the OpenBMC
> tree while the review is ongoing upstream. Please cc me on the
> upstream patches so I can assist with review.
>
> Convention is moving to use SPDX-License-Identifier tags for new files
> instead of spelling out the GPL licence message. Please consider
> updating your patches to use these tags before you send out v3.
modify on v3
>
> Finally, please follow the tips in our documentation on adding a
> branch to the subject line:
>
>  https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-tools
>
> git format-patch -v3 --subject-prefix="PATCH linux dev-4.13" ...
>
> This is only for submissions to the OpenBMC tree.
>
> I noticed you're sending through your work mail server, but from your
> gmail address. This might cause delivery problems, I recommend using
> the gmail SMTP servers instead.
Sorry it will take some time because our IT is on HANUKA holiday
(meanwhile i will continue to send it the through my work mail server)
>
> Cheers,
>
> Joel
