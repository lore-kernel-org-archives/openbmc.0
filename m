Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwjZf4M2PzF07w
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 03:55:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2018 08:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,432,1515484800"; d="scan'208";a="180384547"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by orsmga004.jf.intel.com with ESMTP; 06 Mar 2018 08:55:35 -0800
Subject: Re: Meeting Minutes 2018-03-05: OpenBMC Redfish working group working
 call
To: Michael.E.Brown@dell.com, openbmc@lists.ozlabs.org, Paul.Vancil@dell.com, 
 hramasub@in.ibm.com, Balaji.B.Rao@dell.com, bradleyb@fuzziesquirrel.com,
 jwcarman@us.ibm.com, pradeep.kumar36@tcs.com, rolfb@us.ibm.com,
 Chris.Ong@microsoft.com, alirhas@microsoft.com, yupalani@microsoft.com
Cc: Krishna.Kolakaluri@deltaww.com
References: <066c20c5825e4a75b4255500da392d14@ausx13mps338.AMER.DELL.COM>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <a6c93af9-9202-ada7-5d6a-2eb8f64a946e@intel.com>
Date: Tue, 6 Mar 2018 08:56:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <066c20c5825e4a75b4255500da392d14@ausx13mps338.AMER.DELL.COM>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 06 Mar 2018 16:55:40 -0000

On 03/06/2018 08:50 AM, Michael.E.Brown@dell.com wrote:
> 
>   * AMI has a LUA (luajit) implementation for redfish
>   * AMI would like to present their solution
>   *
> 
Chandrasekhar,

Is your implementation available with an open license somewhere I can 
pull it down?

-Ed
