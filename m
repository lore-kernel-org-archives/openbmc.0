Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ngcQ2lNCzDrTs;
 Sat, 19 May 2018 07:03:01 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2018 14:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,415,1520924400"; d="scan'208";a="225437929"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga005.jf.intel.com with ESMTP; 18 May 2018 14:02:54 -0700
Date: Fri, 18 May 2018 14:02:54 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: Lei YU <mine260309@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 Yugi Mani <yupalani@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180518210254.GC105329@mauery>
References: <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 18 May 2018 21:03:04 -0000

On 18-May-2018 11:01 AM, Adriana Kobylak wrote:
>On 2018-05-17 22:33, Lei YU wrote:
>
>>So I think it is better for OpenBMC project to have a common (or 
>>example)
>>image signing tools/code, not for a specific machine or product, but 
>>for the
>>general machines in this project using legacy flash layout.
>>Let's discuss and get a design proposal?
>>
>
>Yeah, ideally we'd converge the legacy and ubi code update methods 
>into one, to take advantage of the Software D-Bus interfaces and have 
>the different features like signature verification, filesystem 
>mirroring, etc be able to be picked up as separate packages. One 
>starting point for the design proposal would be to determine how to 
>separate in the build and the repo the different code update methods. 
>Lei, want to take an initial stab at it? :)

As far as the update methods go, just using a descriptive payload goes a 
long way. Historically, using a manifest type thing that told the update 
mechanism which bytes to write to where was pretty simple and very 
effective. The update mechanism would check the authenticity of the 
payload before trusting the manifest, but then the manifest and payload 
would all get written to the flash. This was for specific flash offsets 
and did not fully comprehend the notion of A/B or other redundant 
scenarios, so all the offsets were relative.

But doing something in the manifest so simple as this would work for a 
variety of scenarios:

MANIFEST:
purpose=xyz.openbmc_project.Software.Version.VersionPurpose.BMC
version=v2.2-32-gc6712d3-dirty
KeyType=OpenBMC
HashType=RSA-SHA256

# Expected is a list of files alongside the manifest
Expected=part1,part2,part3,partN

update_pre=<target to activate prior to fwupdate>

# obmc-flash-bmc-by-name knows where to place this part by name
# (e.g. u-boot always goes at 0x00000000)
part1_update=obmc-flash-bmc-by-name@.service

# obmc-flash-bmc-at-offset places a part at a fixed offset
# optionally relative to an optionally specified MTD partition
# (default relative to /dev/mtd0)
part2_update=obmc-flash-bmc-at-offset@.service 0x130000
# (default relative to /dev/mtd0)
part3_update=obmc-flash-bmc-at-offset@.service 0x130000

# not a ubi person, so I can't comment on all the options :)
part4_update=obmc-flash-bmc-ubi@.service

partN_update=<service for updating partN> 

update_post=<target to activate post fwupdate>


The idea is that we can have a series of service files that can handle 
the majority of operations generically and any special cases can supply 
their own. But since it is just a service, the dependencies are all 
taken care of.


Just some thoughts on how this might be done. This is actually something 
that I am working on right now, trying to get our redundant image 
booting working internally, so I am glad to hear that others are working 
toward similar goals.


--Vernon
