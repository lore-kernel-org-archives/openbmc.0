Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m0dT3chhzDqk9
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 04:43:23 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2018 11:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,458,1531810800"; d="scan'208";a="63370723"
Received: from skyhawk.jf.intel.com (HELO [10.7.150.62]) ([10.7.150.62])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2018 11:43:11 -0700
Subject: Re: clang-fromat-ignore
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notxyH1+UcYhyhjDiw8vdnkU5SfQ6bmJKhBnWq4Gc5=ZTZw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <878d9eee-ea70-7c61-ef58-61af83704222@linux.intel.com>
Date: Wed, 8 Aug 2018 11:43:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxyH1+UcYhyhjDiw8vdnkU5SfQ6bmJKhBnWq4Gc5=ZTZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 18:43:26 -0000

On 08/08/2018 11:25 AM, Patrick Venture wrote:
> I haven't been able to find a good answer on this, but from reading
> the man page, there's no built-in mechanism for having clang-format
> skip some files.  I wanted to check on this before fixing the script
> that calls clang-format in our CI.  I've added a submodule to a

I'm not sure how the CI handles this, but if the clang-format is ran 
before the submodule init, and each build is from a clean tree, 
shouldn't that work?

> project, and that project doesn't follow our style -- so ignoring the
> folder lock, stock, is the right approach.
> 
> Patrick
> 
