Return-Path: <prvs=98122a04e=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=98122a04e=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44T1Yn06WczDqD4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 17:34:03 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 26 Mar 2019 14:33:58 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 26 Mar
 2019 14:33:55 +0800
Received: from mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc]) by
 mailbx05.quanta.corp ([fe80::34d4:593b:40f8:a9bc%4]) with mapi id
 15.01.1713.004; Tue, 26 Mar 2019 14:33:55 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "emilyshaffer@google.com"
 <emilyshaffer@google.com>, "benjaminfair@google.com"
 <benjaminfair@google.com>
CC: =?big5?B?UmljaGFyZCBUdW5nICi4s6vbq8wp?= <Richard.Tung@quantatw.com>,
 =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>,
 =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
Subject: =?big5?B?pl6mrDogW09wZW5CTUNdIFtwaG9zcGhvci1zZWwtbG9nZ2VyXSBQcm9wZXJ0eSB0?=
 =?big5?Q?ype_conversion_and_the_value_of_getScaledIPMIValue?=
Thread-Topic: [OpenBMC] [phosphor-sel-logger] Property type conversion and the
 value of getScaledIPMIValue
Thread-Index: AQHU453iK2KmjdIAikG8izI1BeFM8w==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 17
X-FaxNumberOfPages: 0
Date: Tue, 26 Mar 2019 06:33:55 +0000
Message-ID: <cb747c9ef9f545d98105f9dd6fb2993b@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24510.006
x-tm-as-result: No--0.659300-0.000000-31
x-tm-as-matchedid: 140026-550199-701625-704425-700685-148004-148133-10018-30
 063-41000-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 26 Mar 2019 06:34:05 -0000

R2VvcmdlIEh1bmcgKKx4qb63cSkgp8ax5qZepqyzb6vKtmyl8yBbW09wZW5CTUNdIFtwaG9zcGhv
ci1zZWwtbG9nZ2VyXSBQcm9wZXJ0eSB0eXBlIGNvbnZlcnNpb24gYW5kIHRoZSB2YWx1ZSBvZiBn
ZXRTY2FsZWRJUE1JVmFsdWVdoUM=
