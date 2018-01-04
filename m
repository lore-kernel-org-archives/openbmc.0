Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="iYtCTgbj"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCBnh73cxzDqJM
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 02:40:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515079903; x=1546615903;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zraSJi9cpYsk+rqTZ8ghJQNlWnjxSSDt8kHOrskcJDU=;
 b=iYtCTgbjVefIu8U6fVsnDzCUxBouyQtcMqRTYutVvaXIoKjTFLjS5RNu
 FhtW8YbWha0MNFWVtfBvUh8tBaugImDPXqVJ3073ibc6SvY3BHwLqxTcZ
 epofPDmNB4E1N5jxncdoXF68Jr5XnJeWXRs4hHu+f6h6GQ1DyKQveSQV1 g=;
IronPort-PHdr: =?us-ascii?q?9a23=3Agl5dBxOi5BuhZ89UU4Ql6mtUPXoX/o7sNwtQ0KIM?=
 =?us-ascii?q?zox0I/36rarrMEGX3/hxlliBBdydt6odzbKO+4nbGkU4qa6bt34DdJEeHzQksu?=
 =?us-ascii?q?4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1?=
 =?us-ascii?q?Ov71GonPhMiryuy+4ZLebxlViDanfb9+MAi9oBnMuMURnYZsMLs6xAHTontPde?=
 =?us-ascii?q?RWxGdoKkyWkh3h+Mq+/4Nt/jpJtf45+MFOTav1f6IjTbxFFzsmKHw65NfqtRbY?=
 =?us-ascii?q?UwSC4GYXX3gMnRpJBwjF6wz6Xov0vyDnuOdxxDWWMMvrRr0yRD+s7bpkSAXwhS?=
 =?us-ascii?q?kHOTA37nzZhM9+jK1UvB2uuhNxzIzab4yOKPpzfbnQcc8GSWdbXMtcUTFKDIOm?=
 =?us-ascii?q?b4sICuoMJeFWr4jhqFsOtxSxGw2sD/7gxDRVm3L2x6o60uonEQrb2wEuGNMOv2?=
 =?us-ascii?q?jUrNrvKqgSVfq5wqbSwTjedfNW3jn86I7Tfx88v/6MWbZwfdDNxkkoEgPIl1Od?=
 =?us-ascii?q?opHrMTOS0+QCqWmb7+x4WOKok24otQdxoza1xscwkIXJgZgVyl/c+SV2wYY1Od?=
 =?us-ascii?q?24SFNgbtK+DJRQsCSaO5NuQsM4RGFovTg1yqEGuZGlYSgK044rxx/Ya/GBboOG?=
 =?us-ascii?q?4QrjWf6QLDp7nn5pZryyiwio/US9yuDxWNO43EhWoiZbitXAq38A2hLJ5sSaS/?=
 =?us-ascii?q?Zw/12t1SuA2g3Q8O1IP1w4mKvdJpU82LA/jIATvl7GHiLunUX2i7KZeVs89+iz?=
 =?us-ascii?q?7uTnfq3mppiBN49okg3+Mrohmsi4AekgLAcORHKU9fqm2LL+40L5RLFKguQxkq?=
 =?us-ascii?q?nErJDVPsMbprO/AwBIzIov8Re/Dy+m0NQdkngLNk5KeBWCj4TxOlHOJu73Deun?=
 =?us-ascii?q?jlmtkzpn3e7KM7P/DpnXM3TOkLnscaxj50JA1gY/1dVf6IhVCrEFLvLzQEjxtN?=
 =?us-ascii?q?nAAxE+Mgy73+bnB89j2YMaQ26BDbWVPb7IsV+P6OMvJfKBa5ILtzb5L/gp/eLh?=
 =?us-ascii?q?jXg8mVMFZ6mmwYMXaGykHvRhO0iZZmLsjckHEWgRuwoxUPfniFmDUT5Ie3ayRL?=
 =?us-ascii?q?gw5jY6CYKiF4jMXZutjKaG3CehEZ0FLlxBX3uMC3bza4KcW/oWIAmVPM5nnSAD?=
 =?us-ascii?q?U/D1QIg//R+k8gT9zuw0APDT/3g9tJnj3dVxr8Cbvws16jo8W+Gc2GGEQmUysy?=
 =?us-ascii?q?UiXTgp2ohzrEh5jFyE1P4r0LRjCdVP6qYRAU8BPpnGwrkiBg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G0AABJSk5ah8qZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQUEHQnhBGZLIIBj0GJO0MKJYRHTwKEMUMUAQEBAQEBAQEBAQI?=
 =?us-ascii?q?QAQEBCgsJCCgvgjgiDQRLKgMBAQEBAQEBAQEjAQEBAQEBAQEBAQEBAQEBGgINX?=
 =?us-ascii?q?QEBAQMBDhUPATIUBQsLDgoCAgUTDgICDwVJLooLCBCxdoInijsBAQEBAQUBAQE?=
 =?us-ascii?q?BAR4FgQ+DBIIShm2CYk0BAYFGEQmCZz0xgjQFiGOKVJAfCoZ+fo0olBKNMYlfg?=
 =?us-ascii?q?Tw2gXJMI1KCGgEQgmOCElqGSAIlgiMBAQE?=
