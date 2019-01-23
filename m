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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lF822mQ0zDqF0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 06:04:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 11:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,512,1539673200"; d="scan'208";a="140709629"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.119])
 ([10.241.242.119])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2019 11:04:14 -0800
Subject: Re: openbmc Digest, Vol 41, Issue 94
To: openbmc@lists.ozlabs.org
References: <mailman.483.1548190974.21532.openbmc@lists.ozlabs.org>
 <2ef5c2d2.6eac.1687a1241cb.Coremail.fyczy@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <afb14414-7bca-fb93-ed5e-677a99381b56@linux.intel.com>
Date: Wed, 23 Jan 2019 11:04:10 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2ef5c2d2.6eac.1687a1241cb.Coremail.fyczy@126.com>
Content-Type: text/plain; charset=gbk; format=flowed
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
X-List-Received-Date: Wed, 23 Jan 2019 19:04:19 -0000



On 1/23/2019 1:37 AM, George Liu wrote:
> Hi:
> 1. How to read it out after using phosphor:: logging:: log < level >() 
> to write to the log? Is it using ipmitool, journalctl or DBUS? What is 
> the interface? Could anyone elaborate on it?

phosphor::logging::log<level>() adds a message to the journal, so it can 
be read out on the command line using journalctl or from source using 
the sd_journal APIs: 
https://www.freedesktop.org/software/systemd/man/sd_journal.html#.

> Thanks
