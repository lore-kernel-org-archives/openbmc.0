Return-Path: <chandrasekarr@ami.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=chandrasekarr@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Bp7l1mKZzDqph
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 02:09:37 +1100 (AEDT)
X-AuditID: ac1060b2-0c9ff70000000d42-ca-5abd01ade447
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 8C.CB.03394.DA10DBA5; Thu, 29 Mar 2018 11:09:33 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0361.001; Thu, 29 Mar 2018 11:09:33 -0400
From: "Chandrasekar  R" <chandrasekarr@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: MORF - AMI's open source Redfish Framework in OpenBMC
Thread-Topic: MORF - AMI's open source Redfish Framework in OpenBMC
Thread-Index: AQHTxsUe2Js9qZZAMUuS1nmhfJ74AaPnT+0I
Date: Thu, 29 Mar 2018 15:09:32 +0000
Message-ID: <CB73477A6118784D86CBFCBB9D8B627502609A310A@atlms1.us.megatrends.com>
References: <CB73477A6118784D86CBFCBB9D8B627502609A1BCE@atlms1.us.megatrends.com>
In-Reply-To: <CB73477A6118784D86CBFCBB9D8B627502609A1BCE@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.98.195]
Content-Type: text/plain; charset="us-ascii"
content-transfer-encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42JZI5AwQ3ct494og463RhanWl6wODB6nJ+x
 kDGAMaqB0SYxLy+/JLEkVSEltTjZVimgKLMsMblSSSEzxVbJUEmhICcxOTU3Na/EVimxoCA1
 L0XJjksBA9gAlWXmKaTmJeenZOal2yp5BvvrWliYWuoaKtmFZKQqZOal5RflJpZk5ucpJOfn
 lQBVp6YARRUSujgzzsw9xlbwiq3iX8c3xgbGx6xdjJwcEgImEmveP2XvYuTiEBLYxSTx5s5C
 RgjnMKPEvVWrGUGq2AT0JRruTmUDsUUELCWWPGgHs4UF7CTaDs5gh4g7Syz+9Z8RwjaSaDl9
 hxnEZhFQlfjyfCoLiM0rECjR0XgQLC4EZD/6dIMJxOYUCJLoXLsG7CJGATGJ76fWgMWZBcQl
 bj2ZzwRxqYDEkj3nmSFsUYmXj/9BfaAo8ev6dGaIeh2JBbs/sUHY2hLLFr5mhtgrKHFy5hOW
 CYwis5CMnYWkZRaSlllIWhYwsqxiFEosyclNzMxJLzfUS8zN1EvOz93ECInzTTsYWy6aH2IU
 4GBU4uEN/LsnSog1say4MvcQowQHs5II73uN3VFCvCmJlVWpRfnxRaU5qcWHGJ2AwTKRWYob
 FEfASI83NjCQEoVxDE3MTMyNzA0tTcyNjZXEeRMuHYoUEkgHJp7s1NSC1CKYIUwcnFINjDlm
 6mxTMrcc6quW31WUmsXzP9n3bWLzuczEOL3FE7brMC5w3ZQ81+JmY9nnkPvLBQXea83bpX53
 yeppdx5L2casFv3cbeRb3vN3hRWXaVPIas/Et9xxEY19DGeYt1SXec6KPHBzr2rsk1/MfYLl
 UyseqW40rmI+aibMwWWqWzDr2ZTu6hx9JZbijERDLeai4kQAKqk4dxYDAAA=
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2018 15:09:40 -0000

@OpenBMC Redfish working group:=0A=
=0A=
As we discussed on 3/26 call, AMI has made Megarac Open Redfish Framework av=
ailable as open-source under Apache 2.0 License. It is available in Github:=
 https://github.com/ami-megarac/=0A=
=0A=
To use it in OpenBMC, build instruction are provided in https://github.com/a=
mi-megarac/MORF-OpenBMC=0A=
=0A=
If anyone faces any issues or willing to provide suggestions please raise a=
 Github Issue and we will look into it.=0A=
=0A=
Based on request, we have made the presentation used during the call availab=
le here https://github.com/ami-megarac/MORF-docs/blob/master/MegaRAC%20Open%=
20Redfish%20Framework%20(MORF).pdf=0A=
=0A=
PS: Previous attempts to send these details were blocked because of attachme=
nt size restrictions in the mailing list. Sorry for the delay.=0A=
=0A=
Thanks=0A=
Chandrasekar=0A=

Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends, Inc.  This communication is intended to be read on=
ly by the individual or entity to whom it is addressed or by their designee.=
 If the reader of this message is not the intended recipient, you are on not=
ice that any distribution of this message, in any form, is strictly prohibit=
ed.  Please promptly notify the sender by reply e-mail or by telephone at 77=
0-246-8600, and then delete or destroy all copies of the transmission.
