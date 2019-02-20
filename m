Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444Rmv05XRzDqCV
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 06:02:22 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 11:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,392,1544515200"; d="scan'208";a="123948899"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2019 11:02:20 -0800
Subject: Re: Building intel s2600wf image
To: Wim Vervoorn <wvervoorn@eltan.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
 <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
 <945fb918714e446abf45684bd6016e18@Eltsrv03.Eltan.local>
From: James Feist <james.feist@linux.intel.com>
Cc: cheng.c.yang@linux.intel.com
Message-ID: <49051a8d-2eb0-566f-5c2d-2003792fcf83@linux.intel.com>
Date: Wed, 20 Feb 2019 11:02:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <945fb918714e446abf45684bd6016e18@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 20 Feb 2019 19:02:23 -0000

On 2/20/19 5:34 AM, Wim Vervoorn wrote:
> Hello James,
> 
> We got the KCS interface working on the OpenBmc but we are running into an issue we think is a missing part in the OpenBmc implementation at this moment.
> 
> We are using the KCS interface and what we see is that the SMS_ATN is set by OpenBmc. This at itself isn't an issue but it isn't cleared.
> 
> I don't think the issue is in the KCS driver this correctly implements the set and clear SMS_ATN functions.
> 
>  From what I see the current implementation of ipmi-host doesn't issue a clear SMS_ATN call anywhere.
> 
> I guess this code was developed using the BT interface (in this case the host clears the SMS_ATN).
> 
> To solve this the SMS_ATN should be cleared when the message que is empty and when the SetMessageFlags clears all flags.
> 
> Is this code already available and nog yet checked in or should we implement this?

Hi Wim,

I just pushed the patch we are currently using downstream for this issue:

https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-host-ipmid/+/18568/

It probably isn't ready to be merged in it's current state, but 
hopefully you'll find it useful.


Thanks,

James


> 
> Best regards,
> 
> Wim Vervoorn
> 
