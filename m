Return-Path: <oohall@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22f; helo=mail-qk0-x22f.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hSuqBd3s"; 
 dkim-atps=neutral
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybbM707C6zDqky
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 16:16:02 +1100 (AEDT)
Received: by mail-qk0-x22f.google.com with SMTP id d125so8156438qkc.12
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 21:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2vbbCfTghbXQzaD6rXjdo+/X0u2booDe9hu/DEuFWnQ=;
 b=hSuqBd3sld3B94Jqh1/3j0ro2H5k28GrfJcttCHP//jSTtbGxwGy1HprebpaMtwHYK
 /TpwQoXwdbxk6keCM6eKMkPqJMM5aHghZmq+2U2lxn27Zw2Ti09+6detyjm9IIGln0kf
 sz0hPDVj/o9Byh6ToSE/6knpuTgSAfpH1sBZ3T5y+fIC8ke9MruaIhPli5b2BSlURV02
 34v85p+KzJ56uuSj2WSewpNNcCzltQD18xW/BHQmyVa8iF2bXn/XgTfyX+F0skOBQWzl
 mCapH0CYZnnOXq4hbfBXIpeK1OqHPcWk2CsmUbmai4Dc2q66Dh9XxXHPy7ijga8817Bq
 j0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2vbbCfTghbXQzaD6rXjdo+/X0u2booDe9hu/DEuFWnQ=;
 b=g9tiDBeP4QrQ7yJsbANx/GMhKnaJP7upF9sI390fBZMi63APsZc9no9tBOdbzNay4L
 tlIa+M7u9iBoNiQ+l5Q75aAEcy6tsQQUHo4RyU8g9hb+QKVR8FhC2YFfQpTNEAWduZ0H
 MBj++1Q23GoOhmgwaLm0WWhTwu78SOXPSsSkgq4RKZgU7DjNY0c6TqQsx61Tf6KUPoBG
 boEe0wSQQpvTggUzoBTaaR00lUy67gQmg7edoONWsaB+Je8h2wDhq/QyuNEBUeBJbSfx
 pbZA6mlzEDKKddwBMCVUWPqrPC+pXxCqGShgAei8EiXJVemIdP9h4ZVTLWyFIOtisUk2
 MMVw==
X-Gm-Message-State: AJaThX5xHjRn6Q0Wuu66MmVyDjpkVg31FKFOGYYmoqDG7e89X4lmkWuZ
 pQGi3Wt/BkcjF2UJ08kIwPxXI2bEtlmlcbZNF74=
X-Google-Smtp-Source: AGs4zMY4u+P+MBLCvBNQgKrH60byh93qX1uVXIlhKhy2KTbfesskJhKadNcRHF5ZEcw4zbhARPxoJHBFKex1NAEyCpo=
X-Received: by 10.55.175.5 with SMTP id y5mr17217402qke.326.1510636560110;
 Mon, 13 Nov 2017 21:16:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.86.100 with HTTP; Mon, 13 Nov 2017 21:15:59 -0800 (PST)
In-Reply-To: <CACPK8Xd=EKts=4+8mH8khqzBqJRmBjC6sB6RqpEk2SVzc2cOHQ@mail.gmail.com>
References: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
 <CACPK8Xd=EKts=4+8mH8khqzBqJRmBjC6sB6RqpEk2SVzc2cOHQ@mail.gmail.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 14 Nov 2017 16:15:59 +1100
Message-ID: <CAOSf1CHTeuy0V+JvFr8WWdxuvVcoQMLjXNjR8WSgThGcATYOdg@mail.gmail.com>
Subject: Re: checkstop processing
To: Joel Stanley <joel@jms.id.au>
Cc: Sergey Kachkin <s.kachkin@gmail.com>,
 Alistair Popple <alistair@popple.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Balbir Singh <bsingharora@gmail.com>, 
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 14 Nov 2017 05:16:03 -0000

On Tue, Nov 14, 2017 at 2:42 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Nov 14, 2017 at 8:04 AM, Sergey Kachkin <s.kachkin@gmail.com> wrote:
>> Hi all,
>>
>> i'm investigating the checkstop processing and looking for a way to isolate
>> a faulty component with OpenBmc.
>> So far SEL logs available via REST are not really helpful.
>>
>> Is there any data source in the openbmc to troubleshoot checkstops?
>>
>> I guess eSEL binary data parsed with eSEL.pl can be more informative but do
>> we have any procedure to grab the binary sel data and parse it with the
>> latest obmc?
>>
>> Currently it seems that IPL checkstop analysis is not really working. i mean
>> that faulty component is not deconfigured on the next boot and gard list is
>> empty.
>> It can be easily duplicated by injecting an error manually via putscom.
>
> I think you've identified an area that would be great for improvement.
>
> I'd like to expand the scope beyond just checkstop to other boot
> failures: I've tried to boot machines recently that have failed to
> even start hostboot, and I haven't known what has failed.
>
> A tool that inspects recent error logs, and the state of the SBE would
> be useful. We can leverage libpdbg to talk to the host.

The SBE stores some state information in cfam 2809 that we can use to
find out the currents istep. I think we can also dump the SBE trace
buffer out of PIB memory on non-secure systems too. Parsing the trace
buffer requires the tracehash file from the SBE build, but we can
probably able to add that to the squashfs file for the host firmware.

>
> Cheers,
>
> Joel
