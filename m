Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IPAZ/dNX"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z25WQ6gvKzDrbf
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 07:11:13 +1100 (AEDT)
Received: by mail-ua0-x22d.google.com with SMTP id f10so1901385ual.6
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 12:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZC7LNtb3JuNT0lLHZX4sUbaJ6xpNt8K/MVyn+xJwKn8=;
 b=IPAZ/dNXLHDFih7/QQRkGOeEGTNxchNGM8Cw90nUEBnMQcp448kblWyuGZILxYsR1N
 kxDzZFwJPs8Vcy6l0gSDuQ3HclAd+0E4y6FzmOwxDAnY2ypNXHoOfcn1x7uWGQse2qPw
 gZIzK82Z8i/QQcL5HiGF9of//loOnHENOYhBf+Ilh2MFSvMf7DBUxEUkU4kofmlNOJeR
 yFGS7frjCGUKwRRXbVb3TaD1m0pD88DcLW3WmRbSQTn9JrDn4YdaIqdsBRVHcsPlfMcH
 MT93StS8TdEk3r3H2smOmYtBmEZtgUipoB0NHLV77DfEqv0P5d+jRz/Uhj9GCHVSX5Km
 oloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZC7LNtb3JuNT0lLHZX4sUbaJ6xpNt8K/MVyn+xJwKn8=;
 b=NdlxAPOHl1YOhyZf6jXL7+qc9DwXu1faUrZ3WpAMMU/xNwjNC3X0gisybAStP0wQZi
 uwPcDHyrTqc9POtOLbinlK8WWF1uiKV++s7Ct/PNvRVPWHN1i5eLGAipXLu8VHuU9Aij
 S2W+IKmBD9tOKUHhsQKDpEXPqhjCfSHD2qwo9iLs+2k8h+oN39/so7X0WIn6hkbgSojX
 bcPHr3982BnQZB6O6aD3bcfRwPMdcNDIhNX8aGpfwu7yE3DlLQ9G3hjGJ6S/JuwTK1Wu
 ed5ZLxVY3nlcrsNyOxjnoyymCUe1xSQvjRK+ZKzhio7i4oplXmiGKVPllkNQtoD7vWAo
 vTXw==
X-Gm-Message-State: AKGB3mIykOubAHzfDMDCsJDnjYC91RkeRdfU8UsZZQIomFEMzAQMwfyM
 uVpEVSxdac/MrJ5di4utej0KiVzGHB8Pg57BBLUj8HEL
X-Google-Smtp-Source: ACJfBouooje+EOoODklvlQKFfvnjNx3reWotcgHisvB/hZdsPxbrSeYKQDErECBeveQhbxC8rTw0nTgOuDNwUb3NPyk=
X-Received: by 10.159.50.2 with SMTP id x2mr8594637uad.38.1513800670912; Wed,
 20 Dec 2017 12:11:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Wed, 20 Dec 2017 12:10:50 -0800 (PST)
In-Reply-To: <CAO=notz2QLYXRTajkEK4YA6HRQmwqrOJrEgbDEHxjadvogtvDw@mail.gmail.com>
References: <CAO=notxOx8C1VZgMJcW27jdpNZiQ9dLHeKP3dXSUkzxy7hObmw@mail.gmail.com>
 <5252c9e0e0ca4af89aed350494f998d1@ausx13mps334.AMER.DELL.COM>
 <CAO=notw3EmcKJ9JXfxBduzsQw0WPwrW1rgVRw_eQZ928a5DkNw@mail.gmail.com>
 <5719def7394249b0a5e951fa4e025fb9@ausx13mps334.AMER.DELL.COM>
 <CAO=notz2QLYXRTajkEK4YA6HRQmwqrOJrEgbDEHxjadvogtvDw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 20 Dec 2017 12:10:50 -0800
Message-ID: <CAO=notxxMF6G4Sp+HKwXLDZTuebAd=+946027NMeqjbrekKjgA@mail.gmail.com>
Subject: Re: Metrics vs Logging, Continued
To: Michael.E.Brown@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 20 Dec 2017 20:11:16 -0000

On Wed, Dec 20, 2017 at 12:01 PM, Patrick Venture <venture@google.com> wrot=
e:
> On Wed, Dec 20, 2017 at 11:07 AM,  <Michael.E.Brown@dell.com> wrote:
>> So what do you mean by "something similar on the inside"? Do you have re=
ferences?
>
> I was just indicating that this use of http to export metrics is
> something with which I'm familiar.
>
>>
>> And what do you mean by "not well-suited for an embedded platform"? What=
 metrics are you using to base this opinion on?
>> --
>
> I'm going from design metrics.  Every daemon now will need a thread to
> provide the information to anyone who asks.  So that's X daemons
> needing new threads to handle the requests.  That's my understanding
> of how this works when you add the library to your daemon.

I'm reading through the c++ library for this to see whether it pushes
data to some central metric server, which would be preferable
design-wise.

