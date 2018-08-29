Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420vFB2RrbzF33N
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 04:25:30 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2018 11:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,304,1531810800"; d="scan'208";a="66946108"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2018 11:25:27 -0700
Subject: Re: Single-Source
To: openbmc@lists.ozlabs.org
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
 <0DEA9298-A196-44BC-AEDA-A72BCCE93D77@fuzziesquirrel.com>
 <CAO=notxhB1dGiUwO0GiYQvJ0kxXu59C0hdc+MaFtittB58dwew@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <6a147d6f-35ee-3310-b671-cb886a4655df@intel.com>
Date: Wed, 29 Aug 2018 11:27:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxhB1dGiUwO0GiYQvJ0kxXu59C0hdc+MaFtittB58dwew@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Aug 2018 18:25:35 -0000

> still different to read every repo.  Of course, the clang-format
> doesn't do variables names (right?)

clang-format can't do variable renames, but clang-tidy can.

I've been experimenting with it a bit, and it seems to work pretty well, 
but requires a lot more work than clang-format to get set up on a given 
repo.  Right now I'm using the CMAKE_EXPORT_COMPILE_COMMANDS flag to 
generate the metadata that it needs to run.  At some point, I want to 
look into doing that automatically in the build scripts, but I'm not 
there yet.

A .clang-tidy file that approximates the OpenBMC style guides naming 
standard is here:
https://github.com/openbmc/bmcweb/blob/master/.clang-tidy
