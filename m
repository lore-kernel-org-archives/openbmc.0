Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 612 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Dec 2017 03:36:24 AEDT
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyK2J1SxxzDqgR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 03:36:23 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Dec 2017 08:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; d="scan'208";a="16016934"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga001.jf.intel.com with ESMTP; 14 Dec 2017 08:26:08 -0800
Date: Thu, 14 Dec 2017 08:26:08 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20171214162608.GK113334@mauery>
References: <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com>
 <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com>
 <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
 <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
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
X-List-Received-Date: Thu, 14 Dec 2017 16:36:25 -0000

On 14-Dec-2017 10:45 PM, Jeremy Kerr wrote:
>Hi Tom,
>
>>> Adding the 10-second delay allows users to "batch" multiple changes,
>>> meaning that network connectivity isn't lost between those changes. This
>>> is purely to allow ipmitool (which doesn't have a facility to make
>>> multiple changes before indicating that the change is complete) to be
>>> used over the network to change the lan configuration (which is a bit
>>> risky regardless...).
>>
>> Yeah all this lack of clarity, arises from a lack of mechanism in IPMI to
>> apply multiple changes (IP address, netmask gateway) together.
>
>No, the specification provides a way to do exactly that:
>
> 1) Change set-complete to 0x01
>
> 2) Send Set LAN Configuration command to update the actual LAN
>    configuration parameters. If more than one parameter is changed, then
>    multiple commands can be sent.
>
> 3) Change set-complete to 0x00
>
>It's just that ipmitool only has code to change one parameter at a time
>at (2). It still does the set-complete process.

I would agree. ipmitool is broken. It should have a 
network-start-configure mechanism that would set the set-complete bit. 
The you could send any number of its network configuration parameters. 
Then it should have a network-finish-configure command that would clear 
the set-complete bit.

In the case where people forget to send the final command, the BMC 
should implement a timeout so it can automatically apply the settings 
and clear the flag after a certain amount of time (10 seconds or more).

It appears that ipmitool had a short period of activity there at the 
beginning of 2017, but not a peep since. I pushed a fix for a bug 
several weeks back and have not heard anything.

--Vernon

>>> To implement something complying to a "principle of least surprise", I'd
>>> suggest that we should:
>>>
>>>   - batch changes, and have them applied after 10 seconds from clearing
>>>     the set-in-progress flag
>>>
>>>   - submit patches to ipmitool to allow multiple changes to be applied
>>>     at once (ie, one clearing of the set-in-progress flag).
>>
>> I prefer the second option of allowing ipmitool to explicitly clear the
>> set-in-progress flag.
>
>They're not "or" options. We'd need to do both.
>
>> The first option is really  "unusual way" to get this done, to overcome
>> a specification shortcoming.
>
>It's not a specification shortcoming; the specification explicitly
>supports this, it's just that ipmitool doesn't.
>
>The 10-second delay is a server-side workaround for that, and is present
>on other BMC implementations out there. We should implement that
>workaround, because asking everyone to update to a new ipmitool version
>isn't feasible either.
>
>Regards,
>
>
>Jeremy
