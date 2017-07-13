Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x233.google.com (mail-yw0-x233.google.com
 [IPv6:2607:f8b0:4002:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7HdP31hlzDqjY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 11:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIK00SJ3"; 
 dkim-atps=neutral
Received: by mail-yw0-x233.google.com with SMTP id a12so16669973ywh.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 18:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=74eTBV8n9vABB9YBOuk0LAgXr64a15cq8oBdQKQHzbY=;
 b=UIK00SJ3cSGTbZJCD1bgf2a4Gct3jeNMKJoh62LnSiz05jVHnss9g+3F3ujadRsOF6
 QfusOAARicx+ew/6Ieg8BRCRVtXrpiaKEKH/eVu58EoNMKbGyWOFgeCXu2WrM14hq0+Y
 O33LuxgmVP28IqF5YZyL0ZT/6Tbn4HZ19wMUrH8HF3qE6B4RnVZDIbx9eBxV0YSRERyp
 0LTx9HvrdibRrxFqLQhUPwp1+97nHGYXjqVncQ9mLJWT/PSObvpMWbooHAo7M3Eh38Aw
 7i741wns0bgpycJYt49JjU3Yo4mbR2UmQLiQOl/0uwnHvUlc8rFxN8V10E8CR8kqij0u
 DjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=74eTBV8n9vABB9YBOuk0LAgXr64a15cq8oBdQKQHzbY=;
 b=BSy4bc+khdM3IdV9sfOapmCsd2uGLvVZ9LZGCcY1cXAlca+qu4A8ejdCnd5Q3JeQAu
 GDYFk/lsN+aL4C0v6FvImV2VLcdSahExrruAaZthQwDVeXkKuqj3QChb9/pWf8CMXYD4
 pwUuwHRCk9hW2ApuFM0Wdf9ji1I6AwX7sofMP/mzuIOWBqrHN+p+uGm6cjTovgUq4K1p
 A59Rkl4Src5WxD+kn3g9ByBBKOZ6OKOPSvYIPJOFwZeGPn9CSotyuhd2uIE+9sz4UPLZ
 rbGmBw49WzUmsEucPs/Wz3DNlVgmEU2fCLVbtb3SW9uGkN8qgHMmPaqRwnDLbq8m4YJp
 dC8Q==
X-Gm-Message-State: AIVw110bzbS5w3vnuUy9LfF+tFnfTV5Aqso/OGtW9UxNnk2syjQVN68c
 sW7244HEgKfQcYRwUi93WQMbwcTmIg==
X-Received: by 10.129.102.8 with SMTP id a8mr87557ywc.2.1499907831099; Wed, 12
 Jul 2017 18:03:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Wed, 12 Jul 2017 18:03:30 -0700 (PDT)
In-Reply-To: <1499905281.4935.13.camel@aj.id.au>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
 <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
 <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
 <CAPLgG=k=Tvtp3JuC601eiS6jHPF=F_Ye5e=z9BC1h1OyzAR1xQ@mail.gmail.com>
 <1499905281.4935.13.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jul 2017 10:33:30 +0930
X-Google-Sender-Auth: YiVPZTarDdL0dguK1TtH51AGrd4
Message-ID: <CACPK8Xfg+=fdvpUu2epQMdtMaCu6Be1cLxELJ0OM+ac5ZMQWSQ@mail.gmail.com>
Subject: Re: Linux Kernel PMBus drivers
To: Maxim Sloyko <maxims@google.com>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 13 Jul 2017 01:03:54 -0000

Hey Maxim

On Thu, Jul 13, 2017 at 9:51 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Wed, Jul 12, 2017 at 2:17 PM, Maxim Sloyko <maxims@google.com>
>> wrote:
>> > Hi Brad,
>> >
>> > Thanks for the info. Do you know which kernel subtree should I be
>> > basing my patches on?

Looks like everyone has you sorted :) Ping me if you need help with
anything else.

Cheers,

Joel
