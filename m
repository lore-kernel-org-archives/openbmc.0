Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mK2J1CLfzF15L
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 02:02:13 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2018 09:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,406,1520924400"; d="scan'208";a="56436370"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga001.jf.intel.com with ESMTP; 16 May 2018 09:02:09 -0700
Date: Wed, 16 May 2018 09:02:09 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Yugi Mani <yupalani@microsoft.com>
Cc: Lei YU <mine260309@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180516160209.GB105329@mauery>
References: <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
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
X-List-Received-Date: Wed, 16 May 2018 16:02:16 -0000

On 15-May-2018 06:18 PM, Yugi Mani wrote:
>Good point. We at MSFT are using legacy (non-UBI) layout. We have a manifest for boot verification and we append the hash to image for update verification.
>I can share details about the design/implementation, if you have any specific questions.

At Intel, we are using a legacy layout as well, either ping-ponging 
between partitions or using a active/temp/recovery partition scheme 
depending on the secure boot mechanism for that platform.

--Vernon

>> -----Original Message-----
>> From: openbmc <openbmc-
>> bounces+yupalani=microsoft.com@lists.ozlabs.org> On Behalf Of Lei YU
>> Sent: Monday, May 14, 2018 7:06 PM
>> To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
>> Cc: Stewart Smith <stewart@linux.vnet.ibm.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: BMC Image Signing Proposal
>>
>> I'd like to bring this topic again.
>>
>> As I know image signing feature is completed for both BMC and PNOR:
>> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
>> hub.com%2Fopenbmc%2Fphosphor-bmc-code-
>> mgmt&data=02%7C01%7Cyupalani%40microsoft.com%7C12f250ae199b4
>> 32be89a08d5ba089773%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C
>> 0%7C636619468424007343&sdata=GHBBgm9g9kBpfNAzYxgveFoGWXXl1
>> QOr8fHwZNJNvNA%3D&reserved=0
>> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
>> hub.com%2Fopenbmc%2Fopenpower-pnor-code-
>> mgmt&data=02%7C01%7Cyupalani%40microsoft.com%7C12f250ae199b4
>> 32be89a08d5ba089773%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C
>> 0%7C636619468424007343&sdata=CR2o%2FgVnHPfMr7w8fwOYeRsbOdF
>> B3VMiB%2FFUCnE2aHE%3D&reserved=0
>>
>> However, the above repos are only for systems with UBI-FS feature.
>> Most of machines are still using the "legacy" obmc flash layout, and thus
>> they do not have image singing feature.
>>
>> So I would like to ask for ideas about how to support image signing
>> feature for machines with "legacy" flash layout?
>> 1. Should we use UBI-FS for machines that requires image signing
>> feature?
>> 2. Or should we implement image signing feature on "legacy" flash layout
>> as well?
>>
>> Thanks!
