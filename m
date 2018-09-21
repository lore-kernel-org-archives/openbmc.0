Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ocCFvcvK"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Gkf45mpRzF3Pt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 16:46:36 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id v14-v6so11172504iob.4
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28hgexyv2VwkmRvuwQA8MEpfm2ObLUNHkJD0E5NOKUE=;
 b=ocCFvcvKrL8ypTIpja09Zwgwlil5RTawVvhfzeosJEtHKrGVIUDooadeAKyQevjUAL
 ZCXOEkhd3DBDiVbnDsNqiaodcGqHmHNxl9UYjR21CzNtyBmvPxubzFRAGjNkyw5JUsdd
 UsdNehrPeQmL017HkD+b+agy9V11Y+xeMPC/DylKamzdP/5hVGyN9QEXKJxGlEuTK+tX
 /GafUtcgRN5bXU0RAJUxhmwZ5AV9/uwvo7QThtOipZT+6O1hUbcI0UjIlrlZrXZfyOMa
 CBQU25tBEbBTRvAA89x0VBJfmuQBrItrp1r3aytpHaSUXGVEnk3VPtJeQUVYtC6fOe0n
 Ba1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28hgexyv2VwkmRvuwQA8MEpfm2ObLUNHkJD0E5NOKUE=;
 b=KgFvxzY4SLyeJmiJqu6mS+HzAPpYLDkXhJ/1MW4gYuRKhltoZXY8F/grTZH3SHio/3
 BX531IsXv3VuE17iLw4sBgSHqEG9xb19Wv3gf99TFLf+ymXdZFn9s1id2OamGmI+sBtT
 HRhd3pvFJhcy94aye2tcLmvsN5GexDfDsxNvfbLL7+ntjxmgcraBRsTQYj+e5908tf+E
 RxdNvZIdxPA4KSRqr2mwCaEta1B2N3b0+ZARLnILkiaK1Qz3qLFSIlRjjPJcFcQ9TFrt
 rn2GU75aNU3xtrfhooJ6UpySyEN/YQ2GThh4HtLMD3Xwm3I6JGKQ9CMww4QlcGZx/c6V
 fjRA==
X-Gm-Message-State: APzg51CmyBHhl6A/Q0h3xSXcxeMcLmTIQd2VwruKhEf8mULo3mLousX0
 sN7LJW1kObuIi6CIHNlPwC17k2hTGphgeXh06hRf6YGCeeGqzg==
X-Google-Smtp-Source: ANB0VdZSlptj22iRKTM+t7ZeRXZKHwlFIi7l2vhmqUu91sag2OV4YhpeA2wP5koaWMCgAWtd7HWQMnE0LLTW5yMbdQA=
X-Received: by 2002:a6b:bf86:: with SMTP id
 p128-v6mr34964563iof.156.1537512393586; 
 Thu, 20 Sep 2018 23:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
 <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
 <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
In-Reply-To: <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 21 Sep 2018 14:46:14 +0800
Message-ID: <CAARXrtmDv74030kX_tZ+n7qAHKCX6BRXhj_i9Rni3wdj_D3h-w@mail.gmail.com>
Subject: Re: Version and Functional FRU fields for motherboard and membuf
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Sivas Srr <sivas.srr@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Sep 2018 06:46:37 -0000

On Wed, Sep 19, 2018 at 6:33 PM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
>
> Sivas, Lei? Any chance to get an answer to this? The test still fails for us and we can't decide whether we should disable the test or add thos properties to motherboard and membuf objects.
>
> By the way, what is at all the meaning and purpose of the 'Functional' property? Is it an indicator of a component functioning properly, or is it a 'handle' to turn a component off before hot removal/replacement?
> There is no description anywhere that we could find.

The `Functional` property means if a FRU is functional or not, e.g. if a DIMM
is plugged but has problem, it will be garded. At that time, the DIMM is
`Present`, but not `Functional`.

For this case, I think the test code shall be updated to skip the checks for
Functional, Version on specific FRU items.

Ping @Sivas again for comment.
