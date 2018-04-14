Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qSX1O7Ra"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40NFXB1C3tzDr5X
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 10:15:05 +1000 (AEST)
Received: by mail-ua0-x234.google.com with SMTP id t4so1137608ual.1
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 17:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yh+r44W6KdtpAk9+DlPaw/zjnVsWmCL4lecUqOUg4VU=;
 b=qSX1O7RaiI0olAh6WBCPACE+ELl8DW+QYPiMC+UcJWfwwJ0d/MRyvk8tLuerc6VZQ0
 ka1QkCsuwa0GbfBhpv1xwdKdoPM4hWbGD1e1ebSKX8J2jgxrCeCUepBF42/Rc2OU9u7C
 /dLi44IqXG7Zh02GuKbdSJe1wKxQgrl0/bPat7l/wlu9xUsflzwrhl+s/PnHauXpVYtU
 k3jg9tG0Bfv3lZ4gNNRedztqADseUmyrrgS4gkrgb7aPCT96YVuQBBGBua3QohMLTEgO
 fnuivFwquX7s+4XeJLz5rnzcCHDF0eE6pQzgblzzYjKcnbOye5HDEVG0yiIOMk9EgG8A
 y2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yh+r44W6KdtpAk9+DlPaw/zjnVsWmCL4lecUqOUg4VU=;
 b=bTQMcW76TLG2pmluzBW+LAkij9vEk9ePqFObeib6fANK9rPmArZD7Fa0gTtXdHV3oO
 /Ni1e5ueLtJprB9jZFrVnYwz7j4bXBENjEMFkhKjJW2Gp80rPt5ndrSRMY5xWFcrMdva
 H/u0DWXwtRmCUrMP9PdcQjtNKVn9mri2p4JXyDFnmV+NmAQ8D2JMu84DoRwUdqz05ETg
 DuqE9gJqDMHOXimFtrmBdq5ElPolFY2khqVrWQ5gIDnvN802XuaJ/10eW9e/jg2VM2v8
 sD2zWWyrU8gUPG4wrreiyvCS+e8kY1Rfvt4oeVZ15WIBhlz+Vzjm1ULVi1Z87kYWOWtw
 SeiQ==
X-Gm-Message-State: ALQs6tCYGlCNOZtEru3bPmSviHa+B4Xi7wrtcEnKIKE8qcideOBxZZqE
 yrxQT6QGiTsMFMl6e8u8zNWJQ9X6JP5T/IsbryHTvQ==
X-Google-Smtp-Source: AIpwx49HNt9siLAFllu/KYNNIG6oHWhr+l/qzE5sJF4HppWBSaUt1t/f/gIzW9qZg5r9mKugQgfyUgbj5qEXPHQO6oQ=
X-Received: by 10.176.13.134 with SMTP id i6mr3742723uak.177.1523664902382;
 Fri, 13 Apr 2018 17:15:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 17:14:41 -0700 (PDT)
In-Reply-To: <CAO=notx+WsxRbeGRPvLEOpfvZPkFQqmF8wx1A408s6inBk7zqQ@mail.gmail.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
 <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
 <CAO=notx+WsxRbeGRPvLEOpfvZPkFQqmF8wx1A408s6inBk7zqQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 17:14:41 -0700
Message-ID: <CAO=notzEMFtZ0gBeacoFsEB1_eArns-pU2dvJ671deztFsf_NQ@mail.gmail.com>
Subject: Re: YASL Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 14 Apr 2018 00:15:07 -0000

One can also use a fake-file-system framework to do some testing if
you need to create a bunch of local temp files.  We have this
internally, there is probably something similar on the outside.

On Fri, Apr 13, 2018 at 9:03 AM, Patrick Venture <venture@google.com> wrote=
:
> On Fri, Apr 13, 2018 at 8:21 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>
>>> On Apr 12, 2018, at 11:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>
>>>
>>> Some advantages I've found to this technique are:
>>>
>>> * There's no reduction of readability in the code
>>
>> This.
>>
>>> * You get test binaries that you can run independent of your test frame=
work, as there isn't really a test framework, just autotools running your t=
est binaries in parallel
>>> * By extension, if you need to debug a failing test case, you can gdb t=
he test binary directly without needing to comprehend the side-effects of t=
he test framework on your test binary
>>
>> And this.
>>
>> Honestly these are my _real_ objections but I brought up runtime overhea=
d because
>> that is not subjective.  I just don=E2=80=99t like how the direction we =
are headed
>> obfuscates things for developers that have a good understanding of stand=
ard libraries,
>> tools, and language features (libc, libstd++, STL, GDB, etc...) and don=
=E2=80=99t have an
>> understanding of the internals of GMock or the =E2=80=9Ctechniques" its =
use drives into the
>> code.  I expect there to be way more of the former (those up to speed on=
 the standard
>> libraries, tools, language features) than the latter (those comfortable =
working on
>> a GMock inspired codebase).
>
> I find a flaw in this logic that, because a developer would need to
> learn something new, because as you say few people will be familiar
> with gmock.  Every developer I've met tends to learn new things all
> the time, and I specifically hadn't used c++ since 2004, and basically
> learned it to contribute to OpenBMC, and I doubt I'd be an exception
> to this.
>
>>
>> IMHO these concepts have a greater (positive) impact on the project over=
all than
>> super-easy-unit-test writing.  I=E2=80=99d guess I=E2=80=99m in the mino=
rity, but hey=E2=80=A6I have to
>> speak my mind right?  I can certainly relate to the opposing viewpoint.
