Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LvkoLow1"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vclv6k21zDqQg
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 08:03:23 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 188so6473595pfd.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 14:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQyKpjZGr9zoJw0oxKRsQm2Vs0TEShDuB+g3HdmKuGY=;
 b=LvkoLow1DHMF/PMqSN9jCEmffQsGSYIrW50vm0anxx8TmOLul2TzlfrKYWW4K5Iq/m
 E6mMpET6/seTmCfXOMBK4YHGrdsd5rQkm4EAmtOpdEeBJn4rZpUmZrrBE4dEtFZDlM0A
 YGvDzPXj/NdgGK7kWUCQ3qDYUQ9BfEP/oDEKnOLEIzGD8/qp8FCxbt/a01GLnMjqNT7k
 QiW+aoP1zW6LNuu6CYx88kzgoOSJaexqifrY9xy36Z7QiPCad2KH2qUAHcshtTIzz+8+
 vmKJ9IX/tQgSE6nwIphIGt77LKjinj4sblwkaIVE5KV37MaCeqBEqz9eKUMbJHbXQCjd
 nW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQyKpjZGr9zoJw0oxKRsQm2Vs0TEShDuB+g3HdmKuGY=;
 b=s0NgpKMFFOB3ibZfPZlbWh1EeaCvOMSUZZvsNiAKOmJubUYpBLF8Fba13FBDQk8cPG
 NdX/CkWKEfG27UalNOmTI9CCpA+F/ARCsoCwNSg+o+vSctT23OWS0m2KxoS2nvuPgS5r
 iqTVSfak3Edsx43ZB0TjvyklwrY3wjaqManZJfPHINyml+3Ufv9pZTAiR++FSA9hJJ46
 T52Sw9vb0Ubma/QcwcvMZWyBoMzjpCpoCR/MKkRKGH74WqLPSrcIiP1CoScFuWiQhzus
 2aLkNp4s4UPE5MQBVrbKmhUOx0ijrP81fAZz7LgMOJiUTmb3DeK68L7mdHA5nFPNRu2Y
 wC+g==
X-Gm-Message-State: APjAAAX7ZhiKRIpH+0u8bVgDDtFtN9YBUcJFlswmub0w+8UqWUgF5q+Z
 PPivFZj/L8sgaMxU3i+5h/rsNUCsjYyI/EkQBy/Vvd639+Q=
X-Google-Smtp-Source: APXvYqwlJuuEUaZA9v4Be5eWNz1kd+qY5waQWlItzdJesxSjndwDFkORPlAq2/dhTb/vxR4vOFFtQuirN1ROyitmFYw=
X-Received: by 2002:a63:5061:: with SMTP id q33mr16260150pgl.218.1553806999742; 
 Thu, 28 Mar 2019 14:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyUi=12Xi+cWMVf6uK5dgvq-d5zhHunBanxZ9QwwzhDzQ@mail.gmail.com>
 <20190328205110.g7f75url4pnixava@thinkpad>
In-Reply-To: <20190328205110.g7f75url4pnixava@thinkpad>
From: Patrick Venture <venture@google.com>
Date: Thu, 28 Mar 2019 14:03:08 -0700
Message-ID: <CAO=notzRT3gMRbgT_cpdKr0swW0sgUUoYgE27fqkR_=Hr9ZaAg@mail.gmail.com>
Subject: Re: moving out of sbin
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
X-List-Received-Date: Thu, 28 Mar 2019 21:03:25 -0000

On Thu, Mar 28, 2019 at 1:50 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Mar 28, 2019 at 11:37:54AM -0700, Patrick Venture wrote:
> >I've started staging patches that move the installation of daemons and
> >scripts out of sbin.  For each of these patchset I have verified the
> >service file is either already safe or I updated it.  Safe here means
> >that it won't break.  Moving the service files to the repositories is
> >a future step.  More fun to come.

99% are staged.  I also went back through and fixed up any service
files I had path-chopped.

>
> Thanks for doing this Patrick!

No problem.

>
> -brad
