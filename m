Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L7YJ1r9dzF3Ll
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 05:39:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2018 12:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,307,1534834800"; d="scan'208";a="95059254"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.94.56])
 ([10.252.94.56])
 by orsmga002.jf.intel.com with ESMTP; 26 Sep 2018 12:39:10 -0700
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Ratan K Gupta <ratagupt@in.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>,
 richard.marian.thomaiyar@linux.intel.com
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Reg moving pam modules to obmc-phosphor-image instead of installing
 it in obmc-phosphor-initramfs
Message-ID: <7d6e8df9-f739-9754-5f99-2860489e3c58@linux.intel.com>
Date: Thu, 27 Sep 2018 01:09:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 26 Sep 2018 19:39:16 -0000

Hi Ratan / Brad / any yocto expert?

Currently pam modules are installed in both obmc-phosphor-initramfs and 
obmc-phosphor-image. When more pam modules are enabled it is causing 
size issue with obmc-phosphor-initramfs. Eventhough this pam modules 
doesn't need to be present in obmc-phosphor-initramfs, i.e. can be 
installed only in obmc-phosphor-image.

I tried few things with the recipe but pam being dependency, somehow it 
is getting installed for obmc-phosphor-initramfs. Does anyone know how 
to restrict the pam plugin modules to be installed only in 
obmc-phosphor-image and not in obmc-phosphor-initramfs

anybody who is expert is yocto, please help, as i am blocked in getting 
the initramfs size reduced.

Regards,

Richard
