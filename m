Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YYRG0DKWzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 02:44:08 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 08:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,301,1549958400"; d="scan'208";a="130828345"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 02 Apr 2019 08:44:05 -0700
Subject: Re: phosphor-pid-control
To: =?UTF-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: "venture@google.com" <venture@google.com>
References: <8C90805A11C9DD4EBFF49F10081DE1EA86E271@jtjnmailbox08.home.langchao.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <60d4593e-8904-669c-1700-1efce377ca3f@linux.intel.com>
Date: Tue, 2 Apr 2019 08:44:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <8C90805A11C9DD4EBFF49F10081DE1EA86E271@jtjnmailbox08.home.langchao.com>
Content-Type: text/plain; charset=gbk; format=flowed
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
X-List-Received-Date: Tue, 02 Apr 2019 15:44:11 -0000

On 4/2/19 5:43 AM, George Liu (ÁõÎýÎ°) wrote:
> Hi, All:
> 
> Excuse me, I have a problem, 727 lines of dbus/dbusconfiguration.cpp in 
> the phosphor-pid-control code,
> 
> which I think is info.stepwiseInfo.NegativeHysteresis, as follows:
> 
> If (findPosHyst != base.end())
> 
> {
> 
> info.stepwiseInfo.positiveHysteresis = std::visit(
> 
> VariantToDoubleVisitor(), findPosHyst->second);
> 
> }
> 
> If (findNegHyst != base.end())
> 
> {
> 
> info.stepwiseInfo.positiveHysteresis = std::visit(
> 
> VariantToDoubleVisitor(), findNegHyst->second);
> 
> }
> 
> What do you think?

Good catch, fix is here: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-pid-control/+/20031

-James

> 
> Thanks!
> 
