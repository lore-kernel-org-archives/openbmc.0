Return-Path: <sjg@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::22a; helo=mail-qt0-x22a.google.com;
 envelope-from=sjg@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nuUsqbt5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="lmUVBV58";
 dkim-atps=neutral
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yDNng6F96zDr5x
 for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2017 10:13:59 +1100 (AEDT)
Received: by mail-qt0-x22a.google.com with SMTP id v41so12181346qtv.12
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 16:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=skup79ZnMZbOpxuUflCH5teMKCtaCxmaQlUAQKnxzkQ=;
 b=nuUsqbt5p2KQzJnA1omflTdSek2x7uPauclyqJa5LOwp/OcGcBBzsTfxx6NkRArWDo
 agBQudeSiLa07BH3NORcIGm0UzUQ7gWhFXOwU8d+KXJu3OqRJvTWzQqwCuDcrS80hZmZ
 zCx+7n1TKzVhPdOtkA7Xd30J5UF0i+GF7pxlsnT0il+9WOs0TnsFIbwn0Z3VSucdG04Z
 w8NYCqG9w925toI1cWI1kOHDNXDTgu4BWGzOIR7kIyR/7S4Lp2zYnVgn/a1NKBX2VIVU
 pNac1/fkaxMfSLeoO07QH21D+lVcyCmRfFiwAHKYUkBOLYkoVX+ZQKtHpFxkRYM88GG9
 OJFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=skup79ZnMZbOpxuUflCH5teMKCtaCxmaQlUAQKnxzkQ=;
 b=lmUVBV58lHepyr/+DILvgBeVuA8XABVqResL/8fhyDqOZEF3/Snl+0kK6jXkColrTO
 55GVHUErHMIC+NCi+pkGAfUFGYWrImiJH08Sf1FuxqeE7H7G7EzG910Oy1d7qRTHKYs/
 OqpWqTJqtiz9zvRVk83G5wW5o3m2WEH1bsCmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=skup79ZnMZbOpxuUflCH5teMKCtaCxmaQlUAQKnxzkQ=;
 b=Q25ZjlPs3Wkb61YSFvs95Z2UcxhZAulrwLMBNxht1cWy0Qd8oLHhKtuie4v7WiULFX
 ieML1B5oWFgrmMngLrk8Gx8UT9ZFdQPSKyZAL34bdMSr3ECMSnhAdUbd4P7HJSTPtcq+
 DtOSlVZpmk4e/QDzQTRmYmz8qaM8p2UfUvZQXwEhaSlu/+4ivCHPqwSw322kfNkZX4BU
 pZFfluMopUKbhz6PfGyiIITyl+n/tyckmoQg4vFWyWMWTlKAAIdJfxuQ6tdZzqBSmH3m
 O4v9Rml9+xI7x1Be+EadcLCa+rCTCuqjNccv9xsz04Sfvx2PV7r4Oc+1jIC/Ewp0wyB8
 fszQ==
X-Gm-Message-State: AMCzsaW6uQMLFMrx8woaIH0W7c449yWubtGllyNev7563ErEzMWXj4qw
 2+KKpYa0vk56sv6LjC4f1EKA1Gj4V4IXSHh7OKxaiA==
X-Google-Smtp-Source: AOwi7QAka2SMd3jtsKo0zS0DcksFZBAbqLELw++PdBr4LAFwIccwlkGHWZIwkENfSq6tmp7YEoNwVm40/qold5RahxE=
X-Received: by 10.200.4.29 with SMTP id v29mr4722697qtg.76.1507936435006; Fri,
 13 Oct 2017 16:13:55 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.200.63.170 with HTTP; Fri, 13 Oct 2017 16:13:33 -0700 (PDT)
In-Reply-To: <OF2E4D41B6.9367FE39-ON862581B5.0003F013-862581B5.000B67DA@notes.na.collabserv.com>
References: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@LocalDomain>
 <OF2E4D41B6.9367FE39-ON862581B5.0003F013-862581B5.000B67DA@notes.na.collabserv.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 13 Oct 2017 17:13:33 -0600
X-Google-Sender-Auth: lu5rK7QMSpO51TBJnS-CmHJL_Z0
Message-ID: <CAPnjgZ0c6UsVMeEhweHGkEBGVTfqsyY8u1NNoFiXarcpQhUAyQ@mail.gmail.com>
Subject: Re: Call for maintainers
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 13 Oct 2017 23:14:01 -0000

Hi Chris,

On 9 October 2017 at 19:04, Chris Austen <austenc@us.ibm.com> wrote:
>
> Greetings,
>
> I received some feedback that people would like to know more about what it takes to become, and duties of, a Maintainer in OpenBMC.
>
> A Maintainer is a lead position in the project who is intrusted with architecture and stability. In return you will have a say in the future architecture.
>
> Steps to get there...
>
> 1) Pick a project repository that you have matured
> 2) Sign up for reviews in that repository without being asked
> 3) provide comments that correctly shape the goals of the repository
> 4) Be on architecture calls to learn from others
> 5) Contribute code
> 6) Contribute socially (IRC, mailing list feedback, writing articles that end up on /. , etc)
>

I might be interested in being U-Boot maintainer.

But I'd like to understand how close to upstream you plan to be? Will
you select a U-Boot release and stick with it for a year or more, or
will you try to target each U-Boot release (currently every two
months)?

For U-Boot specifically you could cc the U-Boot mailing list and see
if anyone else is interested there.

Regards,
Simon
