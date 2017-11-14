Return-Path: <oohall@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bS7BSm5t"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybZq90S18zDqky
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 15:51:48 +1100 (AEDT)
Received: by mail-qt0-x229.google.com with SMTP id n32so6563598qtb.2
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 20:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=buLZUgENIIuhcaC/wNtY+wXIkeaLtjhYz0R7uGju1qM=;
 b=bS7BSm5tjbRw6UqtORG3EzSbAATeMUAlkgP9b3so6x37KMR5SyUNP8jbssTaUu0tta
 YaTcvDweaFjxsptTkI3jDt65eF7aXjQ9wnBX7yEsnNpKqw8n4SaQbZ/37p3vzJbSQq9i
 e9z9kHTVkIYsVuzbPWdL0QswMActLwIbm3wYI6bwl5iDMOIPdDG1sIbyBt9U9il7OR+t
 FtDP/Lhw8gl+i4CnCORv/V/AqJ01q7Oo51SQ4z3AcPsWqObmEWPIzeZIHIqVmMCXkjWx
 swJsD+C+vZmNAnb+QkABa1wxtpb+Rmc1B5dHXuz5xXc3I0XmbSAwORmy/1ExqI0rOp4O
 M+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=buLZUgENIIuhcaC/wNtY+wXIkeaLtjhYz0R7uGju1qM=;
 b=jcqbvF8WbejksC6epay789+BMQPQDrSJT3eZv4yk6Db//wFsF122tgB4ptOeadBr2K
 fe4QCDxvAt/m9PmPWsiyyHHjRtSpgGGsk4mEuKH5mIXdcmlNtIyoAZRJKOhnuC9KUUZb
 vNpZlQD8DQ+dgHD2+SCqxbLwj+W1AOql93j92rg7hjeLwX1epb+3+HBdVRkY0rnI6+TY
 sUvgHsDTcJDWsGfxL8JCWzbNKraZlJLFKHvzOYhfG2AWybV5dRK/n5nLXpXfWcplmHBt
 PmljSKb5JG6WF5tUJMloucixV6NJvmIh/pTmMXTakdCn5K4zFuOi6Ps1ZVMSnGXJlxe8
 JcCQ==
X-Gm-Message-State: AJaThX75hfvKmpcS/73c1Henv5Yv93YVVfCR1Nc6/47bekev2TMAqtI6
 Zce1ToYtkb27sXD2yyCzI7+cedBYx4SYrXmxvFc=
X-Google-Smtp-Source: AGs4zMYiIKKmSnVOVaVOs1byicqKyn0hPM8uFO2C3IS4UbVERspgbEleGHMIgAiLaZqYnWzrUQ8hr+aQpIkhlfUnwu0=
X-Received: by 10.200.54.176 with SMTP id a45mr8094399qtc.176.1510635105163;
 Mon, 13 Nov 2017 20:51:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.86.100 with HTTP; Mon, 13 Nov 2017 20:51:44 -0800 (PST)
In-Reply-To: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
References: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 14 Nov 2017 15:51:44 +1100
Message-ID: <CAOSf1CHOB-NEMdg6J=xb5x_tc7FptcRdPhTdSn6w4GNToC6=TA@mail.gmail.com>
Subject: Re: checkstop processing
To: Sergey Kachkin <s.kachkin@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 04:51:49 -0000

On Tue, Nov 14, 2017 at 8:34 AM, Sergey Kachkin <s.kachkin@gmail.com> wrote:
> Hi all,
>
> i'm investigating the checkstop processing and looking for a way to isolate
> a faulty component with OpenBmc.

What did you have in mind? The IPL time checkstop analysis that
hostboot does *should* handle all this stuff for you. I'm not sure how
straightforward porting that functionality to the BMC would be since
it might require access to data from the system's MRW.

> So far SEL logs available via REST are not really helpful.
>
> Is there any data source in the openbmc to troubleshoot checkstops?
>
> I guess eSEL binary data parsed with eSEL.pl can be more informative but do
> we have any procedure to grab the binary sel data and parse it with the
> latest obmc?
>
> Currently it seems that IPL checkstop analysis is not really working. i mean
> that faulty component is not deconfigured on the next boot and gard list is
> empty.
> It can be easily duplicated by injecting an error manually via putscom.

What errors are you injecting and what are you using to check for GARD
records? There's an open bug (SW404983) concerning hostboot generating
bad gard records which the openpower gard tool doesn't understand and
a side effect of that bug is that hostboot might overwrite records
rather than creating a new one. You might be getting bitten by that.

>
> thanks in advance,
>
> regards,
> Sergey
>
