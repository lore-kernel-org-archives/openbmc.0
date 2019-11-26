Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MrLX4v13zDqLt
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 04:22:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 09:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="240003914"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 09:22:08 -0800
Subject: Re: paths to configuration files in entity manager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>
References: <D070EECD-8118-450C-92E7-579F86DFCDC8@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0c9e9685-5e73-21cd-dfb6-da2746d2e998@linux.intel.com>
Date: Tue, 26 Nov 2019 09:22:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <D070EECD-8118-450C-92E7-579F86DFCDC8@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 26 Nov 2019 17:22:13 -0000

On 11/25/19 4:58 PM, Brad Bishop wrote:
> Hi James
> 
> We have a number of applications we are looking at converting to getting their configuration from EM.  Some of the configuration data is quite large and may not make sense to put on dbus.
> 
> For example…
> 
> On some POWER systems the BMC is responsible for figuring out which board it is running on and selecting one of many host firmware configurations to present to the host firmware.  We are considering using EM to accomplish this.
> 
> This is a large, binary data set and one idea to avoid putting it on dbus was to just put a path to a file in the EM configuration.  Is this a bad idea?

That seems reasonable to me.

-James


> 
> Thanks!
> 
> -brad
> 
