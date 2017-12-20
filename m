Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::232; helo=mail-ua0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Rkksv0Lt"; 
 dkim-atps=neutral
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z25JS0GynzDrfp
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 07:01:43 +1100 (AEDT)
Received: by mail-ua0-x232.google.com with SMTP id g16so1367156uak.2
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 12:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=84iFNKgHlDnrezt62Kc+OeauRp7EEOEj35i++23jKAU=;
 b=Rkksv0LtLXOzm0GnF2+AcDnzW5EU+Tuc9ps6+NUUX9gnWQALV9S+D9p+Bqxb6jyegP
 rLDg63GhEPiyrLmwx7em82RjNbGO5Trpalqb0NXZKCp96TLCMLAYLk6T8Z++vV9bSTd2
 lgiY1XKZqKUa4d0Ff5MWYS6BFCnhqh9+Jf+6F7pziqZnuxoT1Zb+aS2F7G7TR57ACTfB
 53n2uB3KetNDiDv1mVK4OKcmHYquTfsbRinBwzs6xyGOQ+to4Ea3+ty6Ezebet04zRVv
 s0ZkJLTQaFMriUnehuv8MpTsMBDR8bofSYo0V5vsqeNKBhUgBWYgQgwUEICQ9fOrSQRa
 qzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=84iFNKgHlDnrezt62Kc+OeauRp7EEOEj35i++23jKAU=;
 b=VWxU//PvmWhkqEZIDXBfIpm73Mo1L/VjOf8ED0dhWC3wHIi8QjsvUSLNDOf4GuANSX
 hv3XASdz0T7iKH0+9HMAz7hJbGPq+WQ18f1ecINjiCTeZZ1QtoQ14k8R4XndaIqD1wUD
 NLCHmlZpBp6JtyYXcZlspYpoWqmAJRKI31/+x53CzL65QpZ/Wx4awSTCnDCPUtuqrlVO
 +INB0Qpg3N0XIcDTKrBAhFlomq4w3y9n4XAebAcL4ZbNwrjQ/X/YgpmXiLRtzxDRhqbt
 YShhcP4vM1ZElo23uhrexbh2RfuwA7l+aaeV1S2IdIWAjIxaGwL1U/C4PF5/PHXzPIke
 ju7w==
X-Gm-Message-State: AKGB3mL1e4iXSCzuO0j8ulv7vveIYBdJFXRq8FjIr3GYdhYV2GRZhzCq
 Goj1QrWBTfZzRFuSZHiHGkYRWkVlkTOrwSh2wk4XPg==
X-Google-Smtp-Source: ACJfBovD3GRLXwa81EmLkOnrRug5cBmHRRLFYx1ux+gnJUYl7jwv1IFZlMnl+ua1r6/77/rh8f5+bgg+sVl0i0mCYuQ=
X-Received: by 10.176.74.134 with SMTP id s6mr2242856uae.156.1513800098103;
 Wed, 20 Dec 2017 12:01:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Wed, 20 Dec 2017 12:01:17 -0800 (PST)
In-Reply-To: <5719def7394249b0a5e951fa4e025fb9@ausx13mps334.AMER.DELL.COM>
References: <CAO=notxOx8C1VZgMJcW27jdpNZiQ9dLHeKP3dXSUkzxy7hObmw@mail.gmail.com>
 <5252c9e0e0ca4af89aed350494f998d1@ausx13mps334.AMER.DELL.COM>
 <CAO=notw3EmcKJ9JXfxBduzsQw0WPwrW1rgVRw_eQZ928a5DkNw@mail.gmail.com>
 <5719def7394249b0a5e951fa4e025fb9@ausx13mps334.AMER.DELL.COM>
From: Patrick Venture <venture@google.com>
Date: Wed, 20 Dec 2017 12:01:17 -0800
Message-ID: <CAO=notz2QLYXRTajkEK4YA6HRQmwqrOJrEgbDEHxjadvogtvDw@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Dec 2017 20:01:44 -0000

On Wed, Dec 20, 2017 at 11:07 AM,  <Michael.E.Brown@dell.com> wrote:
> So what do you mean by "something similar on the inside"? Do you have ref=
erences?

I was just indicating that this use of http to export metrics is
something with which I'm familiar.

>
> And what do you mean by "not well-suited for an embedded platform"? What =
metrics are you using to base this opinion on?
> --

I'm going from design metrics.  Every daemon now will need a thread to
provide the information to anyone who asks.  So that's X daemons
needing new threads to handle the requests.  That's my understanding
of how this works when you add the library to your daemon.


