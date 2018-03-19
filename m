Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Y5E8UKAl"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404mTL6wKZzF1XC
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:33:58 +1100 (AEDT)
Received: by mail-ua0-x22d.google.com with SMTP id c14so11673937uak.7
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BnAqaVl2/EIGwb/W6lWEUPkCq4cgzFWBTvLTIl70PlY=;
 b=Y5E8UKAlvR8C1JvPJ1fLrgV/Q28q7kmJxBcttNHVB/cqpHyqb3sxa13arOnSfHvv8C
 LNPnraEghkFIprV47quv6laA/jeG9hxv3T0IJlT4d0jARbnIlxsLMnsPyAJUhjj5nzam
 ViUJydd4Vy4NPozvjYfcC04tVM1ZPqSZ1ZH6NgfmLL7DlUtclsvHrU+FPpOAgkzTNiwE
 HuDzzBGSBoQ7ZgSU6MQD0rKzbkCN+FduXYrBEeNNPXfoiSjkuISAeXnShUE8gLrY/ecq
 t0iB0PtNCr37KEjPWsKaYju/YiiSWm7QN+xIFAsyl4n4SiWmQA5aGkIFZz5qFkuM0dhJ
 6c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BnAqaVl2/EIGwb/W6lWEUPkCq4cgzFWBTvLTIl70PlY=;
 b=OI+9RmkE0oVio0ZqnFPimIONdMPPMkBPMUUvqdJtli69MYKpzKAPfGGU56f0SusGyF
 T++HSG3oygs411t0JnPfc8iuWFgcFSmVpadSosDKEiJZSuZzcnwAViF9Zzjm3i2YtRLj
 +MFlIPfRdFblxZIvT1/u0cVYBxCpJUyyQ7y+ySoP37Pxkqe8EP/YZo/5n5E6xaLHDIcj
 xIk0sKxZhdDe7Lhx9++twmIuTIxK+owdUZLhP00pW1WqtjKV1//r/IwWWe6agzmqRB44
 P1/s8zQ87qfBZAkmV3IQR2dI+Lytlc7HEmg449zydvmV8iaeRNgNcZRkq5rb7vJmvQqj
 vfow==
X-Gm-Message-State: AElRT7Gh0lgmeRrIfAPUAAUpMmiGpa/sv+WVtb58AYl+N9n5/F3q7Pfd
 P8o6uRaFTeP16eVkO9NmOzs51Z6gp1FPJFDv+kKuMg==
X-Google-Smtp-Source: AG47ELuQM1O6Oromu/Tis3Zt/ibmTVcaKHuIzNE3E0WCsaxXSq8qjQrcagQHl4gwE2JgGw9JeHVI+0sGrJGfd1yXGUU=
X-Received: by 10.159.59.214 with SMTP id y22mr1443985uah.142.1521488035543;
 Mon, 19 Mar 2018 12:33:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.79 with HTTP; Mon, 19 Mar 2018 12:33:35 -0700 (PDT)
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 19 Mar 2018 12:33:35 -0700
Message-ID: <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
Subject: Re: Sdbusplus-based Shared Library
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Ratan K Gupta <ratagupt@in.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 19 Mar 2018 19:33:59 -0000

On Mon, Mar 19, 2018 at 11:24 AM, Tanous, Ed <ed.tanous@intel.com> wrote:
> Have you tried prototyping to see how much space you'll save?  I suspect it won't be a lot for a few reasons.
>
> 1. A lot of sdbusplus is template instantiations, and unless we forward declare a number of base template instantiations for use in the shared library, most of the application code will end up in the binary anyway.
> 2. Sdbus calls into libsystemd, which is already a shared library.
> 3. The filesystem is already compressed, so I suspect that any duplicated methods that aren't inlined will have the same binary code pattern and get duplicated by the squashfs filesystem.
>
> Those are all the reasons why I haven't really looked into it for the dbus stuff;  I can't speak to the timer stuff, but I suspect the wins in size there are going to be small.
>
> Normal disclaimer, on this specific library, I haven't prototyped anything, just done back of the napkin guesses, so I could very easily be missing something here.
>

So my thinking wasn't about reducing size of the binary but rather
reducing the toil of maintaining multiple implementations of the same
code.

> -Ed
>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+ed.tanous=intel.com@lists.ozlabs.org] On Behalf Of Patrick
>> Venture
>> Sent: Monday, March 19, 2018 10:12 AM
>> To: Ratan K Gupta <ratagupt@in.ibm.com>; Brad Bishop
>> <bradleyb@fuzziesquirrel.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Sdbusplus-based Shared Library
>>
>> We have a lot of duplication across daemons using sdbusplus, and no new
>> utility library.  To avoid every daemon having their own timer object, and
>> their own this or that, I suggest we create this shared library.
>>
>> Thoughts?  We can start simple, just have a timer object in there, and then
>> the new timers being introduced to phosphor-hwmon and phosphor-host-
>> ipmid can be the first customers.
>>
>> Patrick
