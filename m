Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="va+/iEae"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCdj06HZtzDr6N;
 Fri, 13 Oct 2017 04:52:19 +1100 (AEDT)
Received: by mail-it0-x22e.google.com with SMTP id o135so7782267itb.0;
 Thu, 12 Oct 2017 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gSQb8F5LvQ790UetAVpJUYhM6zhGjsT4CqEEkZoU27U=;
 b=va+/iEaeU2+WAAqjIkvCQN6Bxnk49wt8Ip1JeO6B+ggO54DDtX2ddyt8wxZBG4cSE1
 cHeSmnnkdkjbef6GfPDNVxVDjYnTaoa12xL40pxXaoIzlUsAwuLXYc5mlb26XCW/RknT
 VJcQyr8n+07iMwUwciwQyeAUpu44wc1Ue6ptfLWVye7j8En0dYVn12P71qk6xm9Ieoo+
 lwQmMA+ov6YcSG0dkC5fFRahz7vg/nvro5DPXWRGgR3D5bLO+k7QZOBSySllG2rqTafm
 Qw2ePEPmJXqnWc22u5vO64Xg3rbBX9rtb600N5FF9j96Z5rPy9ur4WJhLGzu4LN5FZZ1
 /iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gSQb8F5LvQ790UetAVpJUYhM6zhGjsT4CqEEkZoU27U=;
 b=Uj4Sz4IiQd4D9BwkHuOv8s8C3fHtAcBInNpmFbPdAULy0uv0RHY0hHK0eEH01NS0eb
 ULVvOZklmdgQvE1OY5CNLMh89b3hDtS8ivpqF5kmpPYoCMGlQrQl1bkRQWP3Da+uYB1j
 UeokM/OLo9B3r+/6yf1I4yrFG+e2T3K96kE3h5DjYxTXzSHWLRrJWL/JEGoo1tKyXEwh
 y//APb98jfpYl3Td6CF0lzzVLDudkPYd6H2Bgvos6EyFclv7muhtXazIy4pH0Gug9bl7
 Tjh6CUr+zS+Den727+nvFqT01XgTBirq5j2of/RNO3a4MpKDgBdK8xQ/jvU9COssk6ID
 IBvw==
X-Gm-Message-State: AMCzsaVqii4RnOhrs2mP/80orVSBc+LAPhV7IgBewQhoY0dmTfUqqhhI
 OQFQGNvQHUlvo29PHVtRbPtx48r9RAq8vjRUEcU=
X-Google-Smtp-Source: AOwi7QBhEl5uUm9E03l0QvdAnszbIWqLLLDmLzm7+SG/JLHN+Zq4qkhO05iXq4GNCVJBvrPLKTNYxw4MIvt21x9z7WM=
X-Received: by 10.36.137.66 with SMTP id s63mr4452913itd.28.1507830736588;
 Thu, 12 Oct 2017 10:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.150 with HTTP; Thu, 12 Oct 2017 10:52:15 -0700 (PDT)
In-Reply-To: <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
 <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 12 Oct 2017 12:52:15 -0500
Message-ID: <CALLMt=ri4td=9C6av3jHchZwckffmPdxYkztj1qCav2WMmd3Jg@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Lei YU <mine260309@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Chris Austen <austenc@us.ibm.com>, 
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
X-List-Received-Date: Thu, 12 Oct 2017 17:52:23 -0000

Lets do this!  Any proposal on the repo name Andrew J?  openbmc-tools?

Andrew

On Thu, Oct 12, 2017 at 1:34 AM, Lei YU <mine260309@gmail.com> wrote:
> On Wed, Oct 11, 2017 at 11:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Tue, 2017-10-10 at 09:55 +0800, Lei YU wrote:
>>> Vote+1
>>>
>>> I always wanted such a repo to put common/shared scripts together.
>>
>> Great, it seems there's a fair bit of consensus on this. Did you have
>> any scripts of your own that we could pull in?
>
> Yup, I have "upload_and_update.py" that do the code upload/update.
> Though it only works on non-ubi-fs systems.
> https://gist.github.com/mine260309/21ceff0f69b42df0ef12a85c83ec01c3
>
>>
>>>
>>> And even more, what about a repo that collects the common/shared code
>>> (C/C++)?
>>
>> I feel this is a different undertaking, something that should be
>> addressed separately from what I'm proposing. My move-fast-and-break-
>> things model doesn't really gel with developing the low-level libraries
>> you're talking about here.
>
> Sure, let's focus on the scripts for now.
>
>>
>> Cheers,
>>
>> Andrew
