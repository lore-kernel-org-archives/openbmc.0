Return-Path: <jason.m.bills@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420G8q1bwXzDrb6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:34:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 10:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="257951444"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2018 10:34:26 -0700
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 28 Aug 2018 10:34:26 -0700
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.230]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.30]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 10:34:26 -0700
From: "Bills, Jason M" <jason.m.bills@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: 
Thread-Index: AdQ+9VxtajyD/IcCQmKiG0tbrUk3/Q==
Date: Tue, 28 Aug 2018 17:34:26 +0000
Message-ID: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2RjYjI0YzgtOTQwYi00NTRhLTljNWMtZGEwNGE1NzFkYmFiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicWx4Nnhoa0dlbDRuY1M3UkpzTUNGaHFoT2E4S1ZUOGZsR2VUUGZMSlo5VEJSSTl0RmRTU3ZYNklwY1pMZ3BxUSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 28 Aug 2018 17:34:36 -0000

I just added a comment to a github discussion about the IPMI SEL and though=
t I should share it here as well:

I have been working on a proof-of-concept to move the IPMI SEL entries out =
of D-Bus into journald instead.

Since journald allows custom metadata for log entries, I've thought of havi=
ng the SEL message logged to the journal and using metadata to store the ne=
cessary IPMI info associated with the entry. Here is an example of logging =
a type 0x02 system event entry to journald:

sd_journal_send("MESSAGE=3D%s", message.c_str(),
                            "PRIORITY=3D%i", selPriority,
                            "MESSAGE_ID=3D%s", selMessageId,
                            "IPMI_SEL_RECORD_ID=3D%d", recordId,
                            "IPMI_SEL_RECORD_TYPE=3D%x", selSystemType,
                            "IPMI_SEL_GENERATOR_ID=3D%x", genId,
                            "IPMI_SEL_SENSOR_PATH=3D%s", path.c_str(),
                            "IPMI_SEL_EVENT_DIR=3D%x", assert,
                            "IPMI_SEL_DATA=3D%s", selDataStr,
                            NULL);
Using journald should allow for scaling to more SEL entries which should al=
so enable us to support more generic IPMI behavior such as the Add SEL comm=
and.

-Jason
