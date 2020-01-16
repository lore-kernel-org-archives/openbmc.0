Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zDtY0fVKzDqjd
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 06:35:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 11:35:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="274123108"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2020 11:35:10 -0800
Subject: Re: Change 27956 dbus-sensors PSUSensor appears to break Entity ID
To: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, mutyalax.jayaprakash@intel.com
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>
References: <CANPkJS9ggqARodBg+dhUEBBXKXANFJ=bJEDEyTmPQbVF=oLOkA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <afa376c6-9886-3f19-399e-81cc3f492f1e@linux.intel.com>
Date: Thu, 16 Jan 2020 11:35:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CANPkJS9ggqARodBg+dhUEBBXKXANFJ=bJEDEyTmPQbVF=oLOkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 16 Jan 2020 19:35:18 -0000

On 1/15/20 6:00 PM, Josh Lehan wrote:
> Hello there.
> 
> A recent change to dbus-sensors, 27956 on Gerrit, appears to have 
> introduced a difference which breaks the Entity ID field.
> 
> Alex Qiu has written what the symptom is, and I traced through the code. 
> Both findings are written as comments, to that change on Gerrit.
> 
> I'm open to suggestions on how to resolve this. There are probably many 
> people using the PSUSensor program in different ways.
> 
> I am curious as to the behavior Intel was seeing in their project. There 
> must be a difference in the way we are using the PSUSensor program, in 
> which the way we're using it sees this as a breakage, but Intel sees 
> this as a fix. Any details that can be provided?

Hi Josh,

Thanks for the investigation. Would you mind creating an issue?

I think this has to do with Redfish and the power schema. Upon looking
closer, I think this patch should be reverted, and the fix be applied to 
Redfish to distinguish between power sensors and other types of sensors.

I'd be fine if you created a revert as well if there is an issue to 
point to with your research.

Thanks

-James



> 
> Thanks!
> Josh
> 
> Josh Lehan | Software Engineer |krellan@google.com 
> <mailto:krellan@google.com> | +1 650-733-8941
> 