X-IPAS-Result: =?us-ascii?q?A2G0AABJSk5ah8qZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?UEHQnhBGZLIIBj0GJO0MKJYRHTwKEMUMUAQEBAQEBAQEBAQIQAQEBCgsJCCgvg?=
 =?us-ascii?q?jgiDQRLKgMBAQEBAQEBAQEjAQEBAQEBAQEBAQEBAQEBGgINXQEBAQMBDhUPATI?=
 =?us-ascii?q?UBQsLDgoCAgUTDgICDwVJLooLCBCxdoInijsBAQEBAQUBAQEBAR4FgQ+DBIISh?=
 =?us-ascii?q?m2CYk0BAYFGEQmCZz0xgjQFiGOKVJAfCoZ+fo0olBKNMYlfgTw2gXJMI1KCGgE?=
 =?us-ascii?q?QgmOCElqGSAIlgiMBAQE?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2018 09:31:34 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2018 21:35:01 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.45,507,1508821200"; d="scan'208";a="1078683644"
X-DLP: DLP_GlobalPCIDSS
Date: Thu, 4 Jan 2018 09:39:55 -0600
To: Christopher Covington <cov@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "venture@google.com" <venture@google.com>
Subject: Re: Metrics vs Logging, Continued
Message-ID: <20180104153954.GA22361@wn7x64-4cggry1.aus.amer.dell.com>
References: <CY1PR15MB0077EC76B1E96D62AF70ECCACB1E0@CY1PR15MB0077.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY1PR15MB0077EC76B1E96D62AF70ECCACB1E0@CY1PR15MB0077.namprd15.prod.outlook.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Thu, 04 Jan 2018 15:40:10 -0000

On Wed, Jan 03, 2018 at 02:22:39AM +0000, Christopher Covington wrote:
> Hi Michael, Patrick,
> 
> I probably should have hopped on this list months ago. Thanks for your patience as I come up to
> speed on your code, configure my mail client to suit this list, and so on.
> 
> > Prometheus metrics is fundamentally a pull model, not a push model. If you have a pull model,
> > it greatly simplifies the dependencies:
> 
> >	- Pull metrics internally or externally (daemons listen on 127.0.0.1, optionally reverse proxy
> >	  that through your web service).
> 
> An option for on-demand metrics (as opposed to periodic, always-on monitoring) is nice. I would
> use it to more highly scrutinize upgrades in progress for example.

This is a nice point. You can easily turn on/off pull of metrics from your
systems by simply turning the server on/off.  But is harder for push metrics,
as you have to *configure* each endpoint for where to push to (if that changes
from time to time, which may or may not be the case), and you have to turn push
on/off.

> 
> >	- Optionally run the metrics server or not depending on configuration.
> 
> I agree it should fail gracefully when there is no server present, and think this generalizes to
> other network services, even NTP and DHCP.
> 
> >	- Pull model naturally self-limits in performance-limited cases... you don’t have a thundering
> >	  herd of daemons trying to push metrics. In case metrics server gets loaded it will naturally
> >	  slow down polls to backend daemons.
> 
> At large scale you'll either need multiple pollers or load-balancing for the receiving server. I'm
> not sure what the best solution is. Is load-balancing perhaps more commonplace?

Load balancing is "more commonplace" for things like generic web servers.
Setting up load balancing is distinctly non-trivial, as specifics of how you
are using are very important.

Overall this is a matter that reasonable people can disagree on. I favor the
pull approach. It degrades much more predictably (server pulls more slowly but
still hits all the systems). You can easily scale up. Load balancing for this
type of thing seems way more difficult to set up and get working well. (How you
persistently balance clients between servers, for instance.) However, I think
that a push model is also pretty easy to argue successfully for (though I
personally wont).

Also, I think the conversation here started more as a discussion on the best
way to collect metrics for individual daemons, rather than specifically for how
to get metrics for openbmc overall. I think that something like a protocol spec
for how individual metrics collection would be done would be pretty useful,
then it could be implemented differently across different daemons, but have the
same protocol. And then we can talk about how to extend that off the box.

Another part of the conversation we probably need to talk about is "api
stability" and are we going to have a requirement for specific metrics to be
stable over time? Or can we deal with ad-hoc metrics that may be added to over
time or may drop.

> 
> > But what I think would be pretty nice is if you could point graphana/Prometheus towards every
> > BMC on your network to get nice graphs of temp, fan speeds, etc.
> 
> For metrics/counters, I've been centrally pulling/polling from a fleet running the following RESTful
> API:
> 
> https://github.com/facebook/openbmc/tree/helium/common/recipes-rest/rest-api/files
> 
> But polling the whole fleet doesn't seem ideal, so I'm wondering about a push model.
> 
> Prometheus looks interesting, thanks for the pointer. It does seem to support a push model
> https://prometheus.io/docs/instrumenting/pushing/

Prometheus is just a specification for an http endpoint, so it would (in
theory) be relatively easy to write a pull-to-push gateway using any language.
The push model mentioned here is just a local agent that periodically polls the
local pull endpoint and pushes it somewhere.

> 
> Do Go language applications run reasonably well on ASpeed 2400 SoCs?

I've done several prototypes of golang servers on the Nuvoton ARM chip
(slightly faster than aspeed) and the results for me were more-than-acceptable.
I was very pleased with the ease of development, memory usage, and most other
metrics. It has the development speed of python combined with the runtime speed
of Java (and sometimes approaching C).

> I've heard that OpenWRT uses collectd: https://wiki.openwrt.org/doc/howto/statistic.collectd

Quick look at this project, it does two things: a) it has a plugin format for
how to collect various stats, and some pre-written plugins for "popular"
things, and b) it formats output in rrd format for consumption by other tools.
This is conceptually very similar to prometheus (same concepts: gauges,
histograms, counts, etc). However, it does appear that collectd specifies a
file format for output, but not an access format. The prometheus part that I'm
focusing on is in how we can standardize access and file formats.

--
Michael Brown
