Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q47v68CNzF0Vv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 04:31:55 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2018 11:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,234,1531810800"; d="scan'208";a="64603417"
Received: from skyhawk.jf.intel.com (HELO [10.7.150.62]) ([10.7.150.62])
 by orsmga007.jf.intel.com with ESMTP; 13 Aug 2018 11:31:48 -0700
Subject: Re: Read-Only IPMI sensors
To: Adriana Kobylak <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <6c913a75b11ae03ef9298085ead69afe@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0cf6b440-e3d0-c1f1-48e9-f0cd6d4eff4f@linux.intel.com>
Date: Mon, 13 Aug 2018 11:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6c913a75b11ae03ef9298085ead69afe@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 13 Aug 2018 18:31:56 -0000

On 08/13/2018 11:33 AM, Adriana Kobylak wrote:
> There are a couple IPMI sensors that are not yet included in the 
> data-driven design of IPMI because they're intended to be read-only 
> (example: https://github.com/openbmc/openbmc/issues/2154).
> 
> Some options to implement these:
> 
> 1. Add support in sdbusplus for read-only properties and map these 
> sensors to a read-only d-bus property.
> 

sdbusplus-asio already has support for read-only properties that you 
might be interested in using / duplicating: 
https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/object_server.hpp#L123 



> 2. Have a (json?) file with the sensor settings and have IPMI and any 
> other interested apps read the file directly to retrieve the sensor values.
> 
> 3. Add read-only sensors to a d-bus object and override the "setter" 
> function to be a no-op to prevent the value from being modified.
> 
> 4. Combination of above / other options.
> 
> Thoughts?
> 
