Return-Path: <raltherr@google.com>
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd8yH3522zDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 08:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GIiGcdwZ"; 
 dkim-atps=neutral
Received: by mail-io0-x232.google.com with SMTP id f84so13920502ioj.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 13:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6WZSBdr8dzWftCJ5f3rkKgimtUKYKEPxXIAPFzIy/Yg=;
 b=GIiGcdwZaU+h7qq3qtoajg7lM40ZMMYdLn/zeFvi6FRVLAzkd71WLhZDLc8IkmDJC8
 vNkXWWWOcCnJrX90N3EBiyvFkJlBVIPfL1etrt9GAD/eQJk2RRN8MLkSk5hnZK2ntRjx
 67PBAQHaazpAjJmsKz7AkKSp5ZPrnFTCZ843E5cV5881oL48Zc6bzSMHy05C/eyQ9Y+O
 EnMKVXjPcx9JmLiEOVot912e+Z9+MkD1TeFYi3+etRhLvubWxvljqxJftbU16nVuBdBU
 yHURCe/E6LBH0Od62il9m6k843OSXyyi2WfXYhkaEnEuNSfM606NbOsYpuBk06BRi7dN
 +Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6WZSBdr8dzWftCJ5f3rkKgimtUKYKEPxXIAPFzIy/Yg=;
 b=n2CkqznLwgL60LB4n3vgW+xCbAjZWJGCwtolYDwnXsBphr6L0pDayxtf1VBdF9tNgx
 BCJ5unnWd5NbdWyfq42VJfKVe6Bp4HWwmaYhHrLEgPz3N3h7d2jYbQIfJbaZOaKRBQ/8
 oqYw0B0bhioEfcZ9pyhMP1tRkilqJMlMOUfFQmQ0qjyiACLvKBgnum42Lw90+3ys2bPA
 l0nAUSYYAt1PFADMIQWHjcH3qW4fE/aaayKW25uJuGp/O145cvVF66lWgjlWUc9hy28E
 1xqGwIOkxykK/x/AVoNQ1ycdW+6j54a24WK3c5dsffrpGV78poK+pg/dw/NayebRYCBr
 Y4jQ==
X-Gm-Message-State: AMke39k5qaZ8mUN3r6EmHxbSSVApIFCzK9qdtfqZ8Zyb05XkCi7E3d+QIyDWj8e0dXvt8rMPHfXymJ9L45w9CyVf
X-Received: by 10.107.172.134 with SMTP id v128mr3614955ioe.49.1488922357202; 
 Tue, 07 Mar 2017 13:32:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Tue, 7 Mar 2017 13:32:36 -0800 (PST)
In-Reply-To: <CAPH-5w7VWSpob8KSpfYKwOT9HcT9Sab8pnpzOPQvrXd8shDLtA@mail.gmail.com>
References: <20170303205920.146751-1-xow@google.com>
 <CAPLgG==-CnHNe14H9SV2ZCfJu9ZQ_Xc7ayXfkKbQY+_ZmVPubA@mail.gmail.com>
 <CAPH-5w7dkuLF_wfwxtSVsHgxCfe787twEuFa-nh2JkncP3gcLw@mail.gmail.com>
 <CAPLgG=naqWVfr3C2yFBP9HSTR9WC3UT661fEu+ZT3_ETxp+tuw@mail.gmail.com>
 <CAPH-5w7VWSpob8KSpfYKwOT9HcT9Sab8pnpzOPQvrXd8shDLtA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 7 Mar 2017 13:32:36 -0800
Message-ID: <CAPLgG=nx8TACY7NYKXesVsvgqX7w9dprSy15y6W_Ut4WfuMguA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
To: Xo Wang <xow@google.com>, Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 07 Mar 2017 21:32:40 -0000

+maxim

Sounds like U-Boot needs to do some work here.  I'm unclear if the hog
is necessary once U-Boot does the right thing.

On Tue, Mar 7, 2017 at 1:31 PM, Xo Wang <xow@google.com> wrote:
> On Tue, Mar 7, 2017 at 1:21 PM, Rick Altherr <raltherr@google.com> wrote:
>> I don't believe it currently does.  I'm concerned with whether U-Boot
>> or Linux is expected to configure the NC-SI muxes.
>>
>> On Tue, Mar 7, 2017 at 1:19 PM, Xo Wang <xow@google.com> wrote:
>>> On Tue, Mar 7, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
>>>> Why is Linux doing this instead of U-Boot?
>>>>
>>>
>>> Does our U-Boot understand Aspeed GPIO in the device tree? If it does,
>>> then it makes more sense for U-Boot to consume and set these pin
>>> assignments.
>>>
>>> xo
>
> I would think U-Boot is expected to, since that provides the option of
> netbooting from the NC-SI adapter in U-Boot.
>
> In addition, the Linux ftgmac100 driver can't yet handle the NC-SI mux
> changing dynamically (https://github.com/openbmc/openbmc/issues/979).
> So for now the mux must be enabled and selected prior to that driver
> probing. This is the only reason why this assignment exists as a Linux
> gpio-hog: it is set prior to any other driver being probed.
>
> xo
