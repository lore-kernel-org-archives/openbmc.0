Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpz2530tKzDq93
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 07:39:57 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NKcnJP049216
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 16:39:54 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29bt5dtmsu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 16:39:54 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 16:39:54 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 16:39:51 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NKdpVc43778120; Thu, 23 Mar 2017 20:39:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19F4A124037;
 Thu, 23 Mar 2017 16:39:47 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.195])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 602A612403D;
 Thu, 23 Mar 2017 16:39:43 -0400 (EDT)
Subject: Re: Upstream work for OpenFSI patches
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <05efd2cd-b928-96eb-433e-49ff451eaaf3@ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 23 Mar 2017 15:39:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <05efd2cd-b928-96eb-433e-49ff451eaaf3@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032320-0052-0000-0000-000001B63F26
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006836; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837941; UDB=6.00411996; IPR=6.00615704; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 20:39:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032320-0053-0000-0000-00004F622E52
Message-Id: <00baa1b7-d784-b73a-d396-e132bea3057b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230175
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
X-List-Received-Date: Thu, 23 Mar 2017 20:39:57 -0000



On 3/23/17 7:14 AM, Jeremy Kerr wrote:
> Hi Chris & all,
>
> Over the last week or so, I've (re-)started our upstreaming efforts for
> the fsi patches, by addressing the reviews we've had so far, and
> settling some of the open items we've had that effect the future
> userspace ABI of the FSI code.
>
> I think the patches at a point where we're ready to resubmit upstream,
> so I've pushed a branch here:
>
>    https://github.com/jk-ozlabs/linux/commits/openbmc/fsi
>
> - this is currently based on the OpenBMC 4.10 tree, but will be easily
> applicable to vanilla upstream. I've kept the "DEBUG" patches at the top
> of the tree, but these are not intended to be upstreamed (unless someone
> convinces us otherwise!). This tree may be rebased as development
> continues, and I'll likely start a branch which is based on mainline.
>
> There are some fairly significant changes from our first submission,
> notably:
>
>   - endianness: the _read() and _write() APIs are now all *bus endian*,
>     so will be the same on all platforms (the previous fsi patches
>     exposed as (BMC/FSP) CPU endian, which is variable).
>
>     This includes the sysfs raw file, so the byte ordering matches what's
>     transferred on the bus, regardless of CPU endianness:
>
>        # hexdump -n 4 -C fsi0/slave@00:00/raw
>        00000000  c0 01 0d 12                        |....|
>        00000004
>
>     This will likely mean that drivers and accesses to 'raw' from
>     userspace may need to convert to bus endian.
>
>   - device tree: I've removed the "ibm," prefix for the fsi core and GPIO
>     master compatibility strings, as they're not describing IBM-specific
>     hardware. I've also fixed some errors with our proposed binding
>     specification.
>
>   - device model: we now create separate struct devices for each FSI
>     master, which fits better with the Linux device model, and allows us
>     to add sysfs attributes that are implemented by the fsi core
>
>   - sysfs: there are now sysfs facilities for break and term, and the raw
>     file supports reads and writes of arbitrary sizes.
>
>   - GPIO master: I've split the xfer() logic out a little, so that the
>     response handling & DPOLL retry mechanism is more obvious
>
>   - GPIO master: simplifications for message construction
>
>   - GPIO master: fixes for some CRC calculations
>
>   - GPIO master: we now issue TERM in response to DPOLL busy-loops
>
>   - Error handling: rather than handle errors on (potentially) an entire
>     cascaded read or write, the error handling is now down on a per-slave
>     basis, where we try to reestablish communication in a more "gradual"
>     manner, rather than sending a break immediately.
>
>     (we may need to add a hook to percolate error recovery up to a
>     slave's master, but I haven't seen any need for that at present)

Hi Jeremy,

Have you run much testing on bad bus accesses to verify recovery from 
errors?
>   - Hub master: this is now implemented as a fsi engine driver, as the
>     fsi_slave_{read,write}() functions are exported (and the port count
>     is available in the hMFSI configuration register)
I noticed you moved the FSI master control register definitions into 
fsi-master-hub.c   Though its not presently used, the cmFSI engine also 
shares a common control register setup for the most part and its 
possible there could be other implementations using the same scheme in 
the future.   Would it be preferable to move these into fsi-master.h or 
some other common master code?
>     This means we need fewer special-cases in the fsi core.
>
>   - Tracepoints: I've added tracepoints for FSI core read & write, and
>     another set for low-level GPIO in/out operations.
>
> I've kept the original authorship attribution on each patch, but do let
> me know if anything seems amiss.
>
> I've tested on one-core (heavily) and two-core (lightly) p9 platforms,
> and all seems to look okay so far.
>
> There are a couple of pending items, but those shouldn't need to hold us
> up:
>
>   - IRQ support needs more work, but there doesn't seem to be any
>     consumers of that so far
As long as we migrate to the final IIC driver solution before switching 
over to your new code then there is no interrupt support required.  
Otherwise we'll need to consider when your changes are phased in.
>   - tests for unbind/rebind
>   - updating MAINTAINERS
>
> So, please take a look at the series and let me know if there is
> anything that still needs doing (particularly fixes that have come in
> since the first series), and we can work out our plan for upstream
> progression.
The community had wanted crc calculations moved from drivers/fsi to the 
kernel/lib path on a previous patch set submission I sent out. Do you 
think this is something that will be required in your changes?

The community also didn't want the fake FSI master driver included.   Is 
this something we should keep?

All else looks good.
Thanks,

Chris
>
> Cheers,
>
>
> Jeremy
>
