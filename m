Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409bWj3kcszF2Ck
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 03:07:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Mar 2018 09:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,367,1517904000"; d="scan'208";a="31795409"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.255.24.186])
 ([10.255.24.186])
 by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2018 09:07:41 -0700
Subject: Re: KCS bridged
To: openbmc@lists.ozlabs.org, venture@google.com, bradleyb@fuzziesquirrel.com
References: <mailman.737.1522165077.18085.openbmc@lists.ozlabs.org>
Cc: rlippert@google.com, yuenn@google.com, kunyi@google.com,
 emilyshaffer@google.com, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <9df626a8-ef1e-27b4-60cb-c7c2822d4bef@linux.intel.com>
Date: Wed, 28 Mar 2018 00:07:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <mailman.737.1522165077.18085.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Tue, 27 Mar 2018 16:07:46 -0000

Hi Patrick,

Yes, the code is done and tested on AST2500 (by Intel BMC team)& NPCM750 
(by Avi from Nuvoton).

1. The ASPEED and the main KCS BMC stack has been in next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/char/ipmi/kcs_bmc.c?h=next-20180327
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/char/ipmi/kcs_bmc_aspeed.c?h=next-20180327

2. The Nuvoton driver is on the fly:
https://lkml.org/lkml/2018/3/22/284 
<https://urldefense.proofpoint.com/v2/url?u=https-3A__lkml.org_lkml_2018_3_22_284&d=DwMGaQ&c=ue8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=kNeU5gwNy2cOhaTMIUoFhUPAXV51uTneHprahPM6I78&m=ID5-OH3zog6mXc13UaU1fkd107kOhusv44gfLsAYlzQ&s=3RwHjL1giz6-_bT-WPsD7nejvbVqOhCPjS2XB4Tchgs&e=>

After upstream finished, maybe it is the right time to push the 
kcsbridged into OpenBMC github,
and of course, the kcsbridged needs to be enhanced for real use in OpenBMC.

BR,
Haiyue

On 2018-03-27 23:37, openbmc-request@lists.ozlabs.org wrote:
> Date: Tue, 27 Mar 2018 07:41:04 -0700
> From: Patrick Venture<venture@google.com>
> To: OpenBMC Maillist<openbmc@lists.ozlabs.org>, Brad Bishop
> 	<bradleyb@fuzziesquirrel.com>
> Cc: Robert Lippert<rlippert@google.com>, Nancy Yuen
> 	<yuenn@google.com>, Kun Yi<kunyi@google.com>, Emily Shaffer
> 	<emilyshaffer@google.com>
> Subject: KCS bridged
> Message-ID:
> 	<CAO=notyi526qbqE2bBzC6d3LWAN9=NhdCm-wmxxyh1-FNVTMGg@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> I have seen several patches from at least two groups related to IPMI
> KCS drivers for the BMC.  However, I wasn't aware of the existence of
> a bridge daemon, equivalent to btbridged -- to plumb the messages from
> the kernel driver to phosphor-host-ipmid.  Is there one in design,
> develop, test, or done?
>
> Patrick
