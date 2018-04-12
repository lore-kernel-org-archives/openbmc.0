Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tyruZTSn"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MPjp3jpJzF1RV
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 01:20:29 +1000 (AEST)
Received: by mail-ua0-x234.google.com with SMTP id t9so3734150uac.8
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MpIJPGfjxgARO4Xwk8wsRhJ7fQwwkmCdTZRFFg+P7vc=;
 b=tyruZTSnLVD2sUs1tACcVxwM5ObBeGyYtl7OAmLwHpTplOcniXg/ib1W81PEvUaq9N
 bQfNsOpoXPqLNk4FGoIj395hiKenjCHfErC+gjjX/z5yBWKo2krPFFxu+9b0JCt5U6d5
 5n0AYcwGZQYtA2tPffwvlbfhGPoB9q0DWcb58EwXnZT8+NucXWt1atmw5RsJxKDFT/nn
 0lEz2aQSwbT37/CuMgmre5uq3tXkpWfxsqRGN1N9o56nD9E9Tj7w4I14YV6JxMn9KQGg
 Qh+Dw5L9ivFC6Pf5JHpVYIiUUNpf2BWbzRHb1+fgvCNVshHZZLqhOyvkslkBczHYi6cl
 Wv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MpIJPGfjxgARO4Xwk8wsRhJ7fQwwkmCdTZRFFg+P7vc=;
 b=QxoKdohSYu7/km0wif+GKcmzdH2zPVezhC3qvCCaX9YmefRTsMuGG0meTFAU2gAhmo
 ZTWN1cgvbOu2vlfMJ6G1hO0N8AviTcIyHlJV+ZShW13Bfv1W4KeZ1aMn+Z/W1X91SEau
 fBUEjixAiemFvOa/0Wob19vpxbSMpIqm+KAzDPAIcdWB8FNWrtK8L9aBZPngXAfUwSqk
 eiajwzuPr/DzYxjI40fc/h0nDfYO7jrVhA8TeZlvruwvCR8DWKVMTmJDIOd0Hk7WXHvy
 ITaMJYYz1xM3bfwpxGWjEQTTfSiTfokZskBIh5qVC9bbihYXKCt3c1kFo64I2VvBxq+r
 nObA==
X-Gm-Message-State: ALQs6tDeL3R9yKt/lqvsClf+59mPChCUgtpDR3Hi+Y4dNfilcY6IPoE4
 gt90wO6z18QE6/LfiuuuONCtsUFsJCFfGn1+Rg9wRA==
X-Google-Smtp-Source: AIpwx4+05QGdu8QDRpQkWcIFkKHrpMY5sr38nEPzIn6jcOKAfkO3XFdR3OPpcFIkbpFgmG0R7mpJyNhl3EHo259xxKY=
X-Received: by 10.176.32.72 with SMTP id g8mr969433ual.15.1523546427081; Thu,
 12 Apr 2018 08:20:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Thu, 12 Apr 2018 08:20:06 -0700 (PDT)
In-Reply-To: <5a0d0ffe-c4b2-8446-7342-dbdf77aa1e08@yadro.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <16FF3DED-F6C6-42DF-8EED-B8D0382354C1@fuzziesquirrel.com>
 <5a0d0ffe-c4b2-8446-7342-dbdf77aa1e08@yadro.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 12 Apr 2018 08:20:06 -0700
Message-ID: <CAO=notz=QT7sYgt6SZimc=RReB0PKxZ+FN-B2byjZxy1RFpvoA@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 15:20:31 -0000

On Thu, Apr 12, 2018 at 7:25 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> 11.04.2018 05:34, Brad Bishop wrote:
>>> On Apr 9, 2018, at 6:27 PM, Patrick Venture <venture@google.com> wrote:
>>>
>>> Everyone,
>>>
>>> I'm working on unit-testing in openbmc, and have cracked most of
>>> sdbusplus into mockable pieces and verified I can in fact test against
>>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>>>
>>> ...
>>>
>>> YASL (yet-another-shared-library) Request.
>> Can you talk more about what goes in this?
>>
>> Do you envision something like:
>>
>> openbmc repo -> upstream project being wrapped
>> libcmock -> glibc
>> libstdc++mock -> libstdc++
>> libsystemdmock -> libsystemd (or sdbusplusmock)
>> libfoomock -> libfoo
>> libbarmock -> libbarmock
>>
> Is there going to be support in the standard library to mock linux sysfs
> for phosphor-hwmon?

Yes, really we just need to mock the path look-ups and file reads.  So
if they ask to a list of files in a path, we can return whatever list
we want.

>
