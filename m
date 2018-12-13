Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SL1xxXsQ"; 
 dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Fvmr1BPpzDqnr
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 00:34:51 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id v23so1873481otk.9
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 05:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bc6kMlpXm9Nmg8c6xYZDDubKFa+6U8kdQEokjcEvyBc=;
 b=SL1xxXsQG9m8+S7c18wdvnxd3dFDZhuF28Y0LL/gB+gDdrsp6pd79Md8WNdmBBoAxr
 rX2Isi1SOwWnLR8DqYorrVOXc09FXdDHi6EmC2oRjsfatITA4I+w6riz0U3Uh4DG9JjP
 +CtEKL8DGik9Vx48iz66vqsnwa9FyZbw+cEB5nmWy7pMwpbM0aqeWaYFwCcZVv2czuGj
 TEG8xc6ZJoG9zgjs90UgXvbCbPrCvPvhOOT5CfjpOvNHlP8blalfOskEJub9bfFFuo9k
 9pVB0B8KIw4vrxcW1UR9dJEGNUMR2BqUFI3DubZYqL8pIm/xgp1YkmXEjlPiseEwHq6V
 VGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bc6kMlpXm9Nmg8c6xYZDDubKFa+6U8kdQEokjcEvyBc=;
 b=CtSh3mu28t/LLbgCvLFXjWCWWyEPlm41fgf/fTFAfcGvN4OQWlFXl89j6dwLxKzfTB
 aqaNWVtNwtudGjJljk7aTYgdmpeN+SJ5yal+IqwHaijtz8BBs2t2ocXeGWv9SYhitGWN
 UrqSkSIWHB2MLufDtRS8Atn9YWdtmu0APbn/+DrMXwy9vlfM0EtIoRwuxLbSwKBCKSHx
 AkxTVuDlhm7wNAj540ygx3fV+W0JBZKXTPL25gPifn7si8OKl8rMs/jH55mCthKy9Tqo
 Ke2Ql3Wspa2TR2ovjUNRDRpS4ko6J00unILRPlhl4A2bkeRGp0KfSq4EbQipF9ZKZaRX
 2PMA==
X-Gm-Message-State: AA+aEWY7qILlc/hbz3dU0u6Y03ROjCZE7NtTBBfP05E6U3CINDhMAwWR
 tK5cQp7TqjGRxCRhynbBCp54NdX1wAWk29OkqAI=
X-Google-Smtp-Source: AFSGD/UvrkfKRfaaXs9m5c/PKIvPZrHQ6s/ILjYd3hht6T8DSPdWk2yw5Fn/CPzly7v22Mzp6v7p5DWwZmc4CadUU7k=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr17978703otl.107.1544708088850; 
 Thu, 13 Dec 2018 05:34:48 -0800 (PST)
MIME-Version: 1.0
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
In-Reply-To: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 13 Dec 2018 07:34:32 -0600
Message-ID: <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
Subject: Re: OpenBMC Raspberry Pi
To: truongmd@gmail.com
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
X-List-Received-Date: Thu, 13 Dec 2018 13:34:53 -0000

On Mon, Oct 29, 2018 at 4:52 PM M. D. Truong <truongmd@gmail.com> wrote:
>
> Hi all,
>
> OpenBMC on Raspberry Pi seems to have a bit of interest as a
> stand-alone reference platform. The source has teased the possibility
> of running OpenBMC on an RPI, so I bit and took a few cycles to make
> it work. On a GitHub fork of OpenBMC code, sitting on the
> "raspberrypi-cm3" branch are some patches that will build a working
> distribution.
>
> https://github.com/truongmd/openbmc/tree/raspberrypi-cm3

Hey My, this is great. Especially for people looking to get started
with OpenBMC. Raspberry pi's are easy to get and very
affordable.

Any chance you were going to upstream these changes to
the OpenBMC project so we could have them officially in
the code base?

>
> The README.md file has most of useful notes on building the code and
> bringing it up on a device. I'm looking for feedback on changes before
> pushing the code upstream. Features is a completely separate area for
> discussion.
>
> This was a great learning experience and I hope it's useful for others.
>
>
> Cheers,
> My
