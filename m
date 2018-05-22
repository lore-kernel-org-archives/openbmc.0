Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40r02q6y4zzDqL5;
 Wed, 23 May 2018 01:30:27 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2018 08:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,430,1520924400"; d="scan'208";a="43019416"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga007.jf.intel.com with ESMTP; 22 May 2018 08:30:24 -0700
Date: Tue, 22 May 2018 08:30:24 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Lei YU <mine260309@gmail.com>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 Yugi Mani <yupalani@microsoft.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180522153024.GD105329@mauery>
References: <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
 <20180518210254.GC105329@mauery>
 <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 May 2018 15:30:29 -0000

On 22-May-2018 02:46 PM, Lei YU wrote:
>On Sat, May 19, 2018 at 5:02 AM, Vernon Mauery
><vernon.mauery@linux.intel.com> wrote:
>> On 18-May-2018 11:01 AM, Adriana Kobylak wrote:
>>>
>>> On 2018-05-17 22:33, Lei YU wrote:
>>>
>>>> So I think it is better for OpenBMC project to have a common (or example)
>>>> image signing tools/code, not for a specific machine or product, but for
>>>> the
>>>> general machines in this project using legacy flash layout.
>>>> Let's discuss and get a design proposal?
>>>>
>>>
>>> Yeah, ideally we'd converge the legacy and ubi code update methods into
>>> one, to take advantage of the Software D-Bus interfaces and have the
>>> different features like signature verification, filesystem mirroring, etc be
>>> able to be picked up as separate packages. One starting point for the design
>>> proposal would be to determine how to separate in the build and the repo the
>>> different code update methods. Lei, want to take an initial stab at it? :)
>>
>>
>> As far as the update methods go, just using a descriptive payload goes a
>> long way. Historically, using a manifest type thing that told the update
>> mechanism which bytes to write to where was pretty simple and very
>> effective. The update mechanism would check the authenticity of the payload
>> before trusting the manifest, but then the manifest and payload would all
>> get written to the flash. This was for specific flash offsets and did not
>> fully comprehend the notion of A/B or other redundant scenarios, so all the
>> offsets were relative.
>>
>> But doing something in the manifest so simple as this would work for a
>> variety of scenarios:
>>
>> MANIFEST:
>> purpose=xyz.openbmc_project.Software.Version.VersionPurpose.BMC
>> version=v2.2-32-gc6712d3-dirty
>> KeyType=OpenBMC
>> HashType=RSA-SHA256
>>
>> # Expected is a list of files alongside the manifest
>> Expected=part1,part2,part3,partN
>>
>> update_pre=<target to activate prior to fwupdate>
>>
>> # obmc-flash-bmc-by-name knows where to place this part by name
>> # (e.g. u-boot always goes at 0x00000000)
>> part1_update=obmc-flash-bmc-by-name@.service
>>
>> # obmc-flash-bmc-at-offset places a part at a fixed offset
>> # optionally relative to an optionally specified MTD partition
>> # (default relative to /dev/mtd0)
>> part2_update=obmc-flash-bmc-at-offset@.service 0x130000
>> # (default relative to /dev/mtd0)
>> part3_update=obmc-flash-bmc-at-offset@.service 0x130000
>>
>> # not a ubi person, so I can't comment on all the options :)
>> part4_update=obmc-flash-bmc-ubi@.service
>>
>> partN_update=<service for updating partN>
>> update_post=<target to activate post fwupdate>
>
>This is interesting, and it looks like a general method for code updating to
>support both non-ubi and ubi layout. (Though it would require code changes in
>phosphor-software-manager).

That was the idea :)

I think that if we really want to converge on some common code here, 
having the phosphor-software-manager handle several different flash 
formats is important. This is the sort of thing that could easily be 
selectable at build time, one method should have little impact on the 
other.

>I have several questions though.
>
>Background:
>* For non-ubi, there are two ways to do code update:
>   1. Copy image-bmc (or image-rofs, etc) to /run/initramfs, and reboot.
>      A updater script in initramfs will run to program the image to flash.
>      During the code update, BMC is NOT operational;
>   2. Invoking "prepareForUpdate" method to ask BMC reboot into a ramfs, then
>      invoking the updater script to program the image to flash.
>      During the code update, BMC is working.
>   3. There is not WebUI support (yet)
>* For ubi:
>   1. The update happens when BMC is working (due to the fact it assumes the
>      flash contains enough space for two images).
>   2. The WebUI will upload the image and "activate" it when BMC is running.
>
>So here is my question: to support non-ubifs code update in a general way,
>should it do "prepareForUpdate", making BMC to reboot into ramfs, or should it
>do the update during reboot?
>
>* If we prefer the "prepareForUpdate" way, then the WebUI should add this
>   function to make BMC enter "update" mode;

Intel has a requirement to do firmware updates while the BMC is active, 
so we will need to enable this feature in the WebUI. This is not a hard 
problem, given that a redfish mechanism is already in the works.

--Vernon

>* If we prefer to update during reboot, then the BMC will not be working for a
>   few minutes during the code update, WebUI will not be working as well.
>
>>
>>
>> The idea is that we can have a series of service files that can handle the
>> majority of operations generically and any special cases can supply their
>> own. But since it is just a service, the dependencies are all taken care of.
>>
>>
>> Just some thoughts on how this might be done. This is actually something
>> that I am working on right now, trying to get our redundant image booting
>> working internally, so I am glad to hear that others are working toward
>> similar goals.
>>
>>
>> --Vernon
