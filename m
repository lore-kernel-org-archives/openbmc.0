Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FWsp2KmnzDqBM;
 Fri,  8 Mar 2019 00:38:06 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 7 Mar 2019 08:38:37 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: zshelle <zshelle@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+zshelle=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: New repo for System Fatal Error Diagnostics for POWER Systems
Message-ID: <20190307133837.clzkumw4cnvnnom4@thinkpad.dyn.fuzziesquirrel.com>
References: <8f90bbe93f545017f281fa433b5f3660@linux.vnet.ibm.com>
 <ce514d61cb270ac17d3e01dd13a6d713@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ce514d61cb270ac17d3e01dd13a6d713@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 13:38:06 -0000

On Tue, Mar 05, 2019 at 12:27:10PM -0600, zshelle wrote:
>On 2019-02-28 10:38, zshelle wrote:
>>The design proposal is here:
>>https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/
>>
>>In the design proposal, I indicated we need a repo for the analyzer
>>side and the isolator side of the diagnostics. The analyzer side will
>>all be OpenBMC specific code. That is the easy one. The isolator side
>>will be common code used throughout several projects within OpenPOWER
>>in addition to its application in OpenBMC. It's been pointed out to me
>>that there will be some convenient advantages to putting this isolator
>>repo in the OpenBMC project. However, it will be used heavily in
>>several OpenPOWER projects. I should point out that while the isolator
>>is currently geared towards POWER, it has the potential to be used on
>>other architectures in the future. I would appreciate any input on
>>this topic.
>
>Is there enough information in the proposal to at least get the repos 
>created? Sorry to push, but I want to get these repos created before I 
>am out on paternity leave starting this Friday.
>
>For the analyzer, I was thinking of openpower-hw-diags or something 
>along those lines.
>
>I could use some suggestions for the isolator. It sounds like it could 
>be used by more than POWER.

Hi Zane

openpower-hw-diags and openpower-libhei (as discussed in IRC) created.
thx.

-brad
