Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW3WV31SkzDqn6
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 15:07:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G15kSkZq"; 
 dkim-atps=neutral
Received: by mail-lf0-x244.google.com with SMTP id x16so5867538lfb.4
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=N0WjpGMbqOuXFrkf79w3cI6CXWoEOP3AZhBMMb5PQX8=;
 b=G15kSkZq0F1k8JlELcWY9uWtte9X4wdstRz7nR0hfvkgsE5XOxEtmaOpz2wbsyCU82
 CoM/y6rDqc6Gwud7UFHehovpbj0EGxcZi0eDDzc40QSXYMeJTfAAU2LY6+uWQGZUTcf7
 qiz/div9Ajg+xJVJBrkRfl67Ekh3+pVm5Ee9W3Xi5FzLgijC4AEzSMIxUzMCGyufbwJI
 KppbcfYembu/OJCvBS43sL5NHhfoW39B0VHVl6wT0fW/cETSSm64QT/sYiGGOlR97tk1
 Iau1D/8FYGUbYfwrgrixpiTIdRlbw2u6UFMVogmQlEusIdbK6kyuirAz9BG29gCwu43T
 jWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=N0WjpGMbqOuXFrkf79w3cI6CXWoEOP3AZhBMMb5PQX8=;
 b=dF4lgTBsFhjqlS5uP1g5A4gkNz3VnHEBTqI9qh3nGAJf9nNJesNMBo77e/ZVTf6l0t
 emoKvC0AfsWBXWo/zy5IHnKH3fn6UCG/6wDjckMvkvVUrsJun2e5nAIp5v2XgRDeX8Pz
 JONtEVgTwbmGj/GRriScyTQbGgkKw2yqyVOUfzsbTXpxkqjp0Fq96PRtIjpwdphhVqwV
 NU+ZaQi34N9FDfhCoYMfO6CdjItcZghUq0Ghbl2xtku9WgEfdOrYdcxHkuUseV8706Lw
 /42sh6PPOLmmolwvqQUm8/BxRhIutSnCi+ZEXFaGc4tDDUKsinhpX1b4tfmSQB5UFSXe
 d5Mw==
X-Gm-Message-State: AHYfb5jl8vSBuuTQAGCTPP0HRp5kv9gBUrFMEnYl5FlqW5fTn1vlhZ9i
 Rd79v+5sAic07TafnLpCj+VgaGMWuA==
X-Received: by 10.46.1.201 with SMTP id f70mr6570791lji.182.1502687235343;
 Sun, 13 Aug 2017 22:07:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 22:06:54 -0700 (PDT)
In-Reply-To: <CACPK8Xee32=f0pDV40NSBKffTqAJz5DXeCBgEH-Af_jyo8EYVA@mail.gmail.com>
References: <1502474608-2674-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474608-2674-4-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xee32=f0pDV40NSBKffTqAJz5DXeCBgEH-Af_jyo8EYVA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 14:36:54 +0930
X-Google-Sender-Auth: pklkHpIlkWUtc1TfcrY4V7z9RIU
Message-ID: <CACPK8XeYV+kHR0M3JAyzUTYoM7Q==ULV1mHg8phMVTRSRNNUHg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/4] hwmon: (pmbus): Add generic alarm
 bit for iin and pin
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Aug 2017 05:07:20 -0000

On Mon, Aug 14, 2017 at 2:03 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Aug 12, 2017 at 3:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add PB_STATUS_INPUT as the generic alarm bit for iin and pin. We also
>> need to redo the status register checking before setting up the boolean
>> attribute, since it won't necessarily check STATUS_WORD if the device
>> doesn't support it, which we need for this bit.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>
> I have merged the upstream commit
> (cbcdec6202c934bd72fca4fe9db255d84f907dbe) into dev-4.10.

That should say c159be9e902a59a117e67d466c872ecc46240ba5.
