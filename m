Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KQ+9htVM"; 
 dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DqvS3nXWzDqC6
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 21:37:07 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id z20so10404205ljj.10
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+Il3rfoSOVdqhbsYGZldmWvkadCq3Vp5xbaSwoEV6E=;
 b=KQ+9htVMrD9aZORdRaTmxb2xK+bKHPTQt7137FHRc2jisaiqtJBlRxQ/8ivgk7jOUO
 wxmT4Mf+tR83PotkzdAOVdID7sOmLmTY8pn7F9xGzB5eco59qI21rAxTAlP/IfEJsKVm
 2+vJOlXZi/30Pe0OyYo2lVclXes0ypuX9cDjMjowSOp9BxhQ83pbvxuIGkgyXz71uUIf
 Jgodnhb0sQ72pm4kuEgR6LPnsBOfq4rbu7HT0H9W0n5Lbg1SJ28JMAWFyWe8tzkYpJTv
 Z6Hjam4R/3W2mX1hecAEmkOROBBP6FVUnEGS7QGvcBof+K23877FUZ8r8pG6TFxfi/Tk
 aIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+Il3rfoSOVdqhbsYGZldmWvkadCq3Vp5xbaSwoEV6E=;
 b=SMEEl1BmnNNwDiTGpbc7TIfTwtSzoFuU7D6mmd1u0Xp4lu4GcV5vi1E8dWCecZVkIp
 VSSwxxq7jjyckK7jrcv5+m4S5uU5a2FMI0UXtLh6cLcSC64UQ7E5y6OEkpi5ktaQwAJu
 I+pZmvtblbhWN/brTBFDqZe037R2URLrNmE8mfkHcWue8B6qkmUjILXXQuZiD/PUfUO3
 wlcBHeJ1rx4bOIl0pHELRzrDj98lQ5m2bQrSf+rZQXtB/xf16ltRRLIofv3uHc/x7RpK
 YjY4A1BV1JgtH8vMeAWRNE7mjzl2v/62LXimbqQq+bUZePWEppARrbQM4qwRg0LeIdfM
 YF5w==
X-Gm-Message-State: APjAAAXrzoQ/ernLyYXjRVtmccTINUqEXUG6ZJ7OvqEJhHPRH0MxAS+3
 zlhisEhLU+680tFRgkd1Fc+MlRKkv2Cr/4dG6OdS6w==
X-Google-Smtp-Source: APXvYqyzMbG76CwJWNs4/9lE+96MSQywz+NN1N/+kNzSTY7elnUmmZXUhlU5kU9FAA62VeKv0QFCC/WgI4uo++ZWLoE=
X-Received: by 2002:a2e:551d:: with SMTP id j29mr1839008ljb.178.1551868623132; 
 Wed, 06 Mar 2019 02:37:03 -0800 (PST)
MIME-Version: 1.0
References: <gerrit.1551749502093.Ia129db0d7e0e087628505cad9ef3516dcbb15eee@gerrit.openbmc-project.xyz>
 <0r6d35AXTvWuePCe4ab7Pg@ismtpd0006p1sjc2.sendgrid.net>
 <a85a960904419757f8130938af0cd362203b9c42.camel@ozlabs.org>
In-Reply-To: <a85a960904419757f8130938af0cd362203b9c42.camel@ozlabs.org>
From: William Kennington <wak@google.com>
Date: Wed, 6 Mar 2019 02:36:52 -0800
Message-ID: <CAPnigKm2dPChDV4p6iNkO2++vb=T8c+3QHfG9girBq3gti-SDw@mail.gmail.com>
Subject: Re: Change in openbmc/meta-phosphor[master]: obmc-console: srcrev
 bump fcf8541b87..f9c8f6ca86
To: Jeremy Kerr <jk@ozlabs.org>
Cc: geissonator@yahoo.com, cheng.c.yang@linux.intel.com, ed.tanous@intel.com, 
 adamliyi@msn.com, openbmc <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 06 Mar 2019 10:37:10 -0000

All of our packages requiring autoconf-archive m4 macros depend on the
native version of autoconf-archive. We don't want to vendor macros
that never get updated. If we did dist release tarballs that would be
one thing, but I don't think we should be checking them into git.

On Wed, Mar 6, 2019 at 1:12 AM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Andrew,
>
> > 01:43:28 | checking whether make sets $(MAKE)... (cached) yes
> > 01:43:28 | ../git/configure: line 3944: syntax error near unexpected
> > token `SYSTEMD,'
> > 01:43:28 | ../git/configure: line 3944: `PKG_CHECK_MODULES(SYSTEMD,
> > libsystemd > 221)'
>
> Looks like we're missing autoconf-archive during build, for which there
> are two potential fixes:
>
>  1) depend on autoconf-archive; or
>
>  2) include the required m4 in the openbmc-console tree
>
> Is there an openbmc-wide policy on that? If not, I'll go with (2).
>
> Cheers,
>
>
> Jeremy
>
>
