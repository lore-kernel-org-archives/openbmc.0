Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4312bl1cT7zDqFD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 01:57:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2018 06:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,266,1539673200"; d="scan'208";a="98266780"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.85.122])
 ([10.252.85.122])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2018 06:57:13 -0800
Subject: Re: Can't find the pam_ipmicheck.so pam_ipmisave.so in
 /etc/pam.d/common-passwd
To: openbmc@lists.ozlabs.org
References: <tencent_230D17CB1EF513F3732136F8@qq.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <a9c3637f-a200-b5ea-9342-e116e4a0eaf5@linux.intel.com>
Date: Thu, 22 Nov 2018 20:27:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <tencent_230D17CB1EF513F3732136F8@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 22 Nov 2018 14:57:24 -0000

this should be fixed with the latest code.

https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/16001/ merged 2 
days ago.

Regards,

Richard

On 11/22/2018 8:26 AM, xiuzhi wrote:
> Hi all,
> The  /etc/pam.d/common-passwd use the following configure:
>  password        [success=ok default=die] pam_ipmicheck.so spec_grp_name=i
> #password       [success=ok default=die] pam_cracklib.so debug enforce_fo
> #password       [success=ok ignore=ignore default=die] 
> pam_pwhistory.so debug e
> password       [success=ok default=die]        pam_unix.so sha512 
> use_authtok
> #password       [success=ok default=die]  pam_ipmisave.so spec_grp_name=ip
>
>   I can't find the file pam_ipmicheck.so and pam_ipmisave.so , which 
> package  produce these library files?
> Best,
> xiuzhi
