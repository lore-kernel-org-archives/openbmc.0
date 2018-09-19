Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fpj171L8zDrcY
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 04:45:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2018 11:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,395,1531810800"; d="scan'208";a="264983171"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.12])
 ([10.241.242.12])
 by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2018 11:45:54 -0700
Subject: Re: Repository Growth
To: openbmc@lists.ozlabs.org
References: <dVwK1y00D1vEVCc01VwKs6@charter.net>
 <CALLMt=pqSRi90cju_Gr1gBe+n9giWeM6LHYQ=MTnKDGEaaVifA@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <8af8dac8-3dc1-1e21-9ff9-0aae0337f769@linux.intel.com>
Date: Wed, 19 Sep 2018 11:45:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=pqSRi90cju_Gr1gBe+n9giWeM6LHYQ=MTnKDGEaaVifA@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Sep 2018 18:45:58 -0000


>>>> The maintenance of it would be horrible for one
>>>> person, but if someone wants their repository to have details and so
>>>> on they can add it.
>>>>

Is it possible to scrape some of this info from github, gerrit, etc.? 
Perhaps portions of this could be automated to help with maintenance and 
to keep the information up-to-date.
