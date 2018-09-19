Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lYJqj75T"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fx7V3bcfzDqMh
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 09:35:49 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id g23-v6so3369700plq.9
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8qSaJG7QitV6Bmg3h/MV+is9F+PS2L5trrK1WRp6m0=;
 b=lYJqj75To3aAH+9HtZQk2Qww6Cue02DOGl//JchXjR4j0xzuYt1crEc60m3FZ6fESn
 oVHdhmRKOBseUF9hLbQ5fdj6DF3iQ5Sojdox+Mn7exH4ysaX8tkO/H0QoM42bMCLaLFw
 xSP6cU0Z5sI1r+2bczwGujon5SFXBuZBV9WUFlkyF2VZulrPiwlbQCN+Nr+09qRi5R/R
 8F1D3FtRBk4xh3ij/qlSwFl1s+GkEaWedfDdEI7WvoRhnUHEqc1IUrN0wWxtCgPRmuGX
 ipzOzpdd3ESTjl7j88neqUHcd+08FIcJ1QILc/rh2amsdKrlOK9UO6eH+7qaYokTyyQg
 owyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8qSaJG7QitV6Bmg3h/MV+is9F+PS2L5trrK1WRp6m0=;
 b=LL74XBd0MF0Yi2shH9C20e6iXpBrzklJvwWKt6QrAL7ZNEl8pingCr8oshQrkF3EzT
 Py17cs6YaYk2sjoy5PqhLJm5IskGj22n5Sj14UfKs2j/9od52SMBRv4RPdi2GFiMWVYB
 cBciIMhhHImvIcGmAVWJ2wy73oXN4UXzWf/Tr42L8cAit/8CD4qXUCVZdptHHpjjpwdF
 1nMNnWLMAO57zuQeq6ngcasr383vDW+e6OVGaPM0KlqpE8i+vF/oG1JW9i9WkFsxarLd
 OcBaCrFF8r0uqm+rxQzs5g5BvfyZSBwWlEIFAmOlN3kWrCzlj+mh9PqdK9TdFmgrqEIW
 nIXQ==
X-Gm-Message-State: APzg51C7YYGfT7U4Ntl5wFz9pmfcYjeZY3wgoBjSqT3LhrGdv0mh8el9
 Hi1FcEaogQ1vguYJsp0vAR605Cgu6Tehfls0/9JV0Q==
X-Google-Smtp-Source: ANB0VdbaJBYYOZrV4J5ZPj1hALpGxUx4lx6E4IYUtitoro/VaJfHCJBdHby2wFH4mmirATX+11K86FfnVEorM6Xhn8g=
X-Received: by 2002:a17:902:a60a:: with SMTP id
 u10-v6mr101074plq.149.1537400147457; 
 Wed, 19 Sep 2018 16:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <dVwK1y00D1vEVCc01VwKs6@charter.net>
 <CALLMt=pqSRi90cju_Gr1gBe+n9giWeM6LHYQ=MTnKDGEaaVifA@mail.gmail.com>
 <8af8dac8-3dc1-1e21-9ff9-0aae0337f769@linux.intel.com>
 <CADfYTpFB+f4kp_sxqtKs+EX_C3AG4mW6nvmTM2uck8CT=qeuiQ@mail.gmail.com>
In-Reply-To: <CADfYTpFB+f4kp_sxqtKs+EX_C3AG4mW6nvmTM2uck8CT=qeuiQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 16:35:35 -0700
Message-ID: <CAO=notzEzvOz_RzqtAC7wyUVzjBOL6wEgMXgw=uE2D3XsRHWBg@mail.gmail.com>
Subject: Re: Repository Growth
To: Nancy Yuen <yuenn@google.com>
Cc: jason.m.bills@linux.intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 19 Sep 2018 23:35:51 -0000

On Wed, Sep 19, 2018 at 3:03 PM Nancy Yuen <yuenn@google.com> wrote:
>
> +1, I like the idea of having some form of automation to help with the maintenance of this information.
>
> ----------
> Nancy
>
> On Wed, Sep 19, 2018 at 11:45 AM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>>
>>
>>>>>> The maintenance of it would be horrible for one
>>>>>> person, but if someone wants their repository to have details and so
>>>>>> on they can add it.
>>>>>>
>>
>> Is it possible to scrape some of this info from github, gerrit, etc.? Perhaps portions of this could be automated to help with maintenance and to keep the information up-to-date.

I think this could be scraped if the READMEs were formatted in a
machine-readable way consistently.

>
>
