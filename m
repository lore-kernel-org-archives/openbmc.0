Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S8iNabGB"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DXP768MmzDqrW
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 18:58:03 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id s22so11046604ioc.8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3/84XBsugjxgf77ktzt0j5IO2hijuabPmzEsYJJdcI=;
 b=S8iNabGBffhhngMWKWniSf627ZicEXwYMEuyYJu2b46oEdXS422ABKL0xmzcB+z1nE
 KxIMsWO8mO81d7D5LQsZ7toFbfPLljF13vfoF5Bt0Ii0ARvZuEaCLPWogHAjIDoqMN9q
 hkp/we0UncDEhFXMfLXu3pGicMtqQ3ftRA5HC1rItgTrjaIUlx6MEFaKPqgQKhlX/u+5
 XivKQuD3qwQk6XpG8thbjY7GeN0TNzdQBdk1Nb1UGSMkUzUhVcFE7I3Drgu3ansRV4Ah
 GaphS/nwl03iYbmEETbsqa/PseknHaxEqmu336HhKxYSkWXiQ19Be51qOMpxeO2nPcLM
 agEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3/84XBsugjxgf77ktzt0j5IO2hijuabPmzEsYJJdcI=;
 b=HTdr02z/vmCq1VC4irXTO4OULF4eYiyaNqEWJd+sE/QWBNZNKeHUGaPHxFzFDaR0L7
 BWJRiwtFviWWKkU632EzJbZxaY55NCAg8RzLpDf9lacdBnevDZINsupWAX8qpCYhrvKd
 IEodSlDnN0wzXMM604eN5eqw+QmCBeDN5v7QOiQ3Q5k3g3lsWOm9heC1boGOPNuCajuU
 NxBh2sjH9ITL6ZQlAP5M+nwQSzTTDftdBIET5iCapjaZB7vwZKX7q2d15W7er9Sk/l1j
 CJOrdSxv/8YZWJBbZc0zHgBXbZ30hAbjQqNyH151IJfLWxdnErPZi4NlmqwrqcXl47Mk
 Zk7Q==
X-Gm-Message-State: AA+aEWYSwlX5ucD0bkN8sFDIUvof2z2rF6cPQiaZaGKW6c3S/eYc9sSx
 pwOg8ajOwo8C7raEAu8fxdSm+eYVeIWPF9iCBjwqy98P
X-Google-Smtp-Source: AFSGD/W2EG7kaE/n9Dk2VtQ8g8tTf0U7pGLHPZ10Fqe8f1Pc9tw8B/utYAvowduJDeZ3LrR1R+J7L8ntaLCSPUlPrvM=
X-Received: by 2002:a6b:c815:: with SMTP id y21mr11579448iof.98.1544515081445; 
 Mon, 10 Dec 2018 23:58:01 -0800 (PST)
MIME-Version: 1.0
References: <8560e4ac81e042deab46bf6b22b2fd1b@HXTBJIDCEMVIW02.hxtcorp.net>
In-Reply-To: <8560e4ac81e042deab46bf6b22b2fd1b@HXTBJIDCEMVIW02.hxtcorp.net>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 11 Dec 2018 15:57:35 +0800
Message-ID: <CAARXrt=QWwVu5pJEWQr7tZYsrt5QNm88QtVfDd7V88FgUXWpZA@mail.gmail.com>
Subject: Re: How to operate the gpio
To: yao.yuan@hxt-semitech.com
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
X-List-Received-Date: Tue, 11 Dec 2018 07:58:05 -0000

> And I also find a python scripts in obmc: gpioutil
>
> But it need import obmc_system_config
>
> >>> import obmc_system_config
>
> Traceback (most recent call last):
>
>   File "<stdin>", line 1, in <module>
>
> ImportError: No module named obmc_system_config
>
>
>
> Does anyone know how to install this module in obmc?
>
>
>
> Or does anyone know a better way to operate the gpio?

gpioutil is an convenient util to operate gpio in user space.

The "obmc_system_config" is something legacy and will be deprecated, which is
installed by "workbook" recipe, e.g. [Romulus workbook][1] is from skeleton's
Romulus.py, or a dummy python config defined by [meta-q71l][2]

Optionally, you could try to remove the dependency of "obmc_system_config" in
gpioutil, and patches are welcome :D

[1]: https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/recipes-phosphor/workbook
[2]: https://github.com/openbmc/openbmc/tree/master/meta-quanta/meta-q71l/recipes-phosphor/workbook
