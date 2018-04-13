Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22c; helo=mail-vk0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gvq8lgE/"; 
 dkim-atps=neutral
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N28q4rW6zF1Rl
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 01:42:34 +1000 (AEST)
Received: by mail-vk0-x22c.google.com with SMTP id i75so823391vke.8
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uTdMxHzRj8GOk3RduvK+Tht1Occ9dge8RSAu8QLK98A=;
 b=gvq8lgE/x5Dy3IW5lK/YBi6ajaMBe4QCfEgozdjWkH/nVZ86VjUyvLP3c6aRkm6vez
 vwBlXpSfD7yYgm6fo7AbO95k/hLGju5PGJAdDQ1sEHwSCe288X4uG6LNdy822icD5JsF
 U6hVlwH8DDhs3JkJAgR4dYwPdbk3QyoNX03+u8JXsSsgJJm8a+Eksxj6qJni4ILTb234
 Q5iqYIhDCfYKj2/F0CrAzLhFXZVRfeZ2K0nz1HO3sAjPGaMYijXVQ66HIQCZRJE17+/K
 +NJHz+i1J4QtfKfnKzoPBOJYKBirNK5kvwYWVrHEyX/Q8JsMFT+0DkhzhnUmLfFsZr+u
 Is0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uTdMxHzRj8GOk3RduvK+Tht1Occ9dge8RSAu8QLK98A=;
 b=b1ILSJS5FLrI3cUeQi8+WeZuRFUw3NlSzWWYxw8TfMIu/Ea90D0Kp03sQNX1s+KMk0
 EjXjMojFYmQ+4zuMW3IcWmARltkdAbJMGullTWcXPUeHpJyQrUwq2I1LTruMJO2lAL20
 Q1u0CbTF726idIiyhNinO98ce+SVLCb5Xql6cVAkBlLQnHnH0/1WMFzMBRoLMdJZ0+2i
 uUFp9txPG4y89QaJcEAKXITaMv0i1w57tkHLSIpGnDqqp5lvcHtCMXSvF/u/5UbuGm07
 DarNnoQR0L8+l/9qsGaKd3+/Y+7wYTDNugstq94GmQSgWZDlfWLYhj5l3ZNb+Qav5/PN
 M1mQ==
X-Gm-Message-State: ALQs6tCrz/Yj34Zv2gjb9L82mXZxR/9Z3gADldh+LEwRNt+Ss+69TI0r
 WFd07ARt1WBFMuiG7GKzIvkAGARbtWRxL9t6ZYBHfw==
X-Google-Smtp-Source: AIpwx4/23d7LF/oHK3TCYw2+OpZWOaEzcjC8y2P6ZVeBoLu+XBxlKxO2jGyZt12ORfyV99H/95gj/BEnKZVdJkLzZAw=
X-Received: by 10.31.63.16 with SMTP id m16mr4066470vka.73.1523634151991; Fri,
 13 Apr 2018 08:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 08:42:11 -0700 (PDT)
In-Reply-To: <d428d752-78f8-cedd-7ba6-59cdbcd9e701@yadro.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <16FF3DED-F6C6-42DF-8EED-B8D0382354C1@fuzziesquirrel.com>
 <5a0d0ffe-c4b2-8446-7342-dbdf77aa1e08@yadro.com>
 <CAO=notz=QT7sYgt6SZimc=RReB0PKxZ+FN-B2byjZxy1RFpvoA@mail.gmail.com>
 <d428d752-78f8-cedd-7ba6-59cdbcd9e701@yadro.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 08:42:11 -0700
Message-ID: <CAO=notycGCxGhxitL=6doqP06EZqy6RTbN5nCpDyGGkiQyXS1A@mail.gmail.com>
Subject: Re: YASL Request
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 13 Apr 2018 15:42:36 -0000

On Fri, Apr 13, 2018 at 3:16 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> 12.04.2018 18:20, Patrick Venture wrote:
>> On Thu, Apr 12, 2018 at 7:25 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>> 11.04.2018 05:34, Brad Bishop wrote:
>>>>> On Apr 9, 2018, at 6:27 PM, Patrick Venture <venture@google.com> wrote:
>>>>>
>>>>> Everyone,
>>>>>
>>>>> I'm working on unit-testing in openbmc, and have cracked most of
>>>>> sdbusplus into mockable pieces and verified I can in fact test against
>>>>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>>>>>
>>>>> ...
>>>>>
>>>>> YASL (yet-another-shared-library) Request.
>>>> Can you talk more about what goes in this?
>>>>
>>>> Do you envision something like:
>>>>
>>>> openbmc repo -> upstream project being wrapped
>>>> libcmock -> glibc
>>>> libstdc++mock -> libstdc++
>>>> libsystemdmock -> libsystemd (or sdbusplusmock)
>>>> libfoomock -> libfoo
>>>> libbarmock -> libbarmock
>>>>
>>> Is there going to be support in the standard library to mock linux sysfs
>>> for phosphor-hwmon?
>> Yes, really we just need to mock the path look-ups and file reads.  So
>> if they ask to a list of files in a path, we can return whatever list
>> we want.
> Not really. We also need to support file writes that affect contents of
> other files (writing /sys/class/hwmon/.../pwmX affects the value read
> from /sys/class/hwmon/.../fanY). Without that some units will fail tests.

Yes really.  You just need to set the expectation that when it's read
it returns the value that it received in the mocked write call.  It's
a fairly normal pattern.
