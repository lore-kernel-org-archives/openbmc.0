Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::230; helo=mail-it0-x230.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AU8O2GFS"; 
 dkim-atps=neutral
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kkF95C0yzF3HK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 02:51:25 +1000 (AEST)
Received: by mail-it0-x230.google.com with SMTP id j81-v6so16543291ite.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aKuGZb7ix2dc54s6ZKZMKvQ+z0SRRVaWD7y9JJibWfY=;
 b=AU8O2GFS7lFTDKBgfbPdsem/0WtbJwY3MoEd5z79Cktb6+9bloQl6VldXTi2fUA147
 VVjJuit/RYFYqmq6VHiYUcBeWlnQiSyesDYkg7J3NDeeNLqGXrGEh3BiL2Z6+z6I+2x+
 QpWh82FMlfkcvQtm3NSdHsoR8nZ3Iaq9CiAmOik7bfTiKgtrvaJvg5jlZhtYXj4q8F16
 dIhrNNsMaqqRQcx9bL5Xh4VAVjn9gobt0LL2rpbOaaWvewmrazW/d/3kbI4zD+Pt4aCL
 gy3RxkFQltIIpxBjZG8DBjaGpw1qKw66O6xgL0slK7PMFANfz3XvDBcsFKq/3NHfUDzC
 /ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aKuGZb7ix2dc54s6ZKZMKvQ+z0SRRVaWD7y9JJibWfY=;
 b=hVFlVDsYGXioUHnneumMKCQARQ6O3vjvocLR/MGHCgK9HGK7U77kZbpkAODkY+WFIi
 zaAUiXK0/z0KqC9prlgmsXewusjdRqVZgTvUI8Pnd/ymMgzNf2Dyr6qL8fnB5XVjfq9U
 MlC48qBwiHUFlFCnl0+rYNZRJx6PjzxDfqLzsIQtv3sR2Z0g6GTmguNuq3efZUOe/tPS
 6Yz4Sx0hRmU8ruhPoCkFHwDIpss/7VqnDUNeQD73e38W9FB7FIqOXyq4IzkuAQYMpEQ1
 Vc1I8dehC5SfNJTtSOKEcEckBRxa36oSTetVdWKfDXCtyjuPajVHCtL1mEwlqAnPs5S5
 7W8g==
X-Gm-Message-State: AOUpUlFryvPrE10UqX3bM9770WSQcRDwjS9iCzaj4oS507can8hdMDVf
 0tRVuEbAe2kRnYeL6N9w1YeAsNahk+3FNK9YXM6Jgw==
X-Google-Smtp-Source: AAOMgpfJP8P97nUmjIqyoNOQTVp+UC9PrLZVkH4awmfOFnZPY9EPXihtx1WibSqy4pbo2flCg2xW0lu/BT1sD3M5/qo=
X-Received: by 2002:a02:9b54:: with SMTP id
 g20-v6mr13782123jal.33.1533574283627; 
 Mon, 06 Aug 2018 09:51:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 09:51:03 -0700 (PDT)
In-Reply-To: <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 Aug 2018 09:51:03 -0700
Message-ID: <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
Subject: Re: In-Band Firmware Update
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Sai Dasari <sdasari@fb.com>, Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 16:51:27 -0000

In an effort to do the OEM IPMI firmware update as full open source
and to enable testing more thoroughly, I'm writing it anew and staging
the patches upstream.
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-ipmi-flash/+/11772/
is the current top of the stack of patches, but that'll change a bit
this week as I implement more of the design.

If you're very interested, and not on the patches, please let me know
and I will add you to future ones.  That said, other than next week,
when I'll be out-of-office, I'm hoping to keep the patches going in a
brisk pace, so rapid feedback is appreciated.  Once the block-transfer
interface portion is finished, I'll push up the host-side tool (which
I also get to write anew).

Patrick

On Fri, Jul 27, 2018 at 12:01 PM, Patrick Venture <venture@google.com> wrote:
> Sorry, I haven't been on this email label recently -- accidentally fell behind.
>
> In parallel to these efforts, I've started upstreaming a design:
> https://gerrit.openbmc-project.xyz/11588 -- feel free to make
> comments.  I'm going to implement the design (it's already
> implemented, but now I'm expanding it to address incoming comments).
>
> Patrick
>
> On Tue, Jul 24, 2018 at 1:38 PM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>> On 2018-07-23 19:13, Sai Dasari wrote:
>>
>>> Any thoughts on reusing/leveraging the PICMG's hpm spec @
>>> https://www.picmg.org/openstandards/hardware-platform-management/ .
>>> One of the benefit would be the standard 'ipmitool' has native support
>>> for the update and changes are limited to BMC f/w.
>>> On a downside, the firmware binary has to be repackaged as .hpm format
>>> for this protocol to do some preparation steps as it support multiple
>>> f/w components in a single package.
>>
>>
>> This was brought up a few months ago and decided against:
>> https://lists.ozlabs.org/pipermail/openbmc/2017-November/009938.html
>>
>> We are going to investigate using the DFU protocol, as that
>> also has host side tools already available.
>>
>>
>>>
>>>     --Vernon
>>
>>
