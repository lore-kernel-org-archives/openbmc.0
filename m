Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Ihxd/Vo6"; 
 dkim-atps=neutral
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhV6f1mR8zF1H3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 06:37:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518637050; x=1550173050;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+rJq3VFY80WlLn0RobP8NS329KCLnvUHJh+HNFNi7hw=;
 b=Ihxd/Vo6nFywVvcOmewoL+/R4s/ie0f617fbKKbxHw10+euV5qJrzNGb
 x2lfEUrx3k8ehMowfWsxLE2qDZojCAl0JZxTDxIsN2s6JD8KG7mgYMmbD
 3gD/cU1jSN2P7/WsYmWwdzAAjgjVj/PU1wGxrJdxdUtZr3nCecBmmPj0s 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HkAQANj4Rah2Ka6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGEKBBwKINlmCiCAoEXjkqFIAOCVYFVQwolgQmDKWQCgn1VFwE?=
 =?us-ascii?q?CAQEBAQEBAgECEAEBAQoLCQgoL4I4JAEKBEsqAwEBAQEBAQEBAQEBAR8BAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBGgINIiECGQEFIw8BGS0QCQIOBAYCAgUPBA4CAg8FNRQTijA?=
 =?us-ascii?q?FEJF0nXSCJ4QShG6CEwEBAQEBAQEDAQEBAQEBASGBD4NzghWDP4Mugy8CgUoBE?=
 =?us-ascii?q?DcmB4JJMYI0BZJOgRaQSwkKhxKBBI1YgixniVyHY4sUgm6GGAEBg32BPCEBggd?=
 =?us-ascii?q?NI4MYCYJHBQQMDIIlWQEFiy8BJAKCJgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HkAQANj4Rah2Ka6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?EKBBwKINlmCiCAoEXjkqFIAOCVYFVQwolgQmDKWQCgn1VFwECAQEBAQEBAgECE?=
 =?us-ascii?q?AEBAQoLCQgoL4I4JAEKBEsqAwEBAQEBAQEBAQEBAR8BAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BGgINIiECGQEFIw8BGS0QCQIOBAYCAgUPBA4CAg8FNRQTijAFEJF0nXSCJ4QSh?=
 =?us-ascii?q?G6CEwEBAQEBAQEDAQEBAQEBASGBD4NzghWDP4Mugy8CgUoBEDcmB4JJMYI0BZJ?=
 =?us-ascii?q?OgRaQSwkKhxKBBI1YgixniVyHY4sUgm6GGAEBg32BPCEBggdNI4MYCYJHBQQMD?=
 =?us-ascii?q?IIlWQEFiy8BJAKCJgEBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 13:37:26 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Feb 2018 01:37:25 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,513,1511848800"; d="scan'208";a="617736105"
X-DLP: DLP_GlobalPCIDSS
Date: Wed, 14 Feb 2018 13:37:23 -0600
To: Yugi Mani <yupalani@microsoft.com>
Cc: Ali Larijani <alirhas@microsoft.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>,
 "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>,
 "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>,
 "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong <Chris.Ong@microsoft.com>
Subject: Re: Redfish on OpenBMC
Message-ID: <20180214193720.GA10667@wn7x64-4cggry1.aus.amer.dell.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
 <MWHPR21MB0864F176FAC58CACB07E5342D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR21MB0864F176FAC58CACB07E5342D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
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
X-List-Received-Date: Wed, 14 Feb 2018 19:37:31 -0000

Stats for go-redfish running on Nuvoton Poleg. First, processor stats. Since we agreed on AST2500 as the baseline, I don't have one of those to do benchmarks. If somebody could run the benchmarks on an AST2500 that would be very helpful.

$ cat /proc/cpuinfo 
processor       : 0
model name      : ARMv7 Processor rev 1 (v7l)
BogoMIPS        : 1594.16
Features        : half thumb fastmult edsp tls 
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x4
CPU part        : 0xc09
CPU revision    : 1

