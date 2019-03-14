Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S5W3NKR0"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KwB36w0vzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 04:07:23 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id y124so4258092pfy.7
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qeE8msP5I8J74cjzM6fOLYKS+QHiePlChYo6sLEI34w=;
 b=S5W3NKR052YsNaxb7TZHI7CJXSQUCunJFC9wBTViR6Mlv0Q7iUVF1iO62qIMgT6wzR
 2QC2EFCQCKxWWYhjFobngCbQw2AEl0ZdjoaJhatLqBzV3SJ1k+jZ0ZtLM4ygSvukoo7p
 jbIbXrPpPFWWDrpVtT+qLNisxeKdTeSACSX9nbOL5QdM/OhzE6UJhaZdl0x2cTikhQjy
 ELsfBtLIS37c96coX1litaKxWjG78RE5ipsBrSt4xI/FUF1oJIF2n/5OS8uMMXhiRHSd
 Nu3Q5t8GlUCj25rpf6EdQB8cyAUDJ+9mC92Zb2qh2kIOhWOzH3RKAtn/V4mIWt9nye5T
 ALMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qeE8msP5I8J74cjzM6fOLYKS+QHiePlChYo6sLEI34w=;
 b=DxB+c68WGikTUBk4bMlhsVpM0bPD5brEDL30yoOIXv+rWomLpMuNYIWkldFUFJbAi4
 pLLD9EcCBGhFgctLHRvNz3UwqiIrsjrV3UAFS/XbWV2dL8dJFTF42XwgXhU0FmqqP97M
 aNW5jVfGZQE9o+EBv+dMbe1zKD/HOPYN66eFaK79x05HE9ZZTBAjAwkowtyud1tBpoL7
 54LWf+Ip9NZEXbG5cRVbguCf0mmFvem9dhBDhu00yUyU64PYSzZVtlCuxfsqJ8RZ9KTC
 iFLimd19Fblo5jWrp+lo5LIrF2DJiZx8FZVSxEOafzZxoc7wRhpu4MTGbI1uut3csupQ
 W+oQ==
X-Gm-Message-State: APjAAAV6VVifcGEK8u7rVeG533DDCb9L/U/VgiTWBtSqSj7BTAKu9CDW
 DM4kwx94FPsyitHlKWFgg/HUBn8BHIejqcIeHXmtkQ==
X-Google-Smtp-Source: APXvYqyl2S9G65ENo/aqb9+xDtQr9iOcz9/j1I0AGn0XEdpTJ23ozOXyoQDuUO4AKAaHKVtDnS8QzHj4rHFcHjreMXg=
X-Received: by 2002:a63:3648:: with SMTP id d69mr46225892pga.314.1552583241087; 
 Thu, 14 Mar 2019 10:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
In-Reply-To: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Mar 2019 10:07:10 -0700
Message-ID: <CAO=noty9OxEw2ZFF2cFz8Y9F96UwyTMy71wGYhd39UQGrxRhHQ@mail.gmail.com>
Subject: Re: CI to stop testing meta-* layers not in tested machine
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Mar 2019 17:07:25 -0000

On Thu, Mar 14, 2019 at 6:39 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> I took an action item from last weeks Infrastructure Workgroup.
>
> The point was we're wasting CI resources by testing meta-*
> commits that are not actually tested by any of the machines in the
> CI job. We're also falsely marking those commits as Verified because
> if they are not in any of the systems under test, they're not being
> tested at all.
>
> The systems currently run as a part of the meta-* CI jobs are here:
> https://openpower.xyz/view/CI/job/run-meta-ci/
>
> Some quick grepping indicates the following meta-* repos are not
> being tested:
>
> meta-arm
> meta-evb
> meta-google
> meta-hxt
> meta-inspur
> meta-intel
> meta-inventec
> meta-mellanox
> meta-nuvoton
> meta-portwell
> meta-qualcomm
> meta-quanta
> meta-raspberrypi
> meta-security
> meta-x86
> meta-xilinx
>
> This would mean the maintainers of the above repos would need to +1
> Verify the changes to these layers before merging.
>
> Are there any advantages to running CI against meta-* layers that
> are not in a machine being built? Are there other machines we can
> add to CI that would cover some of the meta layers above? The
> general criteria for getting a machine added to CI is that it's actively
> being developed and supported. We also need to balance our
> CI compute resources so the overall goal (in my mind) would be
> to pick the machines that cover the most meta layers.

@OCP Summit today talking to Brad.  It's possible I'll end up pushing
up a machine configuration that'll use meta-google.  However, as far
as not testing it during a build, I think yeah, with limited compute
resources, there's only so much we can do.

>
> Andrew