> Michael
>
> -----Original Message-----
> From: Patrick Venture [mailto:venture@google.com]
> Sent: Monday, December 18, 2017 12:17 PM
> To: Brown, Michael E <Michael_E_Brown@Dell.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Brad Bishop <bradleyb@fu=
zziesquirrel.com>
> Subject: Re: Metrics vs Logging, Continued
>
> So, we use something similar on the inside, but it's not well-suited for =
an embedded platform.
>
> On Fri, Dec 15, 2017 at 11:06 AM,  <Michael.E.Brown@dell.com> wrote:
>> Things like Prometheus and graphana already exist and have fairly standa=
rdized metrics gathering interfaces. Why re-invent the wheel here? I would =
advocate for Prometheus for metrics gathering.
>>
>> Quick primer on Prometheus: each process exposes an HTTP endpoint that r=
eports metrics in a standardized JSON format. The process can expose counte=
rs, gauges, histograms or summaries. The server side is responsible for pol=
ling the various clients at whatever interval is desired and can format res=
ults graphically and over a bunch of clients. Each process can instrument i=
tself, there are c++ client libraries to do this already. Then we can aggre=
gate them out with a route from the main HTTP server.
>>
>> All of the things in your metrics list fall neatly into types of data th=
at Prometheus format handles well.
>> --
>> Michael
>>
>> -----Original Message-----
>> From: openbmc
>> [mailto:openbmc-bounces+michael.e.brown=3Ddell.com@lists.ozlabs.org] On
>> Behalf Of Patrick Venture
>> Sent: Tuesday, December 5, 2017 10:51 AM
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Brad Bishop
>> <bradleyb@fuzziesquirrel.com>
>> Subject: Metrics vs Logging, Continued
>>
>> Logging being something separate from metrics -- I've been toying around=
 with different approaches to allowing userspace metrics collection and dis=
tribution.  There are likely better ways, and I think I saw a message on ch=
at about a metrics library that could be used. -- but I've mostly been foll=
owing email.
>>
>> I was thinking this morning of a couple methods, some y'all might like (=
one where the daemon owns it, one where the metric owner owns it):
>>
>> 1) Each daemon can be responsible for exporting onto dbus some objects w=
ith a well-defined path that are of a metric type that has a value and the =
daemon that owns it is therefore responsible for maintaining it.  to collec=
t the metrics, one must grab the subtree for the starting point and trace o=
ut all the different metrics and get the values from their owners. and repo=
rts that up somehow. -- the somehow could be several IPMI packets.  or seve=
ral IPMI packets containing a protobuf (similarly to the flash access appro=
ach proposed by Brendan).
>> The upside to the free-form text and paths is you could parse it out to =
figure out what was each thing.
>>
>> 2) Each daemon that wants to track a metric creates a metric object in a=
nother daemon (via dbus calls) and then periodically updates that value.  t=
hen the information can be reported in the way described above similarly, e=
xcept the owner of the dbus objects would be the one daemon and one bus, et=
c.  This implementation requires a lot more dbus traffic to maintain the va=
lues.  However, in situations where one doesn't want to manage their own db=
us object for this, they can just make one dbus call to update their value =
based on whatever mechanism they use for timing this and they can store the=
 metrics internally in their daemon however they please.  Another upside to=
 this is that it'd be straightforward to add to the current set of daemons =
without needing to restructure anything.  Also, depending on the metric its=
elf, it may not be something updated all that frequently.  For many, I fore=
see updating on non-critical failures, or interesting failures -- for insta=
nce, how often the ipmi daemon's reply is rejected by the btbridge daemon.
>>
>> Approach #2 could be rolled into a couple library calls as well, very ea=
sily such that they don't even know the internals of the tracking...
>> I like and don't like the free-form text naming of the metrics, because =
obviously they can be human-readable.  Another approach might be to assign =
them human readable names and IDs, similarly to sensors so that you can rea=
d back the name for a metric once, and then in the future cache it, making =
subsequent requests smaller.
>>
>> Obvious downside to both implementations (although #2 has an easy mitiga=
tion), if the daemon with the internal state crashes the metrics are lost, =
when it comes back up all the metrics are 0.  If the metrics are owned by a=
nother daemon, then the library calls to set up the metrics tracking could =
check if the metric already exists, and use that value to start with -- the=
n you only have to care about that one daemon crashing.  It could periodica=
lly write the values down and then read them on start-up to persist these v=
alues.  However, you might want the values to not persist... I imagine I wo=
uldn't, however, something like boot count would...
>>
>> There are specific things that the host wants to know, that really fall =
into metrics over logging:
>> 1) BMCs boot count
>> 2) i2c ioctl failure count (which bus/device/reg: count)
>> 3) Specific sensor requests (reading, writing)
>> 4) Fan control failsafe mode count, how often it's falling into
>> failsafe mode
>> 5) How often the ipmi daemon's reply to the btbridge daemon fails.
>>
>> Given some feedback on this, I'll write up a design and the use-cases it=
's trying to address.
>>
>> Thanks,
>> Patrick