processor       : 1
model name      : ARMv7 Processor rev 1 (v7l)
BogoMIPS        : 1594.16
Features        : half thumb fastmult edsp tls 
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x4
CPU part        : 0xc09
CPU revision    : 1

Hardware        : NPCMX50 Chip family
Revision        : 0000
Serial          : 0000000000000000

Go-redfish was checked out per the readme on https://github.com/superchalupa/go-redfish and built like this:

$ BUILD_TAGS="spacemonkey" ./scripts/build-arm-obmc.sh

Using the 'openssl' based HTTPS support because it's faster on 32-bit ARM. For x86 and 64-bit ARM, go native SSL is almost equal in performance. Read the readme for details.

I use a benchmark tool called 'hey': https://github.com/rakyll/hey, it is a load generator. You can install it like this: "go get github.com/rakyll/hey". It will put 'hey' in $GOPATH/bin/. The go-redfish server supports the redfish standard X-Auth-Token as well as Basic auth. The benchmarks below are using basic auth in the interest of brevity, but it's also simple to benchmark tokens. The numbers don't appear much different.

Here is a run against the most complicated output currently implemented. This run is for 10 seconds, with the default concurrency of 50 parallel requests. The result is that the average request is 0.1588s and the server handles an average of 312 requests per second.

$ hey -z 10s  https://Administrator:password@10.35.174.126:8443/redfish/v1/Chassis/A33/Thermal                            
Summary:
  Total:        10.1230 secs
  Slowest:      1.9524 secs
  Fastest:      0.0051 secs
  Average:      0.1588 secs
  Requests/sec: 312.8521

Response time histogram:
  0.005 [1]     |
  0.200 [3062]  |∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎
  0.395 [31]    |
  0.589 [5]     |
  0.784 [9]     |
  0.979 [10]    |
  1.173 [9]     |
  1.368 [8]     |
  1.563 [5]     |
  1.758 [2]     |
  1.952 [25]    |

Latency distribution:
  10% in 0.0840 secs
  25% in 0.1159 secs
  50% in 0.1374 secs
  75% in 0.1576 secs
  90% in 0.1748 secs
  95% in 0.1874 secs
  99% in 1.3962 secs

Details (average, fastest, slowest):
  DNS+dialup:    0.0036 secs, 0.0000 secs, 1.2168 secs
  DNS-lookup:    0.0000 secs, 0.0000 secs, 0.0000 secs
  req write:     0.0000 secs, 0.0000 secs, 0.0007 secs
  resp wait:     0.1411 secs, 0.0049 secs, 1.1510 secs
  resp read:     0.0001 secs, 0.0000 secs, 0.0002 secs

Status code distribution:
  [200] 3167 responses


The memory usage of the program under load (Resident size, IOW, RAM usage during load is roughly 16MB):

# cat /proc/$(pidof ocp-server.arm)/status
Name:   ocp-server.arm
Umask:  0022
State:  S (sleeping)
Tgid:   2737
Ngid:   0
Pid:    2737
PPid:   2710
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 256
Groups: 0 
VmPeak:  1167212 kB
VmSize:  1167212 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:     16924 kB
VmRSS:     16844 kB
RssAnon:            9200 kB
RssFile:            1788 kB
RssShmem:           5856 kB
VmData:   395108 kB
VmStk:       136 kB
VmExe:      6304 kB
VmLib:      2792 kB
VmPTE:       130 kB
VmPMD:         0 kB
VmSwap:        0 kB
Threads:        45
SigQ:   0/3577
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: fffffffe7bfa7a25
SigIgn: 0000000000000000
SigCgt: ffffffffffc1feff
CapInh: 0000000000000000
CapPrm: 0000003fffffffff
CapEff: 0000003fffffffff
CapBnd: 0000003fffffffff
CapAmb: 0000000000000000
NoNewPrivs:     0
Cpus_allowed:   3
Cpus_allowed_list:      0-1
voluntary_ctxt_switches:        92
nonvoluntary_ctxt_switches:     21

