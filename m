Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K6pM1FT0zDq9n
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 06:02:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 11:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; d="scan'208";a="101662145"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 18 Dec 2018 11:02:16 -0800
Subject: Re: Fan speed control
To: Vijay Khemka <vijaykhemka@fb.com>, =?UTF-8?B?R2VvcmdlIExpdSjliJjplKE=?=
 =?UTF-8?B?5LyfKQ==?= <liuxiwei@inspur.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <a3125cb9-f3f8-2314-ea2f-1787b5292dd2@linux.intel.com>
 <E60EE44E-09FB-4D78-897B-CD0D0567929A@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <93064318-a17b-624b-89a0-033cb2cd8fa6@linux.intel.com>
Date: Tue, 18 Dec 2018 11:02:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <E60EE44E-09FB-4D78-897B-CD0D0567929A@fb.com>
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
X-List-Received-Date: Tue, 18 Dec 2018 19:02:20 -0000

On 12/18/18 10:57 AM, Vijay Khemka wrote:
> 
> 
> ﻿On 12/18/18, 8:59 AM, "openbmc on behalf of James Feist" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of james.feist@linux.intel.com> wrote:
> 
>      On 12/17/18 9:46 PM, George Liu(刘锡伟) wrote:
>      > Hi Vijay
>      >
>      > I am also learning about the fan configuration part of openbmc
>      > There is a draft https://github.com/lxwinspur/openbmc-doc.
>      > I hope it can be useful for you
>      >
>      > Regards
>      >
>      > -George
>      >
>      > On Tue, Dec 18, 2018 at 7:55 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>      >>
>      >> Team,
>      >>
>      >> I am looking for “fan speed control” feature to enable for Tiogapass. I understand that there are many approaches for this. Please point me to all implementation and any details about each approach, may be some pros and cons.
>      >>
>      
>      To my knowledge all recipes are here for fan control:
>      
>      https://github.com/openbmc/meta-phosphor/tree/master/recipes-phosphor/fans
> 
> Thanks James
>      
>      obmc-control-fan_git.bb - looks like a default fan speed script
> I don't see any source code for this.
>      
>      obmc-phosphor-fand.bb
> And for this also I am not seeing anything other than a simple while loop in obmc-phosphor-fand.c. I might be missing src file.
>      
>      phosphor-fan_git.bb
>      
>      phosphor-pid-control_git.bb
>      
Since you're using Entity-Manager, you might be interested in 
https://github.com/openbmc/phosphor-pid-control/blob/master/dbus/dbusconfiguration.cpp

>      >>
>      >>
>      >> Regards
>      >>
>      >> -Vijay
>      
> 
