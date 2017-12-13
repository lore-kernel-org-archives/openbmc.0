Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxLPD1Q9bzDrYT
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 13:34:23 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2017 18:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,396,1508828400"; d="scan'208";a="186471534"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.138])
 by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2017 18:34:17 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
Cc: <yong.b.li@linux.intel.com>
Subject: system_232 upgrade to 234?
Date: Wed, 13 Dec 2017 10:34:17 +0800
Message-ID: <000001d373ba$e03dbc90$a0b935b0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdNzuLX2kmkjpwZTQAazqSrSdGZ2Hw==
Content-Language: en-us
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzIzZjM2MWUtYTliYi00NmY1LWFjOWYtYTViNDA0YjU5Mzg1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlEyQk9iSmpXdDJWZWhzMVZ5dFlUbmRzdyt0cWpSTWtZUng3cU1QdFl0Y009In0=
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
X-List-Received-Date: Wed, 13 Dec 2017 02:34:25 -0000

Hi All,

 I am working on the replacement for
chassis_control.py(https://github.com/openbmc/skeleton/blob/master/pychassis
ctl/chassis_control.py), using
https://github.com/openbmc/phosphor-state-manager. And would like to add the
uuid property into chassis-stats-manager.

I found this uuid property is using the same content in /etc/machine-id(from
the above chassis_contro.py). Based on
https://www.freedesktop.org/software/systemd/man/machine-id.html: This ID
uniquely identifies the host. It should be considered "confidential", and
must not be exposed in untrusted environments, in particular on the network.
And there is a new API(sd_id128_get_machine_app_specific(3)) to generate an
application specific ID.

It seems to me that we need to use the new systemd API to change the current
uuid generation logic. I can cherry-pick several systemd patch files to
backport the new API from 234 to 232. Or can we just upgrade the current
systemd_232 to 234(from yocto 2.4)? Any doc/plan about the upgrade?

Thanks for your comments/suggestions!

Yong Li
