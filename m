Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22a; helo=mail-io0-x22a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jym608dB"; 
 dkim-atps=neutral
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCLgH73SPzDqJ7;
 Thu, 12 Oct 2017 17:34:49 +1100 (AEDT)
Received: by mail-io0-x22a.google.com with SMTP id 134so155398ioo.0;
 Wed, 11 Oct 2017 23:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8b+hNzlzTtGhsTdTJi2JP+96TrERsLeqU1TVlsuJsPI=;
 b=jym608dBdSsV3hcUeW7MTWNe/dyTNXRBw8s5DXoffVkDMbU0v+ivaC2t/ahOcBJM3C
 fLJtdOGyIp4iGqXETtpW/y1MVBRUnDpJ3tREtkaUrjvkbtZjXjh1qJ6dFw8PJtLf0hqF
 ImQ2ncncxYuaT6kNckCKuSWCNI4uTmUTV3+Vez1auVbOILfo9bZAyTlL/zDQr6d+0ZVI
 IooLCnYkechdamgcYuGWVtaVJ4IwVaXvIviEGPCJFj+4WIVsuqV9S3jttggNOMrMIvek
 cm5oilmUpoY/eR47AR+Ja7b1/KLGcAo8K2FbhixFnz8t2A6irioU4gRBfRklS1nb99qn
 A37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8b+hNzlzTtGhsTdTJi2JP+96TrERsLeqU1TVlsuJsPI=;
 b=AqJ3YO1Szsj/ofUBpBjOpm1xRZGylZ/wJlrTewasoDEBYnCV2rknGQYu/pvOVFmZL0
 KkYb8ZHrwUtvped/b3zL0Imn1LnlIZ6g/ru3PICFbf/1VPNDsBwaKovvYXpxbnpW4Q5y
 +EwVLw9ca5pNrkbdCCSCLnFPh3omS0scQfaCyxYrk6DFR290cVGZgxth1/VSxYmJQPY8
 vFhSVVEjeE809xPRjodhrI7J7TmpijYNvSw0fbnbZi9Pw1cry6znq4OGto37HsQUXzvc
 C/i/XDP9OZllfp4t/7kysSz1Dc2Oxi2F9QFaJV3KIOac42uf8TvAoQRYMBprBViU1W4G
 t+8w==
X-Gm-Message-State: AMCzsaW0Uoxt6ABxucKAwoV+pK34SYWtbi86wYLTX90gGE1WC1JNE+JE
 1X8MtUcs4Ac6UzL++jq2UHquIRCGUV4edk22qVg=
X-Google-Smtp-Source: AOwi7QDtPI/OM++U4zrKv5rKowqZL7keiXHn5WVpA8+MrdX0rfk8DwCK7Ktj4+W2lETRjhEepxXpjhs1ym7X07ks5wg=
X-Received: by 10.107.168.205 with SMTP id e74mr1834149ioj.42.1507790087125;
 Wed, 11 Oct 2017 23:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.9 with HTTP; Wed, 11 Oct 2017 23:34:46 -0700 (PDT)
In-Reply-To: <1507691558.5452.172.camel@aj.id.au>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 12 Oct 2017 14:34:46 +0800
Message-ID: <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>, Chris Austen <austenc@us.ibm.com>,
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, 
 OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 12 Oct 2017 06:34:54 -0000

On Wed, Oct 11, 2017 at 11:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2017-10-10 at 09:55 +0800, Lei YU wrote:
>> Vote+1
>>
>> I always wanted such a repo to put common/shared scripts together.
>
> Great, it seems there's a fair bit of consensus on this. Did you have
> any scripts of your own that we could pull in?

Yup, I have "upload_and_update.py" that do the code upload/update.
Though it only works on non-ubi-fs systems.
https://gist.github.com/mine260309/21ceff0f69b42df0ef12a85c83ec01c3

>
>>
>> And even more, what about a repo that collects the common/shared code
>> (C/C++)?
>
> I feel this is a different undertaking, something that should be
> addressed separately from what I'm proposing. My move-fast-and-break-
> things model doesn't really gel with developing the low-level libraries
> you're talking about here.

Sure, let's focus on the scripts for now.

>
> Cheers,
>
> Andrew