>
>
>> Michael
>>
>> -----Original Message-----
>> From: Patrick Venture [mailto:venture@google.com]
>> Sent: Monday, December 18, 2017 12:17 PM
>> To: Brown, Michael E <Michael_E_Brown@Dell.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Brad Bishop <bradleyb@f=
uzziesquirrel.com>
>> Subject: Re: Metrics vs Logging, Continued
>>
>> So, we use something similar on the inside, but it's not well-suited for=
 an embedded platform.
>>
>> On Fri, Dec 15, 2017 at 11:06 AM,  <Michael.E.Brown@dell.com> wrote:
>>> Things like Prometheus and graphana already exist and have fairly stand=
ardized metrics gathering interfaces. Why re-invent the wheel here? I would=
 advocate for Prometheus for metrics gathering.
>>>
>>> Quick primer on Prometheus: each process exposes an HTTP endpoint that =
reports metrics in a standardized JSON format. The process can expose count=
ers, gauges, histograms or summaries. The server side is responsible for po=
lling the various clients at whatever interval is desired and can format re=
sults graphically and over a bunch of clients. Each process can instrument =
itself, there are c++ client libraries to do this already. Then we can aggr=
egate them out with a route from the main HTTP server.
>>>
>>> All of the things in your metrics list fall neatly into types of data t=
hat Prometheus format handles well.
>>> --
>>> Michael
>>>
>>> -----Original Message-----
>>> From: openbmc
>>> [mailto:openbmc-bounces+michael.e.brown=3Ddell.com@lists.ozlabs.org] On
>>> Behalf Of Patrick Venture
>>> Sent: Tuesday, December 5, 2017 10:51 AM
>>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Brad Bishop
>>> <bradleyb@fuzziesquirrel.com>
>>> Subject: Metrics vs Logging, Continued
>>>
>>> Logging being something separate from metrics -- I've been toying aroun=
d with different approaches to allowing userspace metrics collection and di=
stribution.  There are likely better ways, and I think I saw a message on c=
hat about a metrics library that could be used. -- but I've mostly been fol=
lowing email.
>>>
>>> I was thinking this morning of a couple methods, some y'all might like =
(one where the daemon owns it, one where the metric owner owns it):
>>>
>>> 1) Each daemon can be responsible for exporting onto dbus some objects =
with a well-defined path that are of a metric type that has a value and the=
 daemon that owns it is therefore responsible for maintaining it.  to colle=
ct the metrics, one must grab the subtree for the starting point and trace =
out all the different metrics and get the values from their owners. and rep=
orts that up somehow. -- the somehow could be several IPMI packets.  or sev=
eral IPMI packets containing a protobuf (similarly to the flash access appr=
oach proposed by Brendan).
>>> The upside to the free-form text and paths is you could parse it out to=
 figure out what was each thing.
>>>
>>> 2) Each daemon that wants to track a metric creates a metric object in =
another daemon (via dbus calls) and then periodically updates that value.  =
then the information can be reported in the way described above similarly, =
except the owner of the dbus objects would be the one daemon and one bus, e=
tc.  This implementation requires a lot more dbus traffic to maintain the v=
alues.  However, in situations where one doesn't want to manage their own d=
bus object for this, they can just make one dbus call to update their value=
 based on whatever mechanism they use for timing this and they can store th=
e metrics internally in their daemon however they please.  Another upside t=
o this is that it'd be straightforward to add to the current set of daemons=
 without needing to restructure anything.  Also, depending on the metric it=
self, it may not be something updated all that frequently.  For many, I for=
esee updating on non-critical failures, or interesting failures -- for inst=
ance, how often the ipmi daemon's reply is rejected by the btbridge daemon.
>>>
>>> Approach #2 could be rolled into a couple library calls as well, very e=
asily such that they don't even know the internals of the tracking...
>>> I like and don't like the free-form text naming of the metrics, because=
 obviously they can be human-readable.  Another approach might be to assign=
 them human readable names and IDs, similarly to sensors so that you can re=
ad back the name for a metric once, and then in the future cache it, making=
 subsequent requests smaller.
>>>
>>> Obvious downside to both implementations (although #2 has an easy mitig=
ation), if the daemon with the internal state crashes the metrics are lost,=
 when it comes back up all the metrics are 0.  If the metrics are owned by =
another daemon, then the library calls to set up the metrics tracking could=
 check if the metric already exists, and use that value to start with -- th=
en you only have to care about that one daemon crashing.  It could periodic=
ally write the values down and then read them on start-up to persist these =
values.  However, you might want the values to not persist... I imagine I w=
ouldn't, however, something like boot count would...
>>>
>>> There are specific things that the host wants to know, that really fall=
 into metrics over logging:
>>> 1) BMCs boot count
>>> 2) i2c ioctl failure count (which bus/device/reg: count)
>>> 3) Specific sensor requests (reading, writing)
>>> 4) Fan control failsafe mode count, how often it's falling into
>>> failsafe mode
>>> 5) How often the ipmi daemon's reply to the btbridge daemon fails.
>>>
>>> Given some feedback on this, I'll write up a design and the use-cases i=
t's trying to address.
>>>
>>> Thanks,
>>> Patrick
