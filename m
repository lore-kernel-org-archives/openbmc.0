Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vMgY1r8XzF0gv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 04:25:43 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2018 11:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,266,1531810800"; d="scan'208";a="84902514"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.91.5])
 ([10.252.91.5])
 by orsmga002.jf.intel.com with ESMTP; 20 Aug 2018 11:24:52 -0700
Subject: Fwd: Reg libpam from yocto - destination folder
References: <b924fad1-406b-9961-8f93-0915ae1c28f5@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, vernon.mauery@linux.intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
X-Forwarded-Message-Id: <b924fad1-406b-9961-8f93-0915ae1c28f5@linux.intel.com>
Message-ID: <a88ee822-6f69-534f-9f19-88b0ffeb5da9@linux.intel.com>
Date: Mon, 20 Aug 2018 23:54:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b924fad1-406b-9961-8f93-0915ae1c28f5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Mon, 20 Aug 2018 18:25:46 -0000


Hi Brad / Vernon,

Regarding
https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11497/
(extending from yocto to receipe-core (to add few more pam modules),
which is why it is getting added by default in /lib/security, which is
part of initramfs).

Currently this breaks palmetto, zaius & romulus. Not sure, what should
be direction in order to fix the build failure (whether to clean / steal
from rw fs?).

In today's call, there was a question about why it has to be in
initramfs and not in rofs, and this are the following, and it can be
changed in different way, if it is not required

i.e If rofs is not mapped / any problem with it, we still need to allow
the root user login, which require's pam_unix.so in initramfs itself
i.e. under /lib/security

if above requirement is not needed, then the the same can be pulled and
installed under /usr/lib/security  (which will be in rofs instead of
initramfs).

Let me know your thoughts.

regards,

Richard
