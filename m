Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZssG3lN2zDqDp
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 06:07:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 12:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,309,1549958400"; d="scan'208";a="131521548"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 04 Apr 2019 12:07:43 -0700
Subject: Re: persistent storage
To: Vijay Khemka <vijaykhemka@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <7D170914-3A20-47F5-A66D-774B51CFF076@fb.com>
 <a0f97d7f-5b12-ae60-efde-1294dfaeef30@linux.intel.com>
 <CY4PR15MB12697696CB8B09CD7AB468BBDD500@CY4PR15MB1269.namprd15.prod.outlook.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <4cb8b8d7-eec9-1190-c01d-f5d50268ba5c@linux.intel.com>
Date: Thu, 4 Apr 2019 12:07:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CY4PR15MB12697696CB8B09CD7AB468BBDD500@CY4PR15MB1269.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Thu, 04 Apr 2019 19:07:47 -0000

On 4/4/19 12:03 PM, Vijay Khemka wrote:
>   James,
> Are you using it? or can you please point me to its usage.

Yes. Here is the config: 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/settings/phosphor-settings-defaults-native/defaults.yaml

-James

> 
> Regards
> -Vijay
> On 4/3/19 4:30 PM, Vijay Khemka wrote:
>> Hi,
>> 
>> How are we storing persistent data in openbmc. Any data like Bios 
>> version or something we need to save across reboot.
>> 
> 
> A mix of settingsd https://github.com/openbmc/phosphor-settingsd and
> application specific persistence.
> 
> -James
> 
> 
>> Regards
>> 
>> -Vijay
>> 
