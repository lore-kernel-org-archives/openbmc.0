Return-Path: <sjg@google.com>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com
 [IPv6:2607:f8b0:400c:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vp91Q6hqTzDq7Z
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 00:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OVOvGy/o"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="YsDv4abm";
 dkim-atps=neutral
Received: by mail-vk0-x22b.google.com with SMTP id r69so13894100vke.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ba5uwggMC7K8zzAn2CXI6LtLZVVvRRd22R/1kj7sTOY=;
 b=OVOvGy/oUNP4ZK8WOf3YacvzuTGLA5Tk+2dsk61qk3rStcapnIxkB2ErPYfrl7qDXk
 OSS9qS8KFw/ya4RiGz6SMcdsqemI7Ur7JMVhI+ppeeManBb2gzQk7VccUpxlvskdBVLh
 O47NU5uiBJsgI+ui+MyBF88GByWxxzbm9J4Zbwn8JRmOyBGmI5E++VLKSy/X3ZcbPu7y
 GrNzaOcqRA1YQkTwHyy3l3T72lVdwkOTu35IFAAxO0ybM26Y4kDwynL1YLqpxHZyAL7F
 kLq0y/PGPDkWoimwaPOu1J6XPv38fGHHphRMuFoyLcfKiJYuA+65splugkfY5cpf6z8e
 RQvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ba5uwggMC7K8zzAn2CXI6LtLZVVvRRd22R/1kj7sTOY=;
 b=YsDv4abmDbqNp/tJkfKvf6FGh4EkOfnzA0ZFUwIQDhxuXvSW5JxOZGSvCqHo/sX+kF
 7h2fIU7tiZl1R2TceDiaY9xaZokBqJwGaZNjGDGar2tEYmEoInE9eD88zSICUTQyATL4
 +8YOQAGduL+wE1WmP6nmtndukSN5pYsRF6eHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ba5uwggMC7K8zzAn2CXI6LtLZVVvRRd22R/1kj7sTOY=;
 b=OW2E1qjh8V2WAY3Cnjy9hqOKEti++KB9gznKuffBleXzfVvKQkzI7bv/z5B1lo5Ye/
 5H1YONvfGjGmWXnm4Ihd8YkeRIKJjdFCty4svPVDLDf8CJrzqqeclkzhvQUeBaa6qv/u
 h0Sl1NqVcu4Rij7+QQ5ddYE0mvH+rtiTs9PMaPQiARt8CckRQbjep5H7C6UIE9hJ46/U
 miil2AoR6ghDr2a/NwLLsyfUVGnw6w6uKDcMmzIaxkM34VvR9q815tnC9hvzxt25Xx4L
 Z3NEwWVTqmL6+CDrObqTH/K2e/H1vpUjz4ahxOvsz4jFZvsBh2Hk5gQ3VQmkhD8CvJ1u
 +hTQ==
X-Gm-Message-State: AFeK/H1f93M921Nzso8veij63Y12sK8b1y8zz/3Xq921ZV/IcLdRIdbQasqMtC3fZVkZZg4tpmJNBFOGn0z/2x8T
X-Received: by 10.176.7.38 with SMTP id h35mr17487360uah.103.1490187992348;
 Wed, 22 Mar 2017 06:06:32 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Wed, 22 Mar 2017 06:06:11 -0700 (PDT)
In-Reply-To: <CAFR_W8rqa+WeBkafcFu-hv1Oohvj4DfO4YSw5S0XXNpOAg8dKA@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-17-maxims@google.com>
 <CANr=Z=bMy9v0G-DAHB4LJZnHB1W3rqubY8-EK5Mn4W3dqQOk3g@mail.gmail.com>
 <CAFR_W8rqa+WeBkafcFu-hv1Oohvj4DfO4YSw5S0XXNpOAg8dKA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 Mar 2017 07:06:11 -0600
X-Google-Sender-Auth: luv0INq8RrJmJcKL6l9FvlJNDqc
Message-ID: <CAPnjgZ2E0QdRPN+CJrCgfXWA0bkAZLeOLST2BeWDQkcGUM-C+Q@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 16/17] aspeed: Add AST2500/AST2400 compatible NIC
 Driver
To: Maxim Sloyko <maxims@google.com>
Cc: Joe Hershberger <joe.hershberger@gmail.com>, u-boot <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Mar 2017 13:06:35 -0000

Hi Maxim,

On 21 March 2017 at 17:44, Maxim Sloyko <maxims@google.com> wrote:
> Hi Joe,
>
> Please see responses inline, simply ACK'ed comments will be addressed
> in the next version.
>
> On Tue, Mar 21, 2017 at 12:32 PM, Joe Hershberger
> <joe.hershberger@gmail.com> wrote:
>> On Thu, Mar 16, 2017 at 4:36 PM, Maxim Sloyko <maxims@google.com> wrote:
>>> The device that Aspeed uses is basically Faraday FTGMAC100, but with
>>> some differences here and there. Since I don't have access to a properly
>>> implemented FTGMAC100 though, I can't really test it and so I don't
>>> feel comfortable claiming compatibility, even though I reused a lot of
>>> FTGMAC100 driver code.
>>
>> I think it would be better to attempt to integrate this driver with
>> the FTGMAC driver and ask others on the list who have that HW to test
>> your changes to ensure no regressions. I prefer we have fewer drivers
>> to maintain.
>
> One concern: this driver also performs its clock configuration, which
> I believe is very specific to the SoC, so to have that compatibility
> clock configuration needs to be externalized somehow. I don't know
> what is the best way to do it.

Generally the clock is defined by a DT property in the node, so this
should work out OK.

Regards,
Simon
