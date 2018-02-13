Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="ECaiKWk2"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgRsC5dQWzF0ts
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 13:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518490266; x=1550026266;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SCBmofhLvJuWItZPssy+g+aU4LgWGZaXdz/7UravvuY=;
 b=ECaiKWk2wz5iOp6ZRhgxdJ5nAseLn1hjF2sfu9fMsTTqkqDRZEuNqMHM
 1ikH9A5YUppWr/3Nw/P6GBXwVVPYkhSZ6pN5ilPM6sZofI9UZLczp1ste
 nE6EgulHp5dAftfK1t2x/R6DDi21nKVdOVxOht8tkCtcpXiGU+jBQMmaK g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F3AAAyUoJah8mZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYMhBIEDEHAojgmOJoICgReOSYd4FYFAQwoYC4UYAoJNVBgBAgE?=
 =?us-ascii?q?BAQEBAQIBAhABAQEKCwkIKC+COCQBCgRLKi8BAQEBAQEBAQEBAQEBAQEaAg1dA?=
 =?us-ascii?q?QEBBAE5PwwECxEEAQEBCRMLBw8FFB4JDhOKNRCweIh9ghEBAQEBAQEBAQIBAQE?=
 =?us-ascii?q?BAQEBARsFhHyCFYZtgy8CAoFYAYNegjQFk2OQSwkKiBaHQ4YUgiyKQ4dijgKKF?=
 =?us-ascii?q?oE8H4IKTSODGIJlgRYBCIESWQEBjDoBAQE?=
X-IPAS-Result: =?us-ascii?q?A2F3AAAyUoJah8mZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYM?=
 =?us-ascii?q?hBIEDEHAojgmOJoICgReOSYd4FYFAQwoYC4UYAoJNVBgBAgEBAQEBAQIBAhABA?=
 =?us-ascii?q?QEKCwkIKC+COCQBCgRLKi8BAQEBAQEBAQEBAQEBAQEaAg1dAQEBBAE5PwwECxE?=
 =?us-ascii?q?EAQEBCRMLBw8FFB4JDhOKNRCweIh9ghEBAQEBAQEBAQIBAQEBAQEBARsFhHyCF?=
 =?us-ascii?q?YZtgy8CAoFYAYNegjQFk2OQSwkKiBaHQ4YUgiyKQ4dijgKKFoE8H4IKTSODGIJ?=
 =?us-ascii?q?lgRYBCIESWQEBjDoBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2018 20:51:00 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2018 08:50:57 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,505,1511848800"; d="scan'208";a="213566273"
X-DLP: DLP_GlobalPCIDSS
Date: Mon, 12 Feb 2018 20:52:04 -0600
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: Chris Ong <Chris.Ong@microsoft.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 Yugi Mani <yupalani@microsoft.com>, Ali Larijani <alirhas@microsoft.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>,
 "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>,
 "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>
Subject: Re: Redfish on OpenBMC
Message-ID: <20180213025202.GA9498@wn7x64-4cggry1.aus.amer.dell.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
 <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
 <BL0PR2101MB0897B2A1BB35747988A92BCDEAFC0@BL0PR2101MB0897.namprd21.prod.outlook.com>
 <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Tue, 13 Feb 2018 02:52:16 -0000


