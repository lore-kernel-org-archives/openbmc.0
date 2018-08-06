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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41knQn0yldzF3HL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 05:14:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 12:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="62740349"
Received: from skyhawk.jf.intel.com (HELO [10.7.150.62]) ([10.7.150.62])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2018 12:10:56 -0700
From: James Feist <james.feist@linux.intel.com>
Subject: Proposal to change sensor interface to use double values
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
Date: Mon, 6 Aug 2018 12:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 06 Aug 2018 19:14:57 -0000

I've submitted a change to modify the sensor interface to remove scale, 
and make the sensor value a double. The main reason for doing this is 
simplification of the interface. In most usages, daemons pull the value, 
and the scale, then immediately translate this value to a double. This 
could easily be done once by the sensor producer instead of all daemons. 
The counter example that was given was phosphor-fan-presence, but doing 
a quick grep I can't find scale being used, so this might mean for a 
scaled fan you have to factor that in to all configuration files, or 
scaled fans aren't supported. The threshold interface is not usable 
independent from the value interface, as the thresholds are affected by 
the same scale. Using a fixed scale also won't work well for a 
logarithmic sensor, while floating point would. Realistic precision 
should not be affected for any common sensor. We also in the future may 
be interested in a daemon producing a threshold for a sensor that 
another daemon owns. With the scale existing elsewhere, this would not 
be trivial to map.

Review for context: https://gerrit.openbmc-project.xyz/#/c/11739/

This change is not ready to be submitted as is, but we would like to 
hear if there are any major objections. If not, we would like to start 
an upgrade path to support both interfaces until it is possible to make 
the switch. Bmcweb already supports both. In most cases this is just 
pulling the value using a visitor, and setting the scale to 0 if it does 
not exist. Max and Min can also be used for IPMI scaling.

Thanks,

- James Feist
