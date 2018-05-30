Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22f; helo=mail-io0-x22f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CsqoTxlV"; 
 dkim-atps=neutral
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wffm29VdzDr61
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 15:44:15 +1000 (AEST)
Received: by mail-io0-x22f.google.com with SMTP id g14-v6so20250130ioc.7
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=LF4wXu7PfTDjMl8hAM7JFj6cvQfmGupeCQUOl1aWBmE=;
 b=CsqoTxlV7eVEnDgBycoPZGe/IeKEqX7ogPZqMFLAsSQcI0y17RxMCBmnITrjbmTkYj
 uuFxt+0KkqQxGkX/kzllMWRced8BqI8HY48IGrQu5zENjkuRWkcMsfWrGAkNawOnhfH9
 DWDMCfd8bRkSntR1FeGOVquZ5w1Aw4T6i25/OnZN00Mf5RfPvp5adkGBydtRrfbg4Fio
 b1xeTtnhE6cvjqsFcybtZm+wjWfTe9CJRHKtJTL7BlEppImyPJVp7X9N0LsFBVbzXFE3
 UanAp6hL2XrOf2tSvRjsgeaLLuEbn1vvUpzHMA+A0OisZ4NStkkMtbKjMIDINZADJ9jg
 rpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=LF4wXu7PfTDjMl8hAM7JFj6cvQfmGupeCQUOl1aWBmE=;
 b=peCLeQO1cBDYCkJQ058vuTKOekYjq3Lx9+kBgtvgHGjrFMxTe+O0v7wSeLzo+HM8wb
 hfW95rrkNRUGh/6njv7JZSukePYB79iSsLODyrAiV5wXsHrDdveZN520amIWai8cXRK6
 30J2ezopwAQtDdn5vcpOo+LafXCN8qKSz5c0vhxrtNDd/ccMZATl0XlbgcqvvTBcJsd3
 bUYLG1iXTafG0jrFVYQMyBWbcRE8sKaWlBQStBLn/11B8qWCzsGywfP9tsqEnrJAu+Ux
 m7YBQuc0rroMJvrv0ulQhfb3C366OVOOjTqLWw62FhBgUbwCBxrG2wVlnCrByfBfxbqz
 Ohiw==
X-Gm-Message-State: ALKqPwe42icR59EoT5io1Rlub0kM4LDTqyh/2h9/wTvmYWRieBc8iTky
 BUGR9EhoqbHs+l6/p/Ur4Usa7+BZWZzQo+L57ss=
X-Google-Smtp-Source: ADUXVKK96Q54iF8JbFS9n7mFnESIZqW6mRJ07aTvwlF/Hkx6tFN631dpDmTRcPYrCP3WXpoNVQlYCcLLQ12aXS6KxFY=
X-Received: by 2002:a6b:a784:: with SMTP id
 q126-v6mr1080106ioe.98.1527659053096; 
 Tue, 29 May 2018 22:44:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Tue, 29 May 2018 22:44:12
 -0700 (PDT)
In-Reply-To: <CAG9c7cDZpOFbuwXXDQKTJ0cVE54ihxH_tezcssngF+jpwnyMvg@mail.gmail.com>
References: <CAG9c7cCVmjbxMLFie0_bHtU60amR1S2aoygHgT7bV9rWRdEXTA@mail.gmail.com>
 <CAARXrt=5dFZwqeW4+sradJYwYaaFr4-rQbVP-MhQf=j6LQCQuA@mail.gmail.com>
 <CAG9c7cDZpOFbuwXXDQKTJ0cVE54ihxH_tezcssngF+jpwnyMvg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 30 May 2018 13:44:12 +0800
Message-ID: <CAARXrt=7NO+qyMTX7w=bKT4sKUFyFeD+fAQ3Aa3N-bddDHsOgQ@mail.gmail.com>
Subject: Re: Fail to start org.openbmc.managers.System.service
To: Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 05:44:17 -0000

On Wed, May 30, 2018 at 1:34 PM, Henbin Chang <henbinchang@gmail.com> wrote:
>>
>> It looks like your build is missing the `pyinventorymgr`
>> A quick check:
>> 1. It comes from obmc-mgr-inventory.bb;
>> 2. This recipe is added by packagegroup-obmc-apps.bbappend in meta-openpower
>> layer, with openpower distro feature:
>>     RDEPENDS_${PN}-inventory_append_df-openpower = " obmc-mgr-inventory"
>> Since you are missing this recipe, I guess your build is not openpower?
>
>
> Thanks for your response.
> Yes, my build is x86 not opeppower.
>
> I tried to add the line into meta-common/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend.
> RDEPENDS_${PN}-inventory_append_df-openpower = " obmc-mgr-inventory"
>

The "_append_df-openpower" means this is valid only when openpower
distro feature is enabled.
You are on x86 build so there is not openpower distro feature, so you
still do not get this recipe.
You can remove "_append_df-openpower" and it should work.

> But I still couldn't find the inventory in the /usr/lib/python2.7/site-packages/obmc/
>
