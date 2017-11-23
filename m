Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yj7QX6R5BzDqkJ
 for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2017 16:38:11 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2017 21:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,440,1505804400"; 
   d="scan'208";a="8533294"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.46])
 by orsmga001.jf.intel.com with ESMTP; 22 Nov 2017 21:38:07 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: <openbmc@lists.ozlabs.org>
Cc: "Li, Yong B" <yong.b.li@intel.com>
Subject: chassis_control.py in skeleton
Date: Thu, 23 Nov 2017 13:38:07 +0800
Message-ID: <000001d3641d$3e482120$bad86360$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdNkHJaAzlOOaAySRpypPsXG3mbaWg==
Content-Language: en-us
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDM1ODZmNGMtZDdmNS00YjY0LTlmZjctMzIwZDkxZGNmNWU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImJIeUdFWDZDSmUwUHZ1VUxrVnpcL0N5dFp5UFljdlB2b1wvMHAyTlE3OEdcL2c9In0=
X-Mailman-Approved-At: Fri, 24 Nov 2017 10:59:18 +1100
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
X-List-Received-Date: Thu, 23 Nov 2017 05:38:14 -0000

Hi All,

Based on my understanding, these chassis control/system manager related
projects in skeleton should be initial/reference code, and will be
rewritten/reimplementation. I would like to know if there is any plan or
on-going projects on them?

Thanks,
Yong Li
