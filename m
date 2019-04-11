Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AaZQG/3J"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g5B21q7ZzDqSY
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 01:51:54 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id l203so5340127oia.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rq6GR41al5BMAOYvLMnsS3E8IbqD0JVB04pRV9y1sUA=;
 b=AaZQG/3JYbnWNL+BP9GSXyBOFuxoS4jpMJTz9rCXRL9wed++iNNyruovMvMalk6jnK
 s5UpHTDXY9IyATG9YDJlZ9YDKWpVo8n8qPLWi3RgqFu7U+h66d11S/nMkGrNdA5Tmldo
 o3FYwZWe67EBaFG3Z3CGsyy3yB8e9G1jT8XS204wTbxH6AvCEiZtoc2ypYDLihUI0vc9
 /q/1Yba3Tm6LNBHLJJ1i4u8NPAjU/hSDsWD/1RvPthQ1WN4XzQCHdgPi0TLi/gHoND2w
 0Vv3wkAuqCoYXEPMC8/wvXTrowxSoj32FjXH4LZGvoj7+4PmUWdtv5Oj8G/GCfkJzigJ
 r4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rq6GR41al5BMAOYvLMnsS3E8IbqD0JVB04pRV9y1sUA=;
 b=quz556dZ/khjegEtXPqE/j9bqCUvPfKNhOAgZ3W1uHC1ChPjgdOHq4ZC6ClwuEADOs
 oVmvLmQbLQNPJYSwAXCg08N06GxwTGsiSJKp/gGc68ARmaqSElKMSrGf07B5CnN33OPD
 tPqHdA/K2QQKLFPRd67UsN/rFUkCk/hUsDqhhjRysbYIEC5ovO9c6bcds7Cd6NKu4kbY
 jNgQsL5Vr6MPxrqmLYxps1Sx+B3QR3ubQYAO06JW7r8fwPtJYvj52+jHrFZ2EyUEIBzP
 ZQrLthgnW5+X3xPNFmh48ckc/67f3Nh15lfmMq9guVn/zseIQoyNy19TRSKomaHQR/ek
 l1pw==
X-Gm-Message-State: APjAAAXH+LVwMqat5TAbNSpeA0iIUJYOzeV7bodiWnqyxGGJQNITNnQL
 KLLPO/npKyOWgKxiz6RhpZv+cfvLKNPa4uQ+aAE=
X-Google-Smtp-Source: APXvYqxc4U4Fk6TOe6JqYN5oCNwGQ0SM62CyezYVGr2lky9IgAma2hEn8I0HQiC8mhLByRa9Wsd43m70ZhvLKCtf6FM=
X-Received: by 2002:aca:bcc1:: with SMTP id m184mr6854408oif.158.1554997910563; 
 Thu, 11 Apr 2019 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
In-Reply-To: <cd75d086-fdc0-4c83-8094-c3b802f6ad37@www.fastmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 11 Apr 2019 10:51:34 -0500
Message-ID: <CALLMt=oxk3Bevbop-VLG6X2rpWf-fpbf2=KV9SWMWERWFfY_Eg@mail.gmail.com>
Subject: Re: Using D-Bus well-known service names and deprecating mapper
 service lookups
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 William Kennington <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2019 15:51:55 -0000

On Thu, Apr 11, 2019 at 12:03 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> Recently Andrew Geissler, William and myself have been running into limit=
ations of the mapper's service lookups. In my opinion we should move to use=
 well known service names and avoiding reliance on the mapper to determine =
who to talk to.

One thing to ask ourselves is what are the advantages to mapper and
the GetObject concept (I think we all agree(?) that features like
getting the subtree and associations are still useful).
For GetObject the main thing I see as an advantage is actually
relevant in my patch you linked. My code wants to talk to the host.
The interface to talk to the host is currently provided by ipmid but
at some point in the future that may move to the pldm daemon. Using
mapper to get the object that provides my interface abstract that from
me. Will the pldm daemon use the same well-know name as ipmid does
now? I'm not so sure about that. I know ipmid does currently implement
two well known names, so we could potentially move it.

Another feature we've thought about would be if we some day support
multi-BMC distributed systems. Having something like mapper
abstracting cross BMC communication could be useful (i.e. process A
just knows it needs to talk to interface B, mapper could route process
A through a dbus proxy in another BMC without process A having any
knowledge of that). Not really a fully a formed thought but just
something we kicked around a bit when talking about distributed BMC's.

>
> My issues with using the mapper for service dependencies are:
>
> 1. Ambiguities in the way `mapper wait` functions
> 2. Race conditions between bus name announcement, mapper introspection an=
d inbound service lookups
> 3. Increased IPC traffic (decreasing performance).
>
> Expanding on 1, `mapper wait` takes a path name argument and waits until =
the path is available on a bus connection. The problem here is that multipl=
e connections can (and do) implement objects under a given path, so the suc=
cessful exit of `mapper wait` with the expectation that a given service is =
available can be an undefined result, as it's possible the *wrong* service =
was used to resolve the wait.
>
> Where this hits home is that we currently have a systemd service, mapper-=
wait@.service, that allows units to depend on the presence of a service pro=
viding a required path. With the ambiguity outlined above it's possible tha=
t dependent services are started earlier than they should be due to `mapper=
 wait` falsely exiting success with respect to the dependent's actual requi=
rement.
>
> A quick grep of the openbmc tree gives an idea of the potential problem s=
ize:
>
> $ git ls-files -- recipes-phosphor/ | grep '\.service$' | wc -l
> 98
> $ git ls-files -- recipes-phosphor/ | grep '\.service$' | xargs grep -li =
mapper-wait | wc -l
> 32
>
> So about a 1/3 generic services are potentially exposed.

Yes, this has been hounding me for a while now. We had a discussion in
IRC a few months ago about having mapper stop doing introspection and
move to using the InterfacesAdded signal. This would improve
performance (introspection is resource intensive) and it would
severely limit (if not fix) the race condition issues. I took a stab
at a patch (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-objmgr/+/=
17837)
but have been running into some weird issues I haven't gotten to the
bottom of yet.

>
> Point 2 leads to patches like [1] where we wind up implementing a fallbac=
k to a well-known service name if we get issues with a mapper lookup. If th=
is is a valid approach then we should just avoid looking up the service alt=
ogether; implementing this fallback approach everywhere seems tedious and e=
rror-prone, and the lookup is a waste of resources if the fallback works re=
gardless.
>
> By moving to well known service names we can exploit more of systemd's D-=
Bus integration with units of Type=3Ddbus, and depending either on unit nam=
es aliased to D-Bus service names, or on D-Bus service activation, and rece=
ive reliable behaviour for D-Bus-based dependencies.
>
> Point 3 is something William has complained about, and I think it's a goo=
d point - avoiding IPC where we can is a good thing no matter what we're do=
ing.
>
> I'm kicking this thread off because it's something that's bothered me for=
 a while. I've complained about it to various people in private but have ne=
ver taken it any further. My impression is that there's support for the ide=
a that we move away from the mapper for service lookups (though we can't el=
iminate it entirely, we still need the interface reverse mapping feature), =
and I want to gauge how much support it has and whether there are solid cou=
nter-arguments.

Thanks for getting this started. Definitely something that's been
bothering me more and more lately as some of the issues you've noted
above have become more prevalent. I agree that I'd like to transition
away form GetObject usage in our process's. I'd be interested in the
history from Brad on the reasons this was initially created and
whether they are still relevant though.

>
> Cheers,
>
> Andrew
>
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+=
/20460
