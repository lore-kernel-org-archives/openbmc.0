Return-Path: <sjg@google.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVHJ15rwvzDw1v
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 12:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GNsxl2r0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Osl3f7Vv";
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id v84so250707062oie.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 17:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ahTh0PsQMd/ktkZpvKPGP5kLONqSc+6z8bAa5YwPPAQ=;
 b=GNsxl2r021W9CtmnuvB24zXT+5tpaKPErexENkDYHCGugeAWwfpw9xEM2wKvBthXAG
 wJeh5bc6nUIhkxaWP2GXJb9pgt8xWvOoVRwhHW2ClVP7lnRf7BTvSoR5TFc0Y3QXZh0O
 2iGAdtG+bT2fsbm6e9nNt/cze7vVuytVt3TM9OB600/OKePheAsjQwl9yn4JKXiKPcaD
 2uwPLetcjHeh1Jyv7OzEYjlAHNRluSb0+qhA5+W0AdZRqJ+b6s19Z6EkeViOMx50rXhB
 d7RSW9ZzeKlQKy5a0+rk7X8oHf8kcdieWmXi25CYrT3bM8wOfUcao/TemylWO/03bbnn
 ZREQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ahTh0PsQMd/ktkZpvKPGP5kLONqSc+6z8bAa5YwPPAQ=;
 b=Osl3f7VvcIQ/l1z54ICyvK64bfZR4rWmSM106kU1LaAwv0OcfSDiNBCEg6sVdxrwmQ
 pgkVJ5YCyWBl9ii/3MgErSsyQMgPPWqch+3T0N/thGkX5N3tLFxob6Be2bc/o2F4ruvx
 7I6aWzGiWN9t5jw+wTPUP9qfwcfnS/Ql28uEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ahTh0PsQMd/ktkZpvKPGP5kLONqSc+6z8bAa5YwPPAQ=;
 b=JrLPwAEVq8GHvAzkT/7QD5uroMM7X8D3NUJOWvBHFbceDkBLRR6gu1J1KY+VrnwF+j
 a0ky4SMEYAieQi4JnhHRkLGOcUE87O1V2hNlb6dLA0y21iRTW+uvu4bG8a7WODqGBR05
 lmiCoE3c23N5UoFRTUWuuMv5BW0tKNPVHYMY7gNGbYYU/+BxnKx4OoG/Lb+mKJZ4ob19
 TFoWr2hcUjAbpwQATw8rZ+HKoywOXEdF3p/z/ho++DLQ90ptxSk8t++hTaL2OwPRc9qg
 o2B0EWXAZ7HrM1121Kwu8xYaVqj/W7aSxtGv55fNlyPZ6sW2v7T2m67tdbfcWvYmEcBe
 yd0A==
X-Gm-Message-State: AKaTC01O352LMRlZ5F/zJGF7z8H04eM092ETHeca4CEnhpuzRkjSUHbF3cZGULbpGikR4Pod4KMloYFjl7xvTXKC
X-Received: by 10.202.89.194 with SMTP id n185mr19334229oib.6.1480643629027;
 Thu, 01 Dec 2016 17:53:49 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.128.229 with HTTP; Thu, 1 Dec 2016 17:53:28 -0800 (PST)
In-Reply-To: <CACPK8Xf17NE8b6o+uAmOOKPbbAYnUPWiW6OwubywoSBvLaBptA@mail.gmail.com>
References: <CACPK8XeEKvZfAVLgwZ2bKne3uhYiXCSOFgoSfmTd7HqG_K3TOw@mail.gmail.com>
 <CAPnjgZ1p2jSYQsv7fw+kjZ1HgSfV3KM9uHhjJE=3RUWfvnB+_g@mail.gmail.com>
 <CACPK8Xf17NE8b6o+uAmOOKPbbAYnUPWiW6OwubywoSBvLaBptA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 1 Dec 2016 18:53:28 -0700
X-Google-Sender-Auth: QyKSWPkPbv6dynBo93wJDxSe_8k
Message-ID: <CAPnjgZ20G8SPBfcF4v9vvG7cwL_q7zXD73hbq6x1vwhO=oOAzQ@mail.gmail.com>
Subject: Re: Upstream patch submission checklist
To: Joel Stanley <joel@jms.id.au>
Cc: Christopher Bostic <cbostic@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 02 Dec 2016 01:53:55 -0000

Hi Joel,

On 30 November 2016 at 19:53, Joel Stanley <joel@jms.id.au> wrote:
> On Thu, Dec 1, 2016 at 12:51 PM, Simon Glass <sjg@chromium.org> wrote:
>> On 30 November 2016 at 17:44, Joel Stanley <joel@jms.id.au> wrote:
>>> When we submit the fsi patches upstream we want to go through the
>>> following checklist:
>>
>> You may be interested in patman, which does some of those steps for you:
>>
>> - runs get_maintainers.pl
>> - creates a cover letter and generates patches
>> - runs them through checkpatch
>> - applies the patches to check that all is well (your last step)
>> - emails them out
>>
>> It also deals with generating change logs.
>>
>> You should be able to find it in the U-Boot tree (tools/patman) along
>> with a README.
>
> Thanks Simon!
>
> This checklist was for the kernel, but you're right, it applies
> equally to u-boot patches.
>
> I hadn't seen patman until you mentioned it the other day. I will take a look.

Yes, actually patman is useful for kernel as well - generally anything
that uses kernel style.

Regards,
Simon
