Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KdM/Rznc"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m1zv1v8XzDqk9
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 05:44:25 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id e14-v6so5076933itf.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ekLNJLKZ9M/w64VsbblwusjFIjrxc6NBvZ5wmO72OsQ=;
 b=KdM/Rznc5laG0rrB1WFBZ6b2TXzX0DwK5apBon+Fxm625jtOxFRFbbW36f7BXmSRkD
 gB6c6Dpks+WNeWqZXjEISFtJyoc3j2bnsqmClsj/ctYBUqGYhsCigYaSPy9fiTNC3hHN
 5N77ArYWHSmdjX8PtsnzSulvckniVMEvo3GQ8mEvM1fL4hP8qIGQJiRrSUmwwhyodutm
 VJcOSj0MpSvV7/asMWptDuvFeM7H5bTdWggUVrwJYfOgH2bbhWS7IwXdOx0FTlGdt03W
 JAyN+FJEz5j76h1trDQDY5gjlQK47281PFAeMdH3RxHj5zZ6bi/YocqcBg/zvHbj/pCP
 WmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ekLNJLKZ9M/w64VsbblwusjFIjrxc6NBvZ5wmO72OsQ=;
 b=hCt8oAPebkQPFrzzSPyD+r5q0fXoeKikBbVqtIYnS0suyBIU9HqRf5/yXsLg6Fbjkv
 JipYfWPW7PMRwKlG4Fpc9fDcOEfgN52Dy97x1Ii5+hTfsXIvnrwRtnXr/EIFSY1DPI0s
 3eAReLW7XDJSMtB+S3WhWVznp1qMj9gVSVwJ6BEDZk/2861jzuiUPUHsIwtClxkm2fED
 bVnNAfTxbuGn33WaNyW0G+70mJnb1h0PuviR3Em28rJvcTHfrslY85r7l/nNqW8Bq2OO
 xz47ggW58pg4BUrwt1WSfhlb903Ad5Ggum6zKV41aqWAd/bcdZU5o/wBuh6UkAIAarti
 nsag==
X-Gm-Message-State: AOUpUlEJVs0MSBaWj/v75SLcIdiirlY6+bsUiHqtE3Ic2woec5XK75Yk
 Fs4vD8vmve9Zy59cdw1fCxKZ1ge8xkk69NF1p/EMYQ==
X-Google-Smtp-Source: AA+uWPwPsl4detlyXjEvb5/L7DGBAaVBVkd1Wo34vOHiu5PKcTK2EbexJD+Br2952Rqqlk7DsP85AjmLhMeieOTbGuY=
X-Received: by 2002:a02:b468:: with SMTP id
 w37-v6mr3619351jaj.18.1533757463622; 
 Wed, 08 Aug 2018 12:44:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 12:44:03 -0700 (PDT)
In-Reply-To: <878d9eee-ea70-7c61-ef58-61af83704222@linux.intel.com>
References: <CAO=notxyH1+UcYhyhjDiw8vdnkU5SfQ6bmJKhBnWq4Gc5=ZTZw@mail.gmail.com>
 <878d9eee-ea70-7c61-ef58-61af83704222@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 12:44:03 -0700
Message-ID: <CAO=notwJ-0XKpJ+UkbcfK-ZVsZC3-eVnm6jbOPf9zG4Rchkh0Q@mail.gmail.com>
Subject: Re: clang-fromat-ignore
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 19:44:28 -0000

On Wed, Aug 8, 2018 at 11:43 AM, James Feist
<james.feist@linux.intel.com> wrote:
> On 08/08/2018 11:25 AM, Patrick Venture wrote:
>>
>> I haven't been able to find a good answer on this, but from reading
>> the man page, there's no built-in mechanism for having clang-format
>> skip some files.  I wanted to check on this before fixing the script
>> that calls clang-format in our CI.  I've added a submodule to a
>
>
> I'm not sure how the CI handles this, but if the clang-format is ran before
> the submodule init, and each build is from a clean tree, shouldn't that
> work?

That must be my local CI running issue - that I've initialized it.
This is going to make running locally more difficult, but thanks --
that indicates it'll be fine.
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-ipmi-flash/+/11859/
for an example of it fine.

>
>
>> project, and that project doesn't follow our style -- so ignoring the
>> folder lock, stock, is the right approach.
>>
>> Patrick
>>
>
