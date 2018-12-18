Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K5cb3ghSzDqTF
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 05:08:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 10:08:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,368,1539673200"; d="scan'208";a="101649141"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 18 Dec 2018 10:08:44 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: James Feist <james.feist@linux.intel.com>
Subject: flto automake
Message-ID: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
Date: Tue, 18 Dec 2018 10:08:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 18 Dec 2018 18:08:48 -0000

If you aren't planning on enabling flto in a repo you can ignore this email.


I've created a new class flto-automake 
https://github.com/openbmc/meta-phosphor/blob/master/classes/flto-automake.bbclass 
if you are enabling -flto in an autotools project you might be 
interested in. When using static libraries you may run into undefined 
references when building with Yocto. Yocto by default uses:

export AR = "${HOST_PREFIX}ar"
export RANLIB = "${HOST_PREFIX}ranlib"

for AR and RANLIB. This new class replaces these with the gcc equivalent 
wrappers that can work with the flto object files. This doesn't seem to 
be an issue for the CI build, it only shows up for Yocto builds. 
Reference: 
http://stackoverflow.com/questions/25878407/how-can-i-use-lto-with-static-libraries#comment67660913_25878408

For Cmake I suggest looking at the way bmcweb handles it in CMakesLists:
https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L92

Thanks,

James
