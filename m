Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::134; helo=mail-it1-x134.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="R23RmYbt"; 
 dkim-atps=neutral
Received: from mail-it1-x134.google.com (mail-it1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Nnf96sLLzDqC7
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 20:23:13 +1100 (AEDT)
Received: by mail-it1-x134.google.com with SMTP id e24so24923173itl.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYMudnpcuoE9mriHRXTprDfbEGug6HmDOfY/0ZBNHSs=;
 b=R23RmYbtLhCkVn1hVpD7vTNHgWEdyu8YRBKemoePXmkql6kGsQsFCnu4kW3CKk50IF
 P6Dyy61Vph9ZyTPS0/ZDQoT4/CC6ceqBpaTRBZPfomJB3I7AoZU45V++T9vB0D22DHi+
 3Im+QvL05fuRSDCek6OZl80OP2mjerPYJ9Ogrt/JBEKeQ9onBUM3Jz9kOHCRo5Mz0MNQ
 A1PwXeDG3w/O6T+pEkZUB+pnMk1Gali6oHK4UhXZY263qCNp/kMRdFTd9lwjQLoiUHJ6
 DI03e6N4Yzsq39kJkJQwpskj057uE20deXX42xow48iP3lJ4Y/PpRDeOfN3RpmdeeRxs
 vD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYMudnpcuoE9mriHRXTprDfbEGug6HmDOfY/0ZBNHSs=;
 b=BLzmZMOSZ/Tk8gxL3hAaEqRr2GUEULsna5YCdTUCwnbzf2vVgHcOlsEnSBmusP9ljB
 c5qHVMhQEAW7xaqzM0BxGRAvCRXz4ImNhIsO/XgOjwzZ6oPY7/IAOqbeid7Qd7aBfV29
 0zXPXF0BnIQ9ZA3pZpzuftJGnG48HrlLXEE0mhbkrWAh66kfSfQZLxKBD2emuEwwLsNM
 P10OO72uLd0Oz/LDcfsuILW8tQpcv6XtBaYmYh0eyltGK+7nxXwNRqTLnXdqWasbmXca
 k4PGGbdfEwuSZDqWcf0eJrxFzlkh069vC8JK04fUNVSIVAzTPLmWBk6SnxWmWmjt9Jad
 9zGg==
X-Gm-Message-State: APjAAAVAZ3+Glx8hdKDlSeGsd/dD1owooTM56Ch6AmmLYCjz9ezL8/5J
 nAxuxnAMB/c8x4icjxxXWIkzpwAcHrA53axFqQM=
X-Google-Smtp-Source: APXvYqxt0y3Bh7GoiQSdlncb2ntuOGfVFdeAkzinThjpwXy5ccYMtZezZxBg4aPYEa1/yJsjAGWhuqJIBf1gkK18T1s=
X-Received: by 2002:a24:d244:: with SMTP id z65mr574315itf.76.1552987388762;
 Tue, 19 Mar 2019 02:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <fa79e3d3-cc85-ba90-42b7-2e6ef69f6653@linux.intel.com>
 <CAARXrtn+ghtcdPLBDVMrMtX31==ZufsuPDCKm11dd92zQwm22A@mail.gmail.com>
 <fb4ea162-ae50-5c02-eea6-3adb200e6ed8@linux.intel.com>
 <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
In-Reply-To: <e592f504-b7b4-ff40-543c-84e99502e1d1@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 19 Mar 2019 17:22:55 +0800
Message-ID: <CAARXrt=wgz7zqDWpx3inzBnMJJdxQ=b5ebLrna1H8A5kXc4r5w@mail.gmail.com>
Subject: Re: Does obmc-ikvm work with bmcweb?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 09:23:15 -0000

Hi Jae,

Thanks for sharing the detailed information.
I managed to do a build on Romulus and see the KVM partially working:
* I can see the video output in the KVM page;
* I am unable to do any operation, e.g. pressing a key does not seem to be
  sent to host
* When I browse to another page and browse back to KVM page, it displays a
  small black block, instead of showing correct KVM view.

Did you meet such issue before and do you happen to know how to fix this?

Thanks a lot!

On Tue, Mar 19, 2019 at 1:33 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Attaching a patch file for back porting of Eddie's aspeed-video driver.
> Diff in below doesn't include the newly created file so I'm attaching it
> as a patch.
>
> -Jae
