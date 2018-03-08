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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxwS869YBzF1tv
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 03:09:11 +1100 (AEDT)
X-AuditID: ac1060b2-f05ff70000007fe2-c7-5aa160227048
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 8D.5E.32738.22061AA5; Thu,  8 Mar 2018 11:09:07 -0500 (EST)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0361.001; Thu, 8 Mar 2018 11:09:06 -0500
From: "Chandrasekar  R" <chandrasekarr@ami.com>
To: "ed.tanous@intel.com" <ed.tanous@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: openbmc Digest, Vol 31, Issue 12
Thread-Topic: openbmc Digest, Vol 31, Issue 12
Thread-Index: AQHTtaBlf9TMe1EZ9EWrKU44iIpsoqPGgwro
Date: Thu, 8 Mar 2018 16:09:05 +0000
Message-ID: <CB73477A6118784D86CBFCBB9D8B62750260962A5C@atlms1.us.megatrends.com>
References: <mailman.1499.1520377783.10144.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.1499.1520377783.10144.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.98.195]
Content-Type: text/plain; charset="us-ascii"
content-transfer-encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWyRiBhhq5ywsIogyWbJC0O7/C0ONXygsWB
 yWPxnpdMHudnLGQMYIpqYLRJzMvLL0ksSVVISS1OtlUKKMosS0yuVFLITLFVMlRSKMhJTE7N
 Tc0rsVVKLChIzUtRsuNSwAA2QGWZeQqpecn5KZl56bZKnsH+uhYWppa6hkp2IRmpCpl5aflF
 uYklmfl5Csn5eSVA1akpQFGFhC7OjBmPYgq+c1Y8P32NsYFxPkcXIyeHhICJxN72n4xdjFwc
 QgK7mCQ67t5igXAOMUq09B9nAqliE9CXaLg7la2LkYNDBMhed44HJMwsYCmx+eMldhBbWEBX
 4sX+32C2iICexIJv01ghbCOJT1O+M4PYLAIqElvW3WUDsXkFAiWuT1gENl5IwEXi4J8JjCA2
 p4CrxOSeL2D1jAJiEt9PrWGC2CUucevJfCaIowUkluw5zwxhi0q8fPyPFcJWlPh1fTozRL2O
 xILdn9ggbG2JZQtfM0PsFZQ4OfMJywRG0VlIxs5C0jILScssJC0LGFlWMQolluTkJmbmpJcb
 6iXmZuol5+duYoQkg007GFsumh9iFOBgVOLhXRW9MEqINbGsuDIXGJIczEoivAH6QCHelMTK
 qtSi/Pii0pzU4kOMTsBgmcgsxQ2KLWD0xxsbGEiJwjiGJmYm5kbmhpYm5sbGSuK8CZcORQoJ
 pAOTUXZqakFqEcwQJg5OqQbGgp7zLBMEjj+I38+Rx7yEy8pu1rqtfyXPi6Ymiq3exWros4lF
 +0fbP51umyy1ba+fO6yU1H596iKnjF74rZ9yAtvW+y5X36HCPmPj6h8O/F8SpM6ds3+cFX0u
 RsHu7YGT9mISFdYLGF/rTkm8eNx32YZ7++Wex5hU3NnyJ/T7/DpWie22F/rfK7EUZyQaajEX
 FScCABNwz7EpAwAA
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
X-List-Received-Date: Thu, 08 Mar 2018 16:09:14 -0000

Ed,=0A=
=0A=
It is not yet there. We are in the process of making it is available open. W=
e will announce it as soon as it is available.=0A=
=0A=
Thanks=0A=
Chandrasekar=0A=
=0A=
-----=0A=
=0A=
Date: Tue, 6 Mar 2018 08:56:42 -0800=0A=
From: Ed Tanous <ed.tanous@intel.com>=0A=
To: Michael.E.Brown@dell.com, openbmc@lists.ozlabs.org,=0A=
        Paul.Vancil@dell.com,  hramasub@in.ibm.com, Balaji.B.Rao@dell.com,=
=0A=
        bradleyb@fuzziesquirrel.com, jwcarman@us.ibm.com,=0A=
        pradeep.kumar36@tcs.com, rolfb@us.ibm.com, Chris.Ong@microsoft.com,=
=0A=
        alirhas@microsoft.com, yupalani@microsoft.com=0A=
Cc: Krishna.Kolakaluri@deltaww.com=0A=
Subject: Re: Meeting Minutes 2018-03-05: OpenBMC Redfish working group=0A=
        working call=0A=
Message-ID: <a6c93af9-9202-ada7-5d6a-2eb8f64a946e@intel.com>=0A=
Content-Type: text/plain; charset=3Dwindows-1252; format=3Dflowed=0A=
=0A=
On 03/06/2018 08:50 AM, Michael.E.Brown@dell.com wrote:=0A=
>=0A=
>   * AMI has a LUA (luajit) implementation for redfish=0A=
>   * AMI would like to present their solution=0A=
>   *=0A=
>=0A=
Chandrasekhar,=0A=
=0A=
Is your implementation available with an open license somewhere I can=0A=
pull it down?=0A=
=0A=
-Ed=0A=
=0A=
=0A=

Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends, Inc.  This communication is intended to be read on=
ly by the individual or entity to whom it is addressed or by their designee.=
 If the reader of this message is not the intended recipient, you are on not=
ice that any distribution of this message, in any form, is strictly prohibit=
ed.  Please promptly notify the sender by reply e-mail or by telephone at 77=
0-246-8600, and then delete or destroy all copies of the transmission.
