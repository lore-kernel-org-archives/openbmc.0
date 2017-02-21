Return-Path: <sjg@google.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS892369dzDqGx
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:25:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dpxXvmIN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="k5KQdxeD";
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id r136so73428496vke.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 21:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=O5wI0YWS+6eA/rWAH3/j0FrJcuMA6/wXyHIaZ5pJ2DE=;
 b=dpxXvmIN5d23ULlHIGurkz2OUyaeW9VYeSaLetpgfOPRLXmWgbE4lTz3H2bDYftUxb
 kuPsRlMgHuJvSOe0KFEQnBe7XlWIziuI5QduLgAcbcmEyZsPiLHeWBKl42AqU0sSEjJQ
 IxZvZ2lASLwxG1vxLmG91r/+7pXn63UK0W0P2D6e8efj1QD+fCNcPIN7pVbQngbqceer
 /aFkTlvs3q/9qFEqdpeTo6Dfe44L3gK+3Yx8IXy34MWQGHaMP8/MHkKHSKfWJ2yJhOrK
 oJmwtkx/ALidDPM/Fd+ekZIJWq97JNzNGRcrr/X99EXJq8foI1YZe7wE9SUvmOitT5dg
 Jj5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=O5wI0YWS+6eA/rWAH3/j0FrJcuMA6/wXyHIaZ5pJ2DE=;
 b=k5KQdxeD9aSZKElWhUTp6oURvQedXYoXU+Bx3h0PiF41m2oPjvOuK1H2zml+GfFI6i
 1CDF71TDArseifwp0iMnCPFhQFc+fmY3dHHMgv4EaygDzR99rNSyhML+effeIh/klv9X
 RNxxGvXc+xYbdD53/gG+iNNMdCh9UwMzUdD40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=O5wI0YWS+6eA/rWAH3/j0FrJcuMA6/wXyHIaZ5pJ2DE=;
 b=oJhNh8JyrwpFbpRUcMNPdsu3f2HKPsvICQmMWjMTxx+82idDj2HmoV6+ubbS1jm57i
 qP/kjyvgmuCHpjcSv78mRJJpO0YQEWpf6zXY8bVp6Njz8XjPWhjdTWrYrnF9q9umv8Ng
 pTu+JNH65om1x5qyAapTWezTUH/DhKfXiaGGbfCyZg7Qdth/p80m0HSl0AT/v480ScMY
 iOJ3iGnYaeT9GFkmqC5HKE6072uUDHUddF1wQsZxcqXk9t2fy/vIWc/7JJiMidbVCm4t
 bDSk001jbacrOWwlTVRhAi/7dhiZrbVJZo5meH8Aop42/NlBEliRb6lR1f0xx87QYvWv
 IJ0A==
X-Gm-Message-State: AMke39kNZ3cIM/P1EgN/gnCWV4gHWe8LjS4LQRybG6KbaHzAzjZ9zgUK1vNkUNr2bHvWJx0+8ruEzuknVQdC6XbZ
X-Received: by 10.31.193.137 with SMTP id r131mr11728526vkf.34.1487654739208; 
 Mon, 20 Feb 2017 21:25:39 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.86.15 with HTTP; Mon, 20 Feb 2017 21:25:18 -0800 (PST)
In-Reply-To: <CACPK8XdnwsbcJ7nJ4QWXXGnmvhswBaHsnjajAKSURbiZN7ZnUw@mail.gmail.com>
References: <VI1PR0502MB30211D216F237DA5240F6FF9DD5D0@VI1PR0502MB3021.eurprd05.prod.outlook.com>
 <CACPK8XdnwsbcJ7nJ4QWXXGnmvhswBaHsnjajAKSURbiZN7ZnUw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Feb 2017 22:25:18 -0700
X-Google-Sender-Auth: LgQXlw-g31vbDTP3xJ9hOleUTSs
Message-ID: <CAPnjgZ2LCJXZreRd+FExFmUppOWSnNE1TqhCHYas5jfJvmTM1A@mail.gmail.com>
Subject: Re: DSTREAM/DS-5 use on AST2500 EVB
To: Joel Stanley <joel@jms.id.au>
Cc: David Thompson <dthompson@mellanox.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 05:25:43 -0000

Hi David,

On 17 February 2017 at 18:02, Joel Stanley <joel@jms.id.au> wrote:
> Hello David,
>
> On Sat, Feb 18, 2017 at 6:45 AM, David Thompson <dthompson@mellanox.com> =
wrote:
>> Does anyone utilize tools like DSTREAM & DS-5 for
>> development and debug of OpenBMC software on
>> the AST2500 EVB?   I=E2=80=99m actively looking to create,
>> or acquire, the required DSTREAM/DS-5 platform
>> configuration files for the AST2500 EVB platform.
>
> I had to search for DSTREAM. Is this what you are referring to?
>
>  https://developer.arm.com/products/software-development-tools/debug-prob=
es-and-adapters/dstream
>
> No, we have not used any ICE or JTAG in our development. We have not
> used DS-5 either. Perhaps try to contact Aspeed directly?
>
> Those of us working on the low level software has stuck to open source
> tools. We haven't had a requirement for any hardware debugging.
>
> Our Qemu model of the ast2500 and ast2400 SoCs is quite detailed. Most
> of the code is upstream, but if you want the latest then take a look
> at our repository:
>
>  https://github.com/openbmc/qemu
>
> Cheers,
>
> Joel
>
>>
>>
>>
>> Does anyone have these configuration files, including
>>
>> the flash programming algorithm file, or know where
>>
>> I could acquire them?  I have already posted to the
>>
>> ARM community boards, but no luck there.

I've used it on quite a few platforms. Can be very handy for bugs and
performance profiling.

You should be able to create the config yourself, at least for a basic
setup. If the device has CoreSight then much of it should be
automatic.

- Simon

>>
>>
>>
>> Thank you in advance,
>>
>> Dave
>>
>>
>>
>> David Thompson
>>
>> Sr. Staff Engineer, System SW
>>
>> Mellanox Technologies
>>
>> 1900 West Park Drive, Suite 290
>>
>> Westborough MA USA 01581
>>
>> Direct: 508-983-6439
>>
>>
