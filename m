Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z60KlBQO"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qD8B375JzDqWB
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 07:33:28 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id 10so9985819pfo.5
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xveuq4WBgmIViBSDxa3mbTDDwZjWpxuQwPmcK+Vpl1g=;
 b=Z60KlBQOhGjc8WgTeeE9IscWaCwxI3E7LvO38UYd668qZH5JZ5kcPJMQI8gdB3thdj
 OxiRNNL5CxJPw7ydWVtdE3La96OaNh16SyHHohAj1H/PJdjGB9ix4N9uS8559l8lgJv5
 TQawMTZ1RITfjq5l5C6TPH8B3xmZJvEYgDD4W9fxtzNrANL2O1d+arm1UI2b/1byD88g
 ciAHKw2TUsGonpJbAjkGBLwTqoJB2lDrSWPhDSyxIVoAYVn1d2AXyrspVMmdj+BPpKVw
 P4lTFQkFrH5Ca1ZdgPpYTbOrgn5r8Q4Bghlpb5+y+inu+lgP1R1Lzl7BlF4fY6Uf8dfS
 on7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xveuq4WBgmIViBSDxa3mbTDDwZjWpxuQwPmcK+Vpl1g=;
 b=ZAYXhSnv1gLsRYd/h+6LGLwoUurV1gmwHdcA0EUenECA32wOW4iyNdCfh0K4TIQy/O
 rfDpqmYhghItg1YyJLKgq/DxLFbjtI7cbnOyLokKb5eyraQUc8A/Jm7F5H3ckn+EGH4s
 MTCPSeB5C4ChyXC87ZcNtuBicu6Twn9nn8zk6VDo12067ARAbR1Et8EJAO7A+zM8BsXo
 PUOv/lOfbWas82gmIuBgsbEbUOLrdOkRaOGDkjKSgBxY7u3rmBcOnBegsSsotLLmJHPz
 RpbKzAq1ABl2AEF+ROy+QMQaHPRvCF/oBCQ/WYNuzcyKF7vkJXvw9dFDIIb0LPJ0+v21
 /STQ==
X-Gm-Message-State: APjAAAWj9EEjshHPxdqAEPpqvZYz+wJCIztsoNYO4lvRm+MIdeizkDZ6
 49u9VT3Q2FRgcW9UPo89dNVAL4M/tPntT4NJSkFmmovNvpo=
X-Google-Smtp-Source: APXvYqyWcxI/dgcw6vvaEysclPcqiqtGGPwmAF8TcymsIr7tH8U7ktebEnC4NSnTOn4tY4nlDwTXbzSViWEAQtiZK10=
X-Received: by 2002:a63:5059:: with SMTP id q25mr26219035pgl.314.1556141604185; 
 Wed, 24 Apr 2019 14:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxquVk+kOqYax7RqHrXpr4T0Ws4TZs7L=5kqzzKbGDg1Q@mail.gmail.com>
 <20190424160215.aenlfpdk6v4fqs63@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190424160215.aenlfpdk6v4fqs63@thinkpad.dyn.fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 24 Apr 2019 14:33:12 -0700
Message-ID: <CAO=notzS2O54hLZo_A+y=igNTueh8ybwuRU4amwXG-WHDpQzxw@mail.gmail.com>
Subject: Re: tightly coupled fan-presence bump
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 24 Apr 2019 21:33:31 -0000

On Wed, Apr 24, 2019 at 9:01 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Tue, Apr 16, 2019 at 12:06:11PM -0700, Patrick Venture wrote:
> >there's a patchset in meta-ibm that is tightly coupled with one in
> >meta-phosphor such that neither will pass the CI real hardware test
> >without the other:
> >
> >https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/19882
> >https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/19933
> >
> >Is there a special process to get these tested together?
> >
> >Patrick
>
> Hi Patrick
>
> This was merged this morning.  Thanks for providing the summary and
> making it easy for me!

Yay, I saw it go through. :D Thanks

>
> -brad
