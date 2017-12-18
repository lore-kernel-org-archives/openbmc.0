Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GHY8pdrZ"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0q513bBVzDrSR
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 05:17:25 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id j192so10027057vkc.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0rU48n5K3lGD3DKfjgr6li7GGURzKwADSTTe9DDdi9I=;
 b=GHY8pdrZHVQyeC/jwZbMyFhnvxAVqHUQfk4mE3+63k78fc+OwEttybHzwv9svOVV5A
 wRRF9fDJHdbcVGTJW9YkMSs2rBrC/Sc4hhI9i0l1RmqgepaMvPAXl+1matK6l3lhFznb
 AQ2cWk27OF5EszM4Mbu6L8aiBAFvNhs54lhpri/svibGKTD7sgdps9E+my1tqKQDWLiO
 r12kKTdj4QSKSP8Fr3vhcFufLbtQdDsc1wxAsSjUacT4qsH1rclo/jutsAEXhcclmOGp
 Z/WEfvpJFDnnl9+e3roySd5sjGr2LAf5OU+YkRsrzxPjm40sNSpfVKfSWv0kDlCUk4i3
 bvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0rU48n5K3lGD3DKfjgr6li7GGURzKwADSTTe9DDdi9I=;
 b=sZO23wXlRXhdduscq0zP4JdBXRLvXcsuREwRsWrfWNz06Z7+y/+USKmyUiY9EhO99h
 B+TIfMChNNtuG9+jnXxm+q47P8SoNIQ2yKPCitDdXQc+bTc5z/HvwQ9u1XFjUB+h7eEz
 HfMtvhb9+O8Z3xx+Y/YhTPl1T1qMU0cfEKpHcSwo1WnuX0okU3wwroIcSF4BVVAis6UH
 ze30POS6Vsr1/ts3WyVYQPfq9LcaMf2zcbW9e/Rx3OTxemEmMVBUhpzCBrc+sCCXj1oT
 k2zLmq/ZfF6mwIQ4yxqWnRvSe1TO1jdcI+mKwdZBXzrtUoLnJoWXHReU3ypFGuuprXqz
 FWZg==
X-Gm-Message-State: AKGB3mLB3qf+k2NgXg0WerW//E8aDsNJYI4mIuE1AYFNxmq/ETiADspA
 u0CV/08RYu6+cqHaqZO/E/NZOZa43juFmid4VDtqYA==
X-Google-Smtp-Source: ACJfBovFJPaBG2sFrkIUcSUphvFPHDs39CUbQkICO5qFiyrjo1d7yh5hTCgkqjspCiq4fjgBrGZ1tCF674mENpH0XDk=
X-Received: by 10.31.73.135 with SMTP id w129mr630224vka.129.1513621042200;
 Mon, 18 Dec 2017 10:17:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Mon, 18 Dec 2017 10:17:00 -0800 (PST)
In-Reply-To: <5252c9e0e0ca4af89aed350494f998d1@ausx13mps334.AMER.DELL.COM>
References: <CAO=notxOx8C1VZgMJcW27jdpNZiQ9dLHeKP3dXSUkzxy7hObmw@mail.gmail.com>
 <5252c9e0e0ca4af89aed350494f998d1@ausx13mps334.AMER.DELL.COM>
From: Patrick Venture <venture@google.com>
Date: Mon, 18 Dec 2017 10:17:00 -0800
Message-ID: <CAO=notw3EmcKJ9JXfxBduzsQw0WPwrW1rgVRw_eQZ928a5DkNw@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 18:17:26 -0000

So, we use something similar on the inside, but it's not well-suited
for an embedded platform.

