Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4486Cf2FGmzDq7n
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 05:04:44 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2019 10:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,416,1544515200"; d="scan'208";a="150193985"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga001.fm.intel.com with ESMTP; 26 Feb 2019 10:04:40 -0800
Date: Tue, 26 Feb 2019 10:04:40 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Max IPMI buffer size
Message-ID: <20190226180440.GD44612@mauery.jf.intel.com>
References: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
 <CAJoAoZnKrtDtaH91hn7OPtaBnmQiGR1GP32D+PAqdwaRaHpmYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJoAoZnKrtDtaH91hn7OPtaBnmQiGR1GP32D+PAqdwaRaHpmYQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Tue, 26 Feb 2019 18:04:47 -0000

On 25-Feb-2019 05:45 PM, Emily Shaffer wrote:
>Personally I'd like to see this implemented as something we can configure
>at compile time, what do others think?

My goal was to be able to set this in the 
/usr/share/ipmi-provider/channel_config.json file. Each channel can 
specify its max transfer size. Then, there is a libchannellayer API that 
can provide that value to anyone that cares.

--Vernon

>On Fri, Feb 22, 2019 at 4:07 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>> Team,
>>
>> I see definition of MAX_IPMI_BUFFER is 64 in phosphor-ipmi-host/ipmid.hpp.
>> And there is a comment that BT FIFO in AST2400 can handle only 64 bytes. We
>> are using AST2500 and for our IPMB OEM command, we need buffer max size to
>> be 256. Please suggest how to about changes.
>>
>>
>>
>> Regards
>>
>> -Vijay
>>
