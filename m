Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xdSw3TgXzDrp0
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 05:54:03 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2018 12:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,463,1520924400"; d="scan'208";a="45469746"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga007.jf.intel.com with ESMTP; 31 May 2018 12:53:48 -0700
Date: Thu, 31 May 2018 12:53:48 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Stewart Smith <stewart@linux.ibm.com>
Cc: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Security Working Group Kick Off
Message-ID: <20180531195348.GG105329@mauery>
References: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
 <87efhs43uo.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87efhs43uo.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 19:54:09 -0000

On 31-May-2018 06:38 PM, Stewart Smith wrote:
>Nancy Yuen <yuenn@google.com> writes:
>> The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
>> 31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
>> are interested in participating in this working group.
>
>Would topics like "security of the BMC from a hostile host" be part of
>this?

I would vote yes. From a platform architecture, while the pre-boot 
communications from the Host might be more trusted, after the OS boots, 
the host should be considered hostile.

>A design of OpenPOWER systems is that the BMC and the Host don't have to
>trust each other, and this should extend to a host that's hostile
>towards the BMC.

I agree. This is just a plain good design choice. :)

--Vernon

>I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
>we started fuzzing those interfaces.
>
>-- 
>Stewart Smith
>OPAL Architect, IBM.
>
