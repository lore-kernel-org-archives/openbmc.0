Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oa0mbwB2"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cdcN5lhdzF0jn
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jul 2018 05:01:55 +1000 (AEST)
Received: by mail-ua0-x22d.google.com with SMTP id q12-v6so4015053ual.2
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ewHum4mq6gy9ZoMC2+N2Spujoim2QGMZk4f5zR6eCC8=;
 b=oa0mbwB2ZG4wDU0yvirnJ23Xa2k5KPFpmgJyKat2om+JLKX7CYHdPn9rMdzdC6jJyr
 oNFiKUtFjirjx/PItYAa3kyG8D1lWrcD6VfmCNVnBv34A+wCEX8okGYVoJVDdLEM0FQg
 VZcIOTq61zwY1ZAFKG73IchkbmZfkQAM2b8CXZnojwh7PqFjVx3kwecblhnPURu6NmgF
 L+EOnTd0MUEc/CLQJ1sx1Ss/TJl1YxzF5bpkl9ffPP1gqPBzaIFKwFSV8hNNA1+SB24/
 3UEpMa4c79Sr730hIBNYVTZQrM7QjLyeLkzbV2ONvXgozkjokHy+YhOSYL5XkjBdKmyy
 wqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ewHum4mq6gy9ZoMC2+N2Spujoim2QGMZk4f5zR6eCC8=;
 b=M9Oc2xzMNVjdiz1x/AkfsiWqq1FtYzqnQhb7gIolGrODDcfYWyZPVrlp2B6EijK0+F
 ClHKND15i0c+I31soeLQTHLhOwVCa6Psm6jKqlGh6LrNH/wJ+Pa9tZj4M5nNqc21d1Z2
 D5wkWFEdBLikj4wt7FYLyMP46pxjkoCdp5Hkxmv8VS9YE49JplJwst8QCthSdpozWpq6
 DzwT2pW9fAgilpTofwlh86NltrWrjexCkbXzOPQ/AJtIvBoeSMz0q06Ii7N64r4Vpo99
 WDJngtkzmq06sEntV5SamhbTS+jgf2ICc5JBRC88vFUZX3vu/TIMwMSGmD9FI99vpbSY
 WogA==
X-Gm-Message-State: AOUpUlHvB6es4xditYMHTSqnGC4UYhj56rowFo6mB1/6awW/eqeLgj0w
 a4QUB2AmizuNQWZrIq2NX4p3hastYWyiMYSaaY4QfQ==
X-Google-Smtp-Source: AAOMgpe6Wr8woygrux9UN1D6ZIZ8zRP+6XqAbZfSZQYy3uUO0aKDhwcRwqwhLg/2bgsX29wFPPSc7XdXnjTL6iZ+i9s=
X-Received: by 2002:ab0:6214:: with SMTP id
 m20-v6mr5380153uao.147.1532718112353; 
 Fri, 27 Jul 2018 12:01:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9752:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 12:01:31
 -0700 (PDT)
In-Reply-To: <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 27 Jul 2018 12:01:31 -0700
Message-ID: <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jul 2018 19:01:57 -0000

Sorry, I haven't been on this email label recently -- accidentally fell behind.

In parallel to these efforts, I've started upstreaming a design:
https://gerrit.openbmc-project.xyz/11588 -- feel free to make
comments.  I'm going to implement the design (it's already
implemented, but now I'm expanding it to address incoming comments).

Patrick

On Tue, Jul 24, 2018 at 1:38 PM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> On 2018-07-23 19:13, Sai Dasari wrote:
>
>> Any thoughts on reusing/leveraging the PICMG's hpm spec @
>> https://www.picmg.org/openstandards/hardware-platform-management/ .
>> One of the benefit would be the standard 'ipmitool' has native support
>> for the update and changes are limited to BMC f/w.
>> On a downside, the firmware binary has to be repackaged as .hpm format
>> for this protocol to do some preparation steps as it support multiple
>> f/w components in a single package.
>
>
> This was brought up a few months ago and decided against:
> https://lists.ozlabs.org/pipermail/openbmc/2017-November/009938.html
>
> We are going to investigate using the DFU protocol, as that
> also has host side tools already available.
>
>
>>
>>     --Vernon
>
>