On Thu, Feb 08, 2018 at 02:17:02PM +0000, Rapkiewicz, Pawel wrote:
> Hi Chris, Yugi,
> 
> Thanks for your benchmarking you've attached, I'd like to better understand the data. I'm curious about 10 concurrent requests for redfish root service. The average is ~5 seconds for uwsgi, and mostly no response for gevent.
> Few questions:
> - gevent and uwsgi, those are two independent redfish server implementations?
> - do you have any traffic during retrieving root service?
> - Was it with Basic HTTP Auth, or without any?
> 
> I'm also little confused on how do we measure and present code size and performance, since it's not normalized anyhow, it's biased by the measurement method. If the intent of gathering those data is to
> compare different Redfish approaches, we shall consider setting the measure criteria. Some suggestions:
> 
> Code size:
> - real code size, not on compressed file system
> - is it binary or script?
> - what's the size of dependent libraries (already existing in OpenBMC environment vs. the new one required only by given Redfish implementation)?
> 
> Performance:
> - We need common script for measurement
> - And common method, I'd prefer running on machine directly connected to the OpenBMC platform to minimize network latency, or to run it over loopback interface on the platform, but this may affect context switching
> - The performance will still be biased by the CPU the Redfish is running, but it will be closer to make it comparable.
> 
> Regards,
> Pawel
> 
> 
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+pawel.rapkiewicz=intel.com@lists.ozlabs.org] On Behalf Of Chris Ong
> Sent: Wednesday, February 7, 2018 5:15 PM
> To: Tanous, Ed <ed.tanous@intel.com>; Yugi Mani <yupalani@microsoft.com>; Ali Larijani <alirhas@microsoft.com>; Paul.Vancil@dell.com; hramasub@in.ibm.com; Michael.E.Brown@dell.com
> Cc: rolfb@us.ibm.com; jwcarman@us.ibm.com; openbmc@lists.ozlabs.org; pradeep.kumar36@tcs.com; bradleyb@fuzziesquirrel.com; Balaji.B.Rao@dell.com
> Subject: RE: Redfish on OpenBMC
> 
> Hi Ed,
> 
> On our AST2520 platform:
> Reading sensors using Redfish takes about 12-13 seconds for about 200 sensors. If 10 threads are requesting the read at the same time, the average time to return is about 70 seconds.
> 
> For reading logs, it takes about 100 seconds for 4000 log entries. The time scales linearly with the number of logs, e.g. for 2000 logs, it would take around 50s.
> 
> Chris


I'm basically ready to post some numbers for my redfish stack. I was busy beavering away trying to make sure I had at least enough stuff implemented to give a good idea of both the performance as well as implementation difficulty.

Here are my stats:

Language: golang
Source: https://github.com/superchalupa/go-redfish
Runtime RSS: 11MB RAM at rest, 16MB under load.
Binary size: lz compressed: <3MB, uncompressed 11MB

I have a few different benchmark numbers. First, the script I'm using is https://github.com/superchalupa/go-redfish/blob/master/scripts/walk.sh, the time reported is just the time from 'curl' reporting the total request time. Also, my results are running on the Nuvoton Poleg, I would expect times to be slower running on AST. I've put build instructions in the readme.

First of all, the HTTP (no compression) results in an average response time of 0.003 seconds.

For HTTPS, I have two results. First, the native golang SSL stack, which is poorly optimized for 32-bit ARM, results in average requests of about 0.250 per request. Next, I used the golang "spacemonkeygo" openssl wrapper to serve using the more-optimized openssl libraries. This results in 0.150s per request.

And, finally, interesting to note is if you pipeline your requests. For curl, this would be simply putting multiple requests on one command line. For these, the results are that the first request hits at the time for HTTPS (either 0.250 or 0.150 depending on which implementation you use), and the subsequent requests all come in around 0.003s. This means an entire redfish walk can be done in less than a second for my test implementation.

Notes on implementation:

I've implemented thermal using the openbmc dbus xyz.openbmc-project.Sensor.Value interface and using mapper to dynamically construct the thermal sensors available. It appears that it ought to be quick and easy to do the same for fans. I've also implemented a few other dbus calls, such as the Manager.Reset action.

Mostly the implementation caches values. Because of information from Ed that subscribing to events might not result in nice systemwide properties, right now I refresh sensor values on a configurable timer (10s right now).

The more things I've implemented with this implementation, the more I'm liking how nicely things are shaking out, and I'm finally to the point where I can focus on trying to get some other people up to speed on the codebase rather than trying ot get all the basics running.

Thoughts?

I'll post the actual test results shortly, I lost the machine I was using for benchmarking due to a network issue and cannot access it until tomorrow.
--
Michael
