Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K41G4dHGzDqVy
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 03:56:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 08:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,368,1539673200"; d="scan'208";a="101630495"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 18 Dec 2018 08:56:30 -0800
Subject: Re: Fan speed control
To: =?UTF-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a3125cb9-f3f8-2314-ea2f-1787b5292dd2@linux.intel.com>
Date: Tue, 18 Dec 2018 08:56:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Dec 2018 16:56:35 -0000

On 12/17/18 9:46 PM, George Liu(刘锡伟) wrote:
> Hi Vijay
> 
> I am also learning about the fan configuration part of openbmc
> There is a draft https://github.com/lxwinspur/openbmc-doc.
> I hope it can be useful for you
> 
> Regards
> 
> -George
> 
> On Tue, Dec 18, 2018 at 7:55 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>>
>> Team,
>>
>> I am looking for “fan speed control” feature to enable for Tiogapass. I understand that there are many approaches for this. Please point me to all implementation and any details about each approach, may be some pros and cons.
>>

To my knowledge all recipes are here for fan control:

https://github.com/openbmc/meta-phosphor/tree/master/recipes-phosphor/fans

obmc-control-fan_git.bb - looks like a default fan speed script

obmc-phosphor-fand.bb

phosphor-fan_git.bb

phosphor-pid-control_git.bb

>>
>>
>> Regards
>>
>> -Vijay
