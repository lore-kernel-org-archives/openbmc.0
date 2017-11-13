Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybMWt4ZnDzDqhg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 07:22:50 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vADKJreG120016
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 15:22:47 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2e7ek1kacc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 15:22:46 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 13 Nov 2017 15:22:46 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Nov 2017 15:22:42 -0500
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vADKMgdA53739656; Mon, 13 Nov 2017 20:22:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB9EFAE03B;
 Mon, 13 Nov 2017 15:23:32 -0500 (EST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 29848AE03C;
 Mon, 13 Nov 2017 15:23:32 -0500 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Nov 2017 14:28:41 -0600
From: anoo <anoo@linux.vnet.ibm.com>
To: Nancy Yuen <yuenn@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>, Brad
 Bishop <bradleyb@fuzziesquirrel.com>, openbmc
 <openbmc-bounces+anoo=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: OpenBMC community telecom - call for 11/13 topics
In-Reply-To: <CADfYTpFLS4MO4iAYnw9i-LqS5_WNwkkqO7PX3kk6hXJB2KR1Zw@mail.gmail.com>
References: <4322480B-15BC-4260-9D78-917E823CB8D8@fuzziesquirrel.com>
 <CACPK8XfeOVFEq6mRSL2DKOJazSvGSPYHrG6OtEtNi+EeWptvWg@mail.gmail.com>
 <CADfYTpFLS4MO4iAYnw9i-LqS5_WNwkkqO7PX3kk6hXJB2KR1Zw@mail.gmail.com>
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 17111320-0024-0000-0000-000002F210CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008064; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000240; SDB=6.00945405; UDB=6.00477118; IPR=6.00725702; 
 BA=6.00005689; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017994; XFM=3.00000015;
 UTC=2017-11-13 20:22:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111320-0025-0000-0000-0000460573DA
Message-Id: <131f9b9846da161265b9554bd4bcb523@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-13_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1711130280
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
X-List-Received-Date: Mon, 13 Nov 2017 20:22:51 -0000

Inband update. Andrew J mentioned that the v3 mbox spec supports the 
current needs of Google in this area, so want to get a consensus to use 
mbox as the inband update mechanism for the reference implementation.

On 2017-11-13 13:51, Nancy Yuen wrote:
> I'd like to talk a bit more about testing.
> 
> ----------
> Nancy
> 
> On Sat, Nov 11, 2017 at 4:46 PM, Joel Stanley <joel@jms.id.au> wrote:
> 
>> On Sat, Nov 11, 2017 at 1:22 AM, Brad Bishop
>> <bradleyb@fuzziesquirrel.com> wrote:
>>> Please reply with any topics for the 11/13 call.
>> 
>> - Moving to a new base kernel (4.13)
>> 
>> Cheers,
>> 
>> Joel
