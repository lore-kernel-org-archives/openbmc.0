Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4209sp3QvWzDr5Y
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 00:21:16 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 07:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,299,1531810800"; d="scan'208";a="79002358"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2018 07:21:14 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX108.amr.corp.intel.com ([169.254.2.233]) with mapi id 14.03.0319.002;
 Tue, 28 Aug 2018 07:21:14 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Henbin Chang <henbinchang@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [IPMBD] ipmbSend handling
Thread-Topic: [IPMBD] ipmbSend handling
Thread-Index: AQHUPnNWZWF/OSwTgUSzA28Sq50O0KTUrvqwgACeuID//+nXoA==
Date: Tue, 28 Aug 2018 14:21:13 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345836869@ORSMSX114.amr.corp.intel.com>
References: <CAG9c7cDKzx7VpmsrbeBuTQdVfQ7z3AYzGagWP0dKhSib7QkaZg@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836634@ORSMSX114.amr.corp.intel.com>
 <CAG9c7cALf94_127ZhA8a0aHOQeLdADcqi3QaedFa4tc64H5ZbA@mail.gmail.com>
In-Reply-To: <CAG9c7cALf94_127ZhA8a0aHOQeLdADcqi3QaedFa4tc64H5ZbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTU2OTNhNTgtZjFiMC00NjgyLWI5M2UtNGE3OTEzMDBlNGUxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSk1GNlhxY1ZQUGYycUltNytHaWJsZ29kMk1LSE52XC9QeWdOZG9uZkNSVVlQNUczQnd3XC9PQ0dZMkZJbWlvTDdpIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-List-Received-Date: Tue, 28 Aug 2018 14:21:19 -0000

VGhpcyBpcyB0aGUgc25pcHBldCBmcm9tIG15IHBhdGNoIHRvIG15IERUUyBmaWxlIHRoYXQgZW5h
YmxlcyB0aGUgc2xhdmUgcXVldWUsIGFsb25nIHdpdGggbXVsdGktbWFzdGVyIG9uIGkyYzAuDQoN
CismaTJjMCB7DQorICAgICAgIG11bHRpLW1hc3RlciA9IDwxPjsNCisgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KKw0KKyAgICAgICBpcG1iMEAxMCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJzbGF2ZS1tcXVldWUiOw0KKyAgICAgICAgICAgICAgIHJlZyA9IDwoMHgxMCB8IEkyQ19P
V05fU0xBVkVfQUREUkVTUyk+Ow0KKyAgICAgICAgICAgICAgIG1lc3NhZ2Utc2l6ZSA9IDwyNTY+
Ow0KKyAgICAgICAgICAgICAgIHF1ZXVlLXNpemUgPSA8MzI+Ow0KKyAgICAgICB9Ow0KK307DQo=
