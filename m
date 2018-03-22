Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ucwlQhDE"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406kDT58tvzF21T
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 10:59:37 +1100 (AEDT)
Received: by mail-ua0-x234.google.com with SMTP id w3so6742897uae.5
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eyyu33MkQR7sim+OJmvGQc97Wj2ENMNE4MZdzgJ2tUI=;
 b=ucwlQhDEGwb44oJgsHsXP7AAB+AYZLwPx/l3VAPHSKX8ACRA4Zq4cnVsfygudimiTJ
 aHYryBKI8KgRhaZcmfSWzhuxrzDM05E49x5fBPRjzOW8jACEAMeQxoRDcygsoCUq2Cyz
 RDInbRBoNW8B4yUXCGqbXCXo6TUWMGhU1dzNWs3ZfORqd6IhS2VqJIx/QYLXFwyoDPe+
 lSHMKHbEGbcBqrUf+cvgZUr8NQDUGsjXIF9i4jVqSD2Rc0/OxnjUvgkOl3bXrAHLnQFc
 UIRDKR5P8XyZHnxvpdr71JZBfln0/oWslajFHZyFFhcauiku9n0mcjPL7sM7aL6L9h4x
 NVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eyyu33MkQR7sim+OJmvGQc97Wj2ENMNE4MZdzgJ2tUI=;
 b=AYteS08Yppp+/WeH+F9LOyDoxti8rJDQZMOgkIYZhGAp7kLkdsesS2pCyyRooRSX5h
 A5Y/DBFESP7vApGSHA+6kl/tnfAYCYuFs7nLCIPyG3sQgPgzuOqhz10cjHT7/QYDYlMZ
 fMYKWXOcqc/gkWVPDse+wI42PBRlOsGEh/n5cfZY3U2QKe9dF+nSyDcUyvX6O5zGqBaR
 du68RY4i9XcrMcgG5SyXntckLlRm2pApK7ZgCJ4KQEHv9RtA+LAfQhuPZzyOBSzjknng
 qvDNvtVokgDAjUZPuG5FnHKa79P37eaZY/r9R+Ea5k0Wgts+i/WtOq9qJsX8xJHTNnjw
 U/IA==
X-Gm-Message-State: AElRT7HpXdSwTSMpHTmvdNYz7d10cOJvEBhDrJttMop5D8Hwm3xzn2to
 q/zlUIuZDX1KJMJuzVggjpWJIhuOSgGvrVKeaARK5w==
X-Google-Smtp-Source: AG47ELtuSd27HiegF7hfjbswO7Q9/osTNobXk1VHcvQNbPbE5/zCdS031oH4cI0hJevx4ycvOf42g6QN6DX1cOIQa0A=
X-Received: by 10.159.56.202 with SMTP id w10mr10957889uaf.147.1521763174684; 
 Thu, 22 Mar 2018 16:59:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Thu, 22 Mar 2018 16:59:14 -0700 (PDT)
In-Reply-To: <1521762255.2947317.1312969448.634F7523@webmail.messagingengine.com>
References: <CAO=notxQAUtUvOcJeTznwp72uXn_STHqtggV8sdexhE-BfuxFg@mail.gmail.com>
 <1521749427.3244298.1312773128.6CCE1037@webmail.messagingengine.com>
 <CAO=notzcXOJzJroXXhYkNc9cawMZcsVtE_M3GMkAcOk6RZTgrA@mail.gmail.com>
 <1521762255.2947317.1312969448.634F7523@webmail.messagingengine.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 22 Mar 2018 16:59:14 -0700
Message-ID: <CAO=notzwNGmghGFGgAGG_ftx1tnA2NDgMvLHvArCSYZmDM64JA@mail.gmail.com>
Subject: Re: BMC Health
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Thu, 22 Mar 2018 23:59:38 -0000

On Thu, Mar 22, 2018 at 4:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Mar 2018, at 08:33, Patrick Venture wrote:
>> On Thu, Mar 22, 2018 at 1:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > On Fri, 23 Mar 2018, at 05:24, Patrick Venture wrote:
>> >> The Facebook presentation yesterday talked about BMC health, free
>> >> memory, etc.  I didn't see anything in the IPMI spec about this
>> >> information, and beyond my general drive for metrics, just system
>> >> health would be great.
>> >>
>> >> Things I care about:
>> >> up-time
>> >> free memory
>> >> ... other things?
>> >
>> > * Free flash space
>> > * Network traffic stats
>>
>> I actually have an OEM IPMI command for grabbing the ethernet
>> statistics that loads as a library into phosphor-host-ipmid.
>
> Ok. I don't know how best to export the metrics, though we (others inside IBM) are already looking at the problem.
>
>>
>> > * CPU load average
>>
>> Basically a cleaned uptime result?
>
> I guess? I don't really mind how we get the data, or how it's exported, just that if we're going to do metrics I think these values should be included.

Right.  I'm reviewing this from an IPMI perspective, things that can
be reported that way, instead of a network interface -- the network
interface being more .... solved as there are plenty of packages for
exporting metrics over the network.

>
> Cheers,
>
> Andrew
