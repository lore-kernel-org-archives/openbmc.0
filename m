Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ZxJV63z6zDrLK
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 02:42:33 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2018 08:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,393,1534834800"; d="scan'208";a="100254724"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 17 Oct 2018 08:42:26 -0700
Date: Wed, 17 Oct 2018 08:42:24 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: William Kennington <wak@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: New repo request "stdplus"
Message-ID: <20181017154224.GF8064@mauery.jf.intel.com>
References: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 15:42:35 -0000

On 15-Oct-2018 02:44 PM, William Kennington wrote:
>I'd like to request a new repo be created where we can put universally
>used c++ functions and classes that any of our projects could inherit
>from. This would not be allowed to have any runtime dependencies
>outside of the typical built-in ones (libstdc++, libc, and the kernel
>syscall interface).
>
>Right now I've got a smart file descriptor and signal blocking
>function which I'd like to include. It would look something like
>(although I actually want to break this down into a uniquefd and
>dupablefd for the purposes of stdplus):
>https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e8965e33f1f28985cf88d22d/src/gpioplus/internal/fd.hpp
>
>Let me know what you think,

I think a mmap interface might be nice to go in this library too. While 
there is a boost one, it does require linking against boost_filesystem 
IIRC. And it is a little heavy handed for most use cases.

--Vernon