The binary size is 10MB uncompressed and 2MB compressed (xz level 9)

$ cat ocp-server.arm  | xz -9 -c > ocp-server.arm.xz
$ ls -l ocp-server.arm*
-rwxrwxr-x 1 michael_e_brown michael_e_brown 11169052 Feb 14 13:14 ocp-server.arm
-rw-rw-r-- 1 michael_e_brown michael_e_brown  2712208 Feb 14 13:26 ocp-server.arm.xz

The source is currently sitting at under 5k LoC implementing a few proof of concept openbmc implementations calling DBUS, as well as a simulation.

Concurrency:
- Highly concurrent. On ARM serves >300 requests per second. On X86, goes up to about 3k requests per second
- For individual requests: can concurrently get data from multiple data sources and runs all the plugins for a redfish resource in parallel

Deterministic:
- The design should be fairly deterministic.

Cached:
- Completely flexible here. The default model is caching the data, but it's also supported to make dbus calls per request (though that's not really recommended). Currently it caches sensor results and refreshes those at a fixed interval, though that could easily be changed.

Platform dependent/independent:
- Core is completely platform independent.
- Working on an OCP profile implementation that also has platform independent + platform specific hooks. Currently in place are simulation implementation plus openbmc dbus implementation for sensors (temperature now, working fans next).

DMTF support:
- In progress. Help needed.

--
Michael

On Wed, Feb 07, 2018 at 03:48:41AM +0000, Yugi Mani wrote:
> Here are some more requirements based on our experience with Redfish:
> 1. Concurrency
> Web Server and Framework should be able to serve multiple GET requests at a time. 
> POST/PATCH/PUT/DELETE requests can be sequential. 
> 
> 2. Deterministic
> Service should be time deterministic, both boot time and run time. 
> Concurrency shall not impact deterministic property of the service. 
> All requests shall be responded (success/failure) within acceptable time limits. 
> Where some requests cannot be completed within time limits, 
> service shall respond with status and expected time to complete. 
> 
> 3. Cached Data
> Data shall be cached by Redfish service and updated on dbus signals. 
> Collecting required information on demand adversely impacts performance. 
> Redfish should rather cache the information and keep updating its cache 
> on notification from dbus that the property(ies) of interest has been modified. 
> 
> 4. Platform dependent/independent layer
> Shall provide a clear isolation between core vs platform properties. 
> Can consider object oriented approach for platform & oem layer 
> to override core methods and objects. Customized hooks and handlers 
> can be provided by platform layer while the data model 
> between layers is maintained consistent across platforms. 
> 
> 5. DMTF Support
> Redfish have quite a lot of gaps in some of the basic requirements of a BMC. 
> a) FRU & FRU Collection Schema
> b) Sensor & Sensor Collection Schema
> c) Component Firmware Update (PSU, BIOS, CPLD, etc)
> d) Master Write-Read
> e) Clear PSU Faults
> We need DMTF to actively add/update Redfish schemas that are fundamental to any BMC.
> 
> 7. Error Codes
> Redfish LogEntry schema doesn’t offer a placeholder for error codes 
> that automation tools can read to categorize the events and trigger actuators. 
> One option is to repurpose OEM field. 
> 
> 8. Pagination
> Event logs can get too big and paginated view is helpful
> 
> 9. Filtering
> Query parameter to filter the response limited to certain criteria
> 
> 10. Anchors
> Schemas like Chassis and Manager have a bunch of properties 
> that not all requests might be interested in. 
> It is better to be able to request just a fragment of a resource using ‘#’. 
> 
> 11. Rate Limiting
> Server shall return HTTP 429 when number of requests cross max limit permissible from a client. 
> We need some protection against Denial of Service.
> 
> -Yugi
