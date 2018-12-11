Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i30YrEzW"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DbGz5yqdzDqrX
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 21:07:55 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id t9-v6so12405904ljh.6
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 02:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JD72c7/Yuj2EVBpfg4Ma9WrIvuN46bh6oEkjGwv3Q0=;
 b=i30YrEzWIjFoNFCWf6wQVCGSayy227F4ygLgxoJ8UVza1jJ4UDa+KayQboFqjLP958
 tq5ZhRwMr/tlpWONB2Ye46HBH/Rt3ytnmKtAynuJOAMEi0HlBwEsZ92AZGMU0IlqKjI5
 sEH/euScDPckII9iK6ltmUCufIzkJhOhr/3TDp+wsIB7eNr+goR7AJFky9uX3r17/N+h
 YIy453J7WPWx5mI2TOx+bkH6FaBBZAF/SWjonjx/CrJ/tDkbSKwZrfbIT5ZgWeedsdhk
 z+KcmBGjLh03XaWLXt7xP6C6ItOE89Y377Dy2r4oonVqXMXmIzEz/vgjX51Iz0dybZ1z
 CUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JD72c7/Yuj2EVBpfg4Ma9WrIvuN46bh6oEkjGwv3Q0=;
 b=gtJOxAojU1323rlEMT1WRmIu+EEDBthf5jsrLKdfFp+pRehoOz6v0RW3Dg3I1ufELu
 nQmtCXIdx4JyiGdodUjij9LIbroDWBp2H/35Q14GVURt/Se8grr/xGcHP5W1KRLOAOEn
 fehu3D+K4ORph3zoSxe+SSVkkCK597TNiU7bAWkICwNq/Pi2x5AwXY23M7yIPkKI8UyB
 Qkv9eBLqasu/NyDBtaAzz9JIJAC58c113rUZsFiaam/QAPHPp3u5KzdMOCJL21/Zh/ZR
 MNy982d92gmLGZ6DfskYKplwLA9n4pKyKmGchk9LUori7l/s4yt357fmu++SW5LLllxI
 Vrpw==
X-Gm-Message-State: AA+aEWYKDH2TTrj9VLL0OHXdxp+oxLUeCwVPOkVmDA4ydSsHiNxfUhS+
 jyi4aqVvzmYDFd5jxFH7FSNqrfDIfo2VCwB6Glky2Q==
X-Google-Smtp-Source: AFSGD/W2YCb8tV513B4sJ6HEl2PWDKuW1NLb164k+zlsLHuxBKHgDxWbeyVTvAJ1LpzsgVBDH5igrvjOyrk7blTheSw=
X-Received: by 2002:a2e:81a:: with SMTP id 26-v6mr10367827lji.14.1544522871746; 
 Tue, 11 Dec 2018 02:07:51 -0800 (PST)
MIME-Version: 1.0
References: <8560e4ac81e042deab46bf6b22b2fd1b@HXTBJIDCEMVIW02.hxtcorp.net>
 <CAARXrt=QWwVu5pJEWQr7tZYsrt5QNm88QtVfDd7V88FgUXWpZA@mail.gmail.com>
 <37665324bacb42728ccfbb5fb270cffd@HXTBJIDCEMVIW02.hxtcorp.net>
In-Reply-To: <37665324bacb42728ccfbb5fb270cffd@HXTBJIDCEMVIW02.hxtcorp.net>
From: William Kennington <wak@google.com>
Date: Tue, 11 Dec 2018 02:07:40 -0800
Message-ID: <CAPnigKm3kBwJDEeL0ZrR6NfFs6yeASw7f=SvyFgUC6E8ODuYcg@mail.gmail.com>
Subject: Re: How to operate the gpio
To: yao.yuan@hxt-semitech.com
Cc: mine260309@gmail.com, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 11 Dec 2018 10:07:57 -0000

I've been working on it periodically, but right now we support
converting aspeed names to offsets for the gpiochip
https://github.com/openbmc/gpioplus/blob/master/src/gpioplus/utility/aspeed.hpp

I'd like to make it so that eventually you can just pass it a string
from config files like:
aspeed@A5 or npcm@253 and have it pick the right gpiochip and line
offset for you.
On Tue, Dec 11, 2018 at 12:58 AM Yuan, Yao <yao.yuan@hxt-semitech.com> wrote:
>
> > > And I also find a python scripts in obmc: gpioutil
> > >
> > > But it need import obmc_system_config
> > >
> > > >>> import obmc_system_config
> > >
> > > Traceback (most recent call last):
> > >
> > >   File "<stdin>", line 1, in <module>
> > >
> > > ImportError: No module named obmc_system_config
> > >
> > >
> > >
> > > Does anyone know how to install this module in obmc?
> > >
> > >
> > >
> > > Or does anyone know a better way to operate the gpio?
> >
> > gpioutil is an convenient util to operate gpio in user space.
> >
> > The "obmc_system_config" is something legacy and will be deprecated, which is
> > installed by "workbook" recipe, e.g. [Romulus workbook][1] is from skeleton's
> > Romulus.py, or a dummy python config defined by [meta-q71l][2]
>
> It seems I still can't find obmc_system_config in skeleton git tree?
> Do you know where is the code for obmc_system_config?
>
> > Optionally, you could try to remove the dependency of "obmc_system_config" in
> > gpioutil, and patches are welcome :D
> >
>
> obmc_system_config is just used for get the GPIO by name(Like Q4, F5 and so on), so it's easy to remove if we don't need get the full GPIO info by name.(such as by gpio num)
> But if we still want to get the GPIO full info by name, we may need some other mechanisms to get the GPIO by name which will replace the obmc_system_config.
>
> I'm not sure is there any mechanism in obmc now used to replace the obmc_system_config?
>
> > [1]:
> > https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/r
> > ecipes-phosphor/workbook
> > [2]:
> > https://github.com/openbmc/openbmc/tree/master/meta-quanta/meta-q71l/r
> > ecipes-phosphor/workbook
