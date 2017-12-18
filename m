Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0mSw01c8zDrW5
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 03:19:27 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2017 08:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,422,1508828400"; d="scan'208";a="13320921"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga003.jf.intel.com with ESMTP; 18 Dec 2017 08:19:24 -0800
Date: Mon, 18 Dec 2017 08:19:24 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20171218161924.GN113334@mauery>
References: <581CCA61.4010202@linux.vnet.ibm.com>
 <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
 <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
 <20171214162608.GK113334@mauery>
 <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
 <e5ae4cd0-f76d-cb53-d96b-bd55cd3e99e9@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e5ae4cd0-f76d-cb53-d96b-bd55cd3e99e9@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Dec 2017 16:19:28 -0000

On 15-Dec-2017 10:38 AM, Tom Joseph wrote:
>
>
>On Friday 15 December 2017 03:25 AM, Jeremy Kerr wrote:
>>Hi Vernon,
>>
>>>I would agree. ipmitool is broken. It should have a
>>>network-start-configure mechanism that would set the set-complete bit.
>>>The you could send any number of its network configuration parameters.
>>>Then it should have a network-finish-configure command that would clear
>>>the set-complete bit.
>>Or, even simpler: allow multiple parameter changes on one invocation:
>>
>>  ipmitool [...] lan set 1 ipsrc static ipaddr 192.168.0.2 netmask 255.255.255.0
>>
>>[which changes all parameters under one transition of the set-complete
>>flag]
>>
>>Then, there's no need to modify existing users' behaviour, and no
>>concern about forgetting to apply.
>
>Jeremy,
>
>I was carried away by the ipmitool implementation when i was trying to 
>understand how this works.
>
>But this looks like a neat way to get the network settings applied.

I agree. This makes it more like ip or ifconfig where you can set it all 
up with one command. So who is drafting the patch? :)

--Vernon
