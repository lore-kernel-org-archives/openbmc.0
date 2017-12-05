Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::229; helo=mail-ua0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DsjSpyI8"; 
 dkim-atps=neutral
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrnnD5j92zDrqP
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 03:50:55 +1100 (AEDT)
Received: by mail-ua0-x229.google.com with SMTP id j14so689578uag.11
 for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2017 08:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=X4ifi0NIhaPF4FLqGhABFNtuFZNLlb06noVEwnP2P8c=;
 b=DsjSpyI84uP+WdLMOzPtd/ezZjjkKYzCflLm833Ol8KD5cIpG/947JvMJA9S1VVQY4
 wxcQJqc8jSgCridzvjwRYrJWmgQMheHA2wWbtRrQJ++mAPXgOYt+SSRasb8pDB+NzqVz
 /vsKeLX04xaCLOKdCoqWPkMq0KL9FAQx27KqZ83CsDchUeX/tbFIlS4iBZ4Zd044B1F8
 3wkFMAC6ytY1wEpmUk7mMKVmmx0PwtDSvj98S5x6I0GuNEdfJB/RuCoPRuLbnDkc7EY8
 ZenpMdc8GMSyjXtIKmn5WFmUIriM+jr9GzXs2EGPz5YvmXfQMWZ0LTj62h/CH6YBw2pe
 j/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=X4ifi0NIhaPF4FLqGhABFNtuFZNLlb06noVEwnP2P8c=;
 b=KMHoR5sIho9plg8zDm3rCodRHtSIvovS+t9MheozjYoTs4pb/b0m3qx1zUQznxffXl
 N61OJN+Lz4PcTW41gadyA2/1/Ji2nVECn5p+ZRfBML5YicjgNgtq5AWoSi/7ktz71U1u
 823Jpk8jhEkXdFHg8bTYXKpXZcKwNpbjgGUsGV2bhbOiUhJL2534Z7KeonvwTIj5V8lP
 ccF7qI8idbK7zyu8nMovYGIUaYV0aWYEoXD8pMxg28QpclGkWlDBc90D/hnrIts50HPM
 r7esQbKO/Ia5uP/X53BcEEGIqEa33lJFzjv7uag9oNBkdyM3zXzREAvTg8sv3PgYBuH1
 kHQQ==
X-Gm-Message-State: AKGB3mJ3PZfggIrnCNUzMAViROX2xqNy6XazBPY1I0Xhj4yQb5Exn5cV
 dfeebqEcUDudJN0yai5XQ6ADay726fyns/zfVdDd0qhdM1Q=
X-Google-Smtp-Source: AGs4zMZgDLDmTC/K84AZwyGbjmtaJ0yKgbSZsU7+2Lb5gE68/pKPZslHPl7AOtPec/7JjxYmqKabsc3ZBkKRv1LwAdU=
X-Received: by 10.176.19.44 with SMTP id g41mr5026660uae.105.1512492652317;
 Tue, 05 Dec 2017 08:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Tue, 5 Dec 2017 08:50:31 -0800 (PST)
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Dec 2017 08:50:31 -0800
Message-ID: <CAO=notxOx8C1VZgMJcW27jdpNZiQ9dLHeKP3dXSUkzxy7hObmw@mail.gmail.com>
Subject: Metrics vs Logging, Continued
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Dec 2017 16:50:57 -0000

Logging being something separate from metrics -- I've been toying
around with different approaches to allowing userspace metrics
collection and distribution.  There are likely better ways, and I
think I saw a message on chat about a metrics library that could be
used. -- but I've mostly been following email.

I was thinking this morning of a couple methods, some y'all might like
(one where the daemon owns it, one where the metric owner owns it):

1) Each daemon can be responsible for exporting onto dbus some objects
with a well-defined path that are of a metric type that has a value
and the daemon that owns it is therefore responsible for maintaining
it.  to collect the metrics, one must grab the subtree for the
starting point and trace out all the different metrics and get the
values from their owners. and reports that up somehow. -- the somehow
could be several IPMI packets.  or several IPMI packets containing a
protobuf (similarly to the flash access approach proposed by Brendan).
The upside to the free-form text and paths is you could parse it out
to figure out what was each thing.

2) Each daemon that wants to track a metric creates a metric object in
another daemon (via dbus calls) and then periodically updates that
value.  then the information can be reported in the way described
above similarly, except the owner of the dbus objects would be the one
daemon and one bus, etc.  This implementation requires a lot more dbus
traffic to maintain the values.  However, in situations where one
doesn't want to manage their own dbus object for this, they can just
make one dbus call to update their value based on whatever mechanism
they use for timing this and they can store the metrics internally in
their daemon however they please.  Another upside to this is that it'd
be straightforward to add to the current set of daemons without
needing to restructure anything.  Also, depending on the metric
itself, it may not be something updated all that frequently.  For
many, I foresee updating on non-critical failures, or interesting
failures -- for instance, how often the ipmi daemon's reply is
rejected by the btbridge daemon.

Approach #2 could be rolled into a couple library calls as well, very
easily such that they don't even know the internals of the tracking...
I like and don't like the free-form text naming of the metrics,
because obviously they can be human-readable.  Another approach might
be to assign them human readable names and IDs, similarly to sensors
so that you can read back the name for a metric once, and then in the
future cache it, making subsequent requests smaller.

Obvious downside to both implementations (although #2 has an easy
mitigation), if the daemon with the internal state crashes the metrics
are lost, when it comes back up all the metrics are 0.  If the metrics
are owned by another daemon, then the library calls to set up the
metrics tracking could check if the metric already exists, and use
that value to start with -- then you only have to care about that one
daemon crashing.  It could periodically write the values down and then
read them on start-up to persist these values.  However, you might
want the values to not persist... I imagine I wouldn't, however,
something like boot count would...

There are specific things that the host wants to know, that really
fall into metrics over logging:
1) BMCs boot count
2) i2c ioctl failure count (which bus/device/reg: count)
3) Specific sensor requests (reading, writing)
4) Fan control failsafe mode count, how often it's falling into failsafe mode
5) How often the ipmi daemon's reply to the btbridge daemon fails.

Given some feedback on this, I'll write up a design and the use-cases
it's trying to address.

Thanks,
Patrick
