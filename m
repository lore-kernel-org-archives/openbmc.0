Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42n2dD6rVzzF36g
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 13:17:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Nov 2018 19:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,458,1534834800"; d="scan'208";a="105549900"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 02 Nov 2018 19:17:00 -0700
Received: from [10.249.168.176] (yongli3-mobl.ccr.corp.intel.com
 [10.249.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8425A580145;
 Fri,  2 Nov 2018 19:16:59 -0700 (PDT)
Subject: Re: Request to create a new repo intel-dbus-interfaces
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Feist, James" <james.feist@intel.com>, "Li, Yong B" <yong.b.li@intel.com>,
 spinler@us.ibm.com
References: <000001d47191$19096630$4b1c3290$@linux.intel.com>
 <AB60821F-6D24-4970-A1D0-FBAEFE5F8589@fuzziesquirrel.com>
From: "Li, Yong B" <yong.b.li@linux.intel.com>
Message-ID: <6e106c19-0611-dc44-b0a5-fd29d4f3c62b@linux.intel.com>
Date: Sat, 3 Nov 2018 10:16:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <AB60821F-6D24-4970-A1D0-FBAEFE5F8589@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Sat, 03 Nov 2018 02:17:05 -0000

Many thanks Brad!

Currently Please add me as a committer, I will move the previous code 
review into this new created repo

In the future, maybe need to add more committer, will consult you again.

Thanks,
Yong
On 11/2/2018 9:12 PM, Brad Bishop wrote:
> Hi Yong
>
>> On Oct 31, 2018, at 11:15 PM, Yong Li <yong.b.li@linux.intel.com> wrote:
>>
>> Hi Brad,
>>   
>> Based on the discussions in https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/14719/
>>   
>> We would like to create a new repo named “intel-dbus-interfaces”,  similar to “ibm-dbus-interfaces”, it is used to support some
>> Intel OEM IPMI commands, and other intel specific interfaces.
>>   
>> Thanks,
>> Yong
> intel-dbus-interfaces created.  Please let me know who to assign committer access to.
>
> thx - brad