On Fri, Dec 15, 2017 at 11:06 AM,  <Michael.E.Brown@dell.com> wrote:
> Things like Prometheus and graphana already exist and have fairly standar=
dized metrics gathering interfaces. Why re-invent the wheel here? I would a=
dvocate for Prometheus for metrics gathering.
>
> Quick primer on Prometheus: each process exposes an HTTP endpoint that re=
ports metrics in a standardized JSON format. The process can expose counter=
s, gauges, histograms or summaries. The server side is responsible for poll=
ing the various clients at whatever interval is desired and can format resu=
lts graphically and over a bunch of clients. Each process can instrument it=
self, there are c++ client libraries to do this already. Then we can aggreg=
ate them out with a route from the main HTTP server.
>
> All of the things in your metrics list fall neatly into types of data tha=
t Prometheus format handles well.
> --
> Michael
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+michael.e.brown=3Ddell.com@lists.oz=
labs.org] On Behalf Of Patrick Venture
> Sent: Tuesday, December 5, 2017 10:51 AM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Brad Bishop <bradleyb@fu=
zziesquirrel.com>
> Subject: Metrics vs Logging, Continued
>
> Logging being something separate from metrics -- I've been toying around =
with different approaches to allowing userspace metrics collection and dist=
ribution.  There are likely better ways, and I think I saw a message on cha=
t about a metrics library that could be used. -- but I've mostly been follo=
wing email.
>
> I was thinking this morning of a couple methods, some y'all might like (o=
ne where the daemon owns it, one where the metric owner owns it):
>
> 1) Each daemon can be responsible for exporting onto dbus some objects wi=
th a well-defined path that are of a metric type that has a value and the d=
aemon that owns it is therefore responsible for maintaining it.  to collect=
 the metrics, one must grab the subtree for the starting point and trace ou=
t all the different metrics and get the values from their owners. and repor=
ts that up somehow. -- the somehow could be several IPMI packets.  or sever=
al IPMI packets containing a protobuf (similarly to the flash access approa=
ch proposed by Brendan).
> The upside to the free-form text and paths is you could parse it out to f=
igure out what was each thing.
>
> 2) Each daemon that wants to track a metric creates a metric object in an=
other daemon (via dbus calls) and then periodically updates that value.  th=
en the information can be reported in the way described above similarly, ex=
cept the owner of the dbus objects would be the one daemon and one bus, etc=
.  This implementation requires a lot more dbus traffic to maintain the val=
ues.  However, in situations where one doesn't want to manage their own dbu=
s object for this, they can just make one dbus call to update their value b=
ased on whatever mechanism they use for timing this and they can store the =
metrics internally in their daemon however they please.  Another upside to =
this is that it'd be straightforward to add to the current set of daemons w=
ithout needing to restructure anything.  Also, depending on the metric itse=
lf, it may not be something updated all that frequently.  For many, I fores=
ee updating on non-critical failures, or interesting failures -- for instan=
ce, how often the ipmi daemon's reply is rejected by the btbridge daemon.
>
> Approach #2 could be rolled into a couple library calls as well, very eas=
ily such that they don't even know the internals of the tracking...
> I like and don't like the free-form text naming of the metrics, because o=
bviously they can be human-readable.  Another approach might be to assign t=
hem human readable names and IDs, similarly to sensors so that you can read=
 back the name for a metric once, and then in the future cache it, making s=
ubsequent requests smaller.
>
> Obvious downside to both implementations (although #2 has an easy mitigat=
ion), if the daemon with the internal state crashes the metrics are lost, w=
hen it comes back up all the metrics are 0.  If the metrics are owned by an=
other daemon, then the library calls to set up the metrics tracking could c=
heck if the metric already exists, and use that value to start with -- then=
 you only have to care about that one daemon crashing.  It could periodical=
ly write the values down and then read them on start-up to persist these va=
lues.  However, you might want the values to not persist... I imagine I wou=
ldn't, however, something like boot count would...
>
> There are specific things that the host wants to know, that really fall i=
nto metrics over logging:
> 1) BMCs boot count
> 2) i2c ioctl failure count (which bus/device/reg: count)
> 3) Specific sensor requests (reading, writing)
> 4) Fan control failsafe mode count, how often it's falling into failsafe =
mode
> 5) How often the ipmi daemon's reply to the btbridge daemon fails.
>
> Given some feedback on this, I'll write up a design and the use-cases it'=
s trying to address.
>
> Thanks,
> Patrick
