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
 by lists.ozlabs.org (Postfix) with ESMTPS id 421Zrn0TqtzF37J
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 07:10:15 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2018 14:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,308,1531810800"; d="scan'208";a="81671938"
Received: from mauery.jf.intel.com ([10.54.51.74])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2018 14:10:13 -0700
Date: Thu, 30 Aug 2018 14:09:58 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Factory Reset for Configuration Settings
Message-ID: <20180830210958.GA44886@mauery.jf.intel.com>
References: <6cd1be38c05156b9b6d116fa643224db@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6cd1be38c05156b9b6d116fa643224db@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 21:10:18 -0000

On 30-Aug-2018 01:33 PM, Adriana Kobylak wrote:
>This note is to propose a new Factory Reset implementation to clear 
>out configuration settings and restore them to default. The following 
>applies for both static and ubi filesystem layouts.
>
>The current Software implementation of the Factory Reset clears the 
>whole read-write filesystem[1].
>The reset can be problematic for example if it's issued when the host 
>is on, since the inventory gets deleted and the fan controller has no 
>knowledge if the system has working fans, leading to shutting off the 
>host.
>This can be unexpected if the user just wants to reset the 
>configuration data, like user passwords or LDAP settings.

This seems like a very system-specific sort of thing. I can imagine some 
systems not having any trouble with this, while others might need 
interaction from the host to behave correctly.

>The /etc dir is intended to contain the configuration files[2], so we 
>can implement the configuration reset by clearing out the data in /etc 
>and putting back the defaults. The /etc dir is an overlay, so this can 
>be accomplished by clearing the overlay's upper dir.
>
>Proposal:
>* Move any configuration file that is currently created in /var to 
>/etc, like the Time Owner and Reboot Policy (most are currently under 
>the Settings interface).
>* Have the init script which mounts the overlay, clear the etc upper 
>dir before mounting if a u-boot environment variable is set.
>* Implement a new Reset method under the path 
>/xyz/openbmc_project/settings/ or configuration/ or 
>settings/configuration/ or other.

Our BMCs support multiple levels of 'factory reset' with each level 
removing more and more user data. In addition to my point above, it 
might be a data-driven reset. /usr/share/system-reset/level-1 contains 
information to perform a level-1 reset, .../level-2 contains a level-2 
reset, etc. Where each system may have a different number of levels of 
resets and each system may have a different list of resets that is could 
do. Clearly the nuclear option is to just reformat the NV partition and 
start from ground zero, but what level that is may depend on the system.

The reset manager or settings manager (wherever this lives) can 
determine the number of levels of reset from the config files and then 
on the next reboot, the init script can consume the config files to 
perform the correct operation.

These files can then be stored in platform layers and installed on the 
appropriate targets.

--Vernon
