Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RTmmL2Md"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448jF845sXzDqKT
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 04:23:08 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id c17so5148223plz.13
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 09:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ol8L/WVIhsfO8jrYDLlE1ythcoiDtsI/CPxdduLJ5Eg=;
 b=RTmmL2Md5C/HSspED+dieYD67JcCRJ5nA60LVz1eY3/sf5t5AhyOCMpYj2utmHLvis
 Ep2uy05E8cUNbB6rxM4jHk4oeyEp8oy1JEPYNoJ+h3i4XsI8UNZY1UYqYH55qKwsKLZt
 kS5ueO6AT+Xk4PlHoMF7OhsW8vg7ZPJe699wF8UQ5sKNevHNV72g5Q4CQUUw/ZG2QyuT
 sPHAh3S3FOuHhl6zrQnt7ib7ZKMn/UTLfW6jx3a8RSW1W32hc9NCIYOA3jNwwvqkgrN/
 ZwYPFGRDcsNmr+UOYQm7eeUExoszr3wPM1JFspoy/zK2hyO1gokIfUMTvfFmzn4I0TaC
 fS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ol8L/WVIhsfO8jrYDLlE1ythcoiDtsI/CPxdduLJ5Eg=;
 b=L5x1Z0Vi4uZ0CuvGC2hy4800gqNqttCOyk4qplXBapbL4K9ApCU3kGtMifww0s5z0o
 7AT7VFvIR9h6R1B8aF7oart2MJdjbVLo7R2HWe3GtWONEDVgXy8++L3gyZ97H5s/ZFA6
 rKxfL3njF/Cl3BuBX1lqofLKw9vDZRk/S16Hwbcu34QlX/OQB2xnF+sufsSD5sDLhO7d
 Ryhw5UeBwD4dUNG7M+aHzglPE5Wwy7l/9HlTMjdC1tTbsjcvVUQbk58bnk0Ote+2MPTG
 TBtoXNSW7ST7j7N+aAJCsV0/ZssfQJ2EqjQq0v7vynwWOVwgbpND5qoNKM2Myg4LsSAw
 NUpA==
X-Gm-Message-State: AHQUAuZy2D9H5VzBVOpHsEkEcX3IjyOHgScCm6XoX+C0HcB/SMzxDOTf
 gOqV/WzHeKt2e/qIDcWLy/HKPpnZepEjortkaHThOA==
X-Google-Smtp-Source: AHgI3IYCN38jk5Y/CmbhEbaAVBRKjNosa8DizsrnhXq2w4GUxov4656+o2pjfm6x3agrjRkTuL+IauMV284PW8t0as4=
X-Received: by 2002:a17:902:684:: with SMTP id 4mr3210777plh.3.1551288184717; 
 Wed, 27 Feb 2019 09:23:04 -0800 (PST)
MIME-Version: 1.0
References: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
 <CAJoAoZnKrtDtaH91hn7OPtaBnmQiGR1GP32D+PAqdwaRaHpmYQ@mail.gmail.com>
 <20190226180440.GD44612@mauery.jf.intel.com>
 <1CF1EB8B-62B8-4C69-BADE-4B0DE487E9BD@fb.com>
In-Reply-To: <1CF1EB8B-62B8-4C69-BADE-4B0DE487E9BD@fb.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Feb 2019 09:22:53 -0800
Message-ID: <CAO=notyaW0i0AWgFkHmTT+1Sig_DUdkq0d2jiGVxGcnQUyJdfA@mail.gmail.com>
Subject: Re: Max IPMI buffer size
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 27 Feb 2019 17:23:10 -0000

On Tue, Feb 26, 2019 at 3:30 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 2/26/19, 10:05 AM, "Vernon Mauery" <vernon.mauery@linux.intel=
.com> wrote:
>
>     On 25-Feb-2019 05:45 PM, Emily Shaffer wrote:
>     >Personally I'd like to see this implemented as something we can conf=
igure
>     >at compile time, what do others think?
>
>     My goal was to be able to set this in the
>     /usr/share/ipmi-provider/channel_config.json file. Each channel can
>     specify its max transfer size. Then, there is a libchannellayer API t=
hat
>     can provide that value to anyone that cares.
> I agree.

This doesn't address the hard-coded response buffer size -- I think
your new changes for how messages are sent and received will deal with
this underlying issue.

>
>     --Vernon
>
>     >On Fri, Feb 22, 2019 at 4:07 PM Vijay Khemka <vijaykhemka@fb.com> wr=
ote:
>     >
>     >> Team,
>     >>
>     >> I see definition of MAX_IPMI_BUFFER is 64 in phosphor-ipmi-host/ip=
mid.hpp.
>     >> And there is a comment that BT FIFO in AST2400 can handle only 64 =
bytes. We
>     >> are using AST2500 and for our IPMB OEM command, we need buffer max=
 size to
>     >> be 256. Please suggest how to about changes.
>     >>
>     >>
>     >>
>     >> Regards
>     >>
>     >> -Vijay
>     >>
>
>
