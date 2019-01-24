Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lNfv0TQ3zDqDN
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 11:43:02 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 16:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,513,1539673200"; d="scan'208";a="140789115"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.119])
 ([10.241.242.119])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2019 16:42:59 -0800
Subject: Re: Intel-ipmi-oem repo
To: openbmc@lists.ozlabs.org
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
 <0B0A393C-5A14-42A0-86A1-9606CD7F942C@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <2faa6f6b-3fe5-8385-f699-dffba2a5faf2@linux.intel.com>
Date: Wed, 23 Jan 2019 16:42:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0B0A393C-5A14-42A0-86A1-9606CD7F942C@fb.com>
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
X-List-Received-Date: Thu, 24 Jan 2019 00:43:04 -0000



On 1/22/2019 2:22 PM, Vijay Khemka wrote:
> If we can manage this in standard repo with some compile time config 
> parameter to use chosen approach. It will help in maintaining multiple repo.

I have uploaded a new patch set to 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951 
that keeps the current behavior as a default and adds a compile option 
to switch to the journal-based SEL.  Perhaps it is a better option than 
the intel-ipmi-oem repo while we work out the sensor numbering?

Please check it out and provide thoughts and feedback.

Thanks,
-Jason
