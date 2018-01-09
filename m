Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zG6s21gKlzF0bH
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 20:53:06 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2018 01:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,335,1511856000"; d="scan'208";a="22569763"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.223.86.42])
 ([10.223.86.42])
 by orsmga001.jf.intel.com with ESMTP; 09 Jan 2018 01:52:59 -0800
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: User management - write-up - Draft - Review
Message-ID: <d8cc18b0-665c-d8a5-46bb-f9535de29391@linux.intel.com>
Date: Tue, 9 Jan 2018 15:22:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 09:53:10 -0000

All,

Sent gerrit review to start the discussion about the user management 
design. Please review and let's start discussing the comments.

https://gerrit.openbmc-project.xyz/#/c/8440/

Regards,

Richard
